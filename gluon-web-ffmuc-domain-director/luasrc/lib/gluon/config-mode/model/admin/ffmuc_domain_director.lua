local uci = require("simple-uci").cursor()

local f = Form(translate("Multidomain"))

local s = f:section(Section, nil, translate('gluon-web-ffmuc-domain-director:description'))

local enabled = s:option(Flag, "enabled", translate("Enabled"))
enabled.default = uci:get_bool('ffmuc', 'director', 'enabled', false)

function f:write()
	if enabled.data then
		uci:set('ffmuc', 'director', 'enabled', true)
	else
		uci:set('ffmuc', 'director', 'enabled', false)
	end
	uci:commit('ffmuc')
end

return f
