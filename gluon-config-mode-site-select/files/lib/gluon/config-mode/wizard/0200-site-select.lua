local cbi = require "luci.cbi"
local uci = luci.model.uci.cursor()
local site = require 'gluon.site_config'
local fs = require "nixio.fs"

local sites = {}
local M = {}

function M.section(form)
	local s = form:section(cbi.SimpleSection, nil, [[
	Hier hast du die Möglichkeit die Community, mit der sich dein
	Knoten verbindet, auszuwählen. Bitte denke daran, dass dein Router
	sich dann nur mit dem Netz der ausgewählten Community verbindet.
	]])
		
	local o = s:option(cbi.ListValue, "site_code", "Segment")
	o.rmempty = false
	o.optional = false

	if uci:get_first("gluon-setup-mode", "setup_mode", "configured") == "0" then
		o:value("")
	else
		o:value(site.site_code, site.site_name)
	end
        
        for site in fs.dir("/lib/gluon/site-select") do
                -- trim ".conf"
                local s = string.sub(site, 1, -6)
                -- add to list
                o:value(s, s) 
        end

end

function M.handle(data)

	if data.site_code ~= site.site_code then
		-- copy new site conf
		fs.copy('/lib/gluon/site-select/' .. data.site_code .. '.conf', '/lib/gluon/site.conf')
		-- store new site conf in uci currentsite
                uci:set('currentsite', 'current', 'name', data.site_code)
		uci:save('currentsite')
		uci:commit('currentsite')		
		os.execute('sh "/lib/gluon/site-upgrade"')
	end
end

return M
