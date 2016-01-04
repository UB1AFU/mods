local LANG = GetModConfigData("LANG")

if LANG == "simplified" then
	LoadPOFile("DST_chs.po", "chs")
elseif LANG == "traditional" then
	LoadPOFile("DST_cht.po", "cht")
end