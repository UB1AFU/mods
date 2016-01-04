name = "Chinese Language Pack"
description = "中文语言包"
author = "L.YUN"
version = "1.3.2"
forumthread = ""
api_version = 10
dst_compatible = true
icon_atlas = "modicon.xml"
icon = "modicon.tex"
all_clients_require_mod = false
client_only_mod = true
server_filter_tags = {"chinese"}

configuration_options =
{
	{
		name = "LANG",
		label = "更换语言",
		hover = "更换游戏语言",
		options =	{
						{description = "游戏默认", data = "default", hover = "使用游戏默认的语言"},
						{description = "简体中文", data = "simplified", hover = "使用简体中文语言"},
						{description = "繁体中文", data = "traditional", hover = "使用繁体中文语言"},
					},
		default = "simplified",
	},
}