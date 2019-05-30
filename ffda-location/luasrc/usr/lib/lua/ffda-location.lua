local io = io
local ipairs = ipairs
local os = os
local pairs = pairs
local require = require
local string = string
local table = table
local tonumber = tonumber

module 'ffda-location'

-- Returns all available WiFi networks on all wireless interfaces
-- https://github.com/FreifunkHochstift/ffho-packages/blob/master/ffho/ffho-autoupdater-wifi-fallback/luasrc/usr/lib/lua/autoupdater-wifi-fallback/util.lua#L5
function get_available_wifi_networks()
	local iwinfo = require 'iwinfo'
	local uci = require('simple-uci').cursor()

	local radios = {}
	uci:foreach('wireless', 'wifi-device',
		function(s)
			-- Start with the assumption we won't use the device
			local use_device = false
			uci:foreach('wireless', 'wifi-iface',
				function (t)
					if (t['device'] == s['.name']) then
						if (t['ifname'] == nil) then
							-- Don't use private WiFi for test scan
							return
						end

						-- Perform test scan to detect possible WiFi hang, which would stall libiwinfo scan forever
						-- Probably needs an upstream fix, but this is pending
						local handle = io.popen("iw dev " ..t['ifname'].." scan > /dev/null 2>&1; echo $?")
						local out_string = handle:read("*a")
						handle:close()

						if tonumber(out_string) == 0 then
							-- Scan successful, use this device for libiwinfo scan
							use_device = true
						end
					end
				end
			)
			if use_device then
				radios[s['.name']] = {}
			end
		end
	)

	for radio, _ in pairs(radios) do
		local wifitype = iwinfo.type(radio)
		local iw = iwinfo[wifitype]
		if not iw then
			return null
		end

		local tmplist = iw.scanlist(radio)
		for _, net in ipairs(tmplist) do
			if net.ssid and net.bssid then
				table.insert (radios[radio], net)
			end
		end
	end
	return radios
end

-- Returns json array-string of supplied wifi networks
function generate_wifi_json(wifis)
	local json = require 'jsonc'
	wifi_table = {}
	for k, v in pairs(wifis) do
		for _, wifi in ipairs(v) do
			local single_network = {}
			single_network["bssid"] = wifi.bssid
			single_network["signal"] = wifi.signal
			table.insert(wifi_table, single_network)
		end
	end
	return json.stringify(wifi_table)
end

-- Encodes string to use as HTTP parameter
-- https://gist.github.com/ignisdesign/4323051
function urlencode(str)
	if (str) then
		str = string.gsub (str, "\n", "\r\n")
		str = string.gsub (str, "([^%w ])", function (c) return string.format ("%%%02X", string.byte(c)) end)
		str = string.gsub (str, " ", "+")
	end
	return str
end

-- Scans WiFi environment and queries remote.
-- Returns response as string.
function query_remote(remote)
	local wifi_json = generate_wifi_json(get_available_wifi_networks())
	local handle = io.popen("wget -T 30 -qO -  --post-data=wifis=" ..urlencode(wifi_json) .. " "..remote)
	local return_str =  handle:read("*a")
	handle:close()
	return return_str
end