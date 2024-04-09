codes = true
std = "min"
self = false

read_globals = {
	"getfenv",
	"setfenv",
	"unpack",
}

-- exclude old and unmaintained files
exclude_files = {
	"ffho-autoupdater-wifi-fallback/luasrc/usr/lib/lua/autoupdater-wifi-fallback/util.lua",
	"ffho-autoupdater-wifi-fallback/luasrc/usr/sbin/autoupdater-wifi-fallback",
	"ffho-autoupdater-wifi-fallback/luasrc/usr/sbin/wpa_supplicant",
	"ffho-web-ap-timer/luasrc/lib/gluon/config-mode/model/admin/ap-timer.lua",
}

include_files = {
	"**/*.lua",
	"**/luasrc/**/*",
}

files["**/luasrc/lib/gluon/config-mode*/*"] = {
	globals = {
		"Element",
		"DynamicList",
		"Flag",
		"Form",
		"i18n",
		"ListValue",
		"renderer.render",
		"renderer.render_string",
		"Section",
		"TextValue",
		"_translate",
		"translate",
		"translatef",
		"Value",
		"Warning"
	},
}

files["**/luasrc/lib/gluon/config-mode-runtime/*"] = {
	globals = {
		"Auth"
	},
}

files["**/check_site.lua"] = {
	read_globals = {
		"alternatives",
		"extend",
		"in_domain",
		"in_site",
		"need",
		"need_alphanumeric_key",
		"need_array",
		"need_array_of",
		"need_boolean",
		"need_chanlist",
		"need_domain_name",
		"need_number",
		"need_number_range",
		"need_one_of",
		"need_string",
		"need_string_array",
		"need_string_array_match",
		"need_string_match",
		"need_table",
		"need_value",
		"obsolete",
		"table_keys",
		"this_domain",
	},
}

files["**/luasrc/lib/gluon/**/controller/*"] = {
	read_globals = {
		"_",
		"alias",
		"call",
		"entry",
		"model",
		"node",
		"template",
	},
}
