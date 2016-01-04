PrefabFiles = {
	"willrick",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/willrick.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/willrick.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/willrick.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/willrick.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/willrick_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/willrick_silho.xml" ),

    Asset( "IMAGE", "bigportraits/willrick.tex" ),
    Asset( "ATLAS", "bigportraits/willrick.xml" ),
	
	Asset( "IMAGE", "images/map_icons/willrick.tex" ),
	Asset( "ATLAS", "images/map_icons/willrick.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_willrick.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_willrick.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_willrick.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_willrick.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.willrick = "瘟疫医生"
STRINGS.CHARACTER_NAMES.willrick = "Esc"
STRINGS.CHARACTER_DESCRIPTIONS.willrick = "*虚弱的战争工艺\n*没有食欲\n*始于一个时髦的包 (N/A)"
STRINGS.CHARACTER_QUOTES.willrick = "\"在病痛中死去, 还是依靠医学的艺术重生.\""

-- Custom speech strings
STRINGS.CHARACTERS.WILLRICK = require "speech_willrick"

-- The character's name as appears in-game 
STRINGS.NAMES.WILLRICK = "Esc"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.WILLRICK = 
{
	GENERIC = "是 Esc!",
	ATTACKER = "Esc 看起来很机智.",
	MURDERER = "凶手!",
	REVIVER = "Esc, 幽灵的朋友.",
	GHOST = "Esc 应该使用一个心脏.",
}


AddMinimapAtlas("images/map_icons/willrick.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("willrick", "MALE")

