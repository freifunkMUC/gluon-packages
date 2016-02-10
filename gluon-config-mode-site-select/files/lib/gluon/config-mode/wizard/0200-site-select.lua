local cbi = require "luci.cbi"
local uci = luci.model.uci.cursor()
local site = require 'gluon.site_config'
local fs = require "nixio.fs"
local i18n = require "luci.i18n"

local sites = {}
local M = {}

function M.section(form)
	local s = form:section(cbi.SimpleSection, nil, 
                i18n.translate("Please choose the site code of your segment"))
		
	local o = s:option(cbi.ListValue, "site_code", "Segment")
	o.rmempty = false
	o.optional = false

	if uci:get_first("gluon-setup-mode", "setup_mode", "configured") == "0" then
		o:value("")
	else
		o:value(site.site_code, site.site_name)
	end
        
        for filename in fs.dir("/lib/gluon/site-select") do
                -- trim file extension ".json"
                sitecode = string.sub(filename, 1, -6)

                -- getting site_name from json file
                f = io.open("/lib/gluon/site-select/" .. filename, "r")
                fcontent = f:read("*a")
                _, _, sitename = string.find(fcontent, "\"site_name\":\"(.-)\",")

                -- add to list
                o:value(sitecode, sitename) 
        end

end

function M.handle(data)

	if data.site_code ~= site.site_code then
		-- copy new site conf
		fs.copy('/lib/gluon/site-select/' .. data.site_code .. '.json', '/lib/gluon/site.json')
		-- store new site conf in uci currentsite
                uci:set('currentsite', 'current', 'name', data.site_code)
		uci:save('currentsite')
		uci:commit('currentsite')		
		os.execute('sh "/lib/gluon/site-upgrade"')
	end
end

return M
