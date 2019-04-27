local uci = require("simple-uci").cursor()

local f = Form(translate("Multidomain"))

local s = f:section(Section, nil, translate('gluon-web-ffda-domain-director:description'))

local enabled = s:option(Flag, "enabled", translate("Enabled"))
enabled.default = uci:get_bool('ffda', 'director', 'enabled', false)

function f:write()
	if enabled.data then
		uci:set('ffda', 'director', 'enabled', true)
	else
		uci:set('ffda', 'director', 'enabled', false)
	end
	uci:commit('ffda')
end

return f
