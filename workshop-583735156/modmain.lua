PrefabFiles = {
	"north",
	"north_none",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/north.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/north.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/north.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/north.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/north_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/north_silho.xml" ),

    Asset( "IMAGE", "bigportraits/north.tex" ),
    Asset( "ATLAS", "bigportraits/north.xml" ),
	
	Asset( "IMAGE", "images/map_icons/north.tex" ),
	Asset( "ATLAS", "images/map_icons/north.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_north.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_north.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_north.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_north.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_north.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_north.xml" ),
	
	Asset( "IMAGE", "images/names_north.tex" ),
    Asset( "ATLAS", "images/names_north.xml" ),
	
    Asset( "IMAGE", "bigportraits/north_none.tex" ),
    Asset( "ATLAS", "bigportraits/north_none.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.north = "雪人"
STRINGS.CHARACTER_NAMES.north = "诺思"
STRINGS.CHARACTER_DESCRIPTIONS.north = "*能生存在寒冷季节\n*温度高会很虚弱\n*脾气暴躁"
STRINGS.CHARACTER_QUOTES.north = "\"我为什么会有麻烦?\""

-- Custom speech strings
STRINGS.CHARACTERS.NORTH = require "speech_north"

-- The character's name as appears in-game 
STRINGS.NAMES.NORTH = "诺思"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.NORTH = 
{
	GENERIC = "是 诺思!",
	ATTACKER = "诺思真机智...",
	MURDERER = "凶手!",
	REVIVER = "诺思， 幽灵的朋友.",
	GHOST = "诺思可以使用一颗心.",
}


AddMinimapAtlas("images/map_icons/north.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("north", "MALE")

