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
	
	uci:foreach('siteselect', 'site',
	function(s)
		table.insert(sites, s['.name'])
	end
	)
	
	local o = s:option(cbi.ListValue, "community", "Community")
	o.rmempty = false
	o.optional = false

	if uci:get_first("gluon-setup-mode", "setup_mode", "configured") == "0" then
		o:value("")
	else
		o:value(site.site_code, site.site_name)
	end

	for index, site in ipairs(sites) do
		o:value(site, uci:get('siteselect', site, 'sitename'))
	end

end

function M.handle(data)

	if data.community ~= site.site_code then
		
		fs.copy(uci:get('siteselect', data.community , 'path'), '/lib/gluon/site.conf')
		uci:set('currentsite', 'current', 'name', data.community)
		uci:save('currentsite')
		uci:commit('currentsite')		
		os.execute('sh "/lib/gluon/site-upgrade"')
	end
end

return M