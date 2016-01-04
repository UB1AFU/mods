PrefabFiles = {
	"san", "sancoat", "sanspear", "sanhat", "sannecklace", "san_none",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/san.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/san.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/san.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/san.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/san_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/san_silho.xml" ),

    Asset( "IMAGE", "bigportraits/san.tex" ),
    Asset( "ATLAS", "bigportraits/san.xml" ),
	
	Asset( "IMAGE", "images/map_icons/san.tex" ),
	Asset( "ATLAS", "images/map_icons/san.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_san.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_san.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_san.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_san.xml" ),
	
	Asset( "IMAGE", "bigportraits/san_none.tex" ),
    Asset( "ATLAS", "bigportraits/san_none.xml" ),
	
	Asset( "IMAGE", "images/names_san.tex" ),
    Asset( "ATLAS", "images/names_san.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

GLOBAL.STRINGS.NAMES.SANCOAT = "桑恩的狼皮外套"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SANCOAT = "剥了皮的狼. 多么美妙!"
GLOBAL.STRINGS.NAMES.SANHAT = "桑恩的狼角帽"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SANHAT = "剥了皮的狼. 多么美妙!"
GLOBAL.STRINGS.NAMES.SANNECKLACE = "桑恩的部落项链"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SANNECKLACE = "珍惜森林的保护者."
GLOBAL.STRINGS.NAMES.SANSPEAR = "桑恩的长矛"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SANSPEAR = "珍惜森林的保护者."

local Normal = {
    axe = true,
    pickaxe = true,
    shovel = true
}
 
local Golden = {
    goldenaxe = true,
    goldenpickaxe = true,
    goldenshovel = true
}

AddComponentPostInit("workable", function(self)
    local old = self.WorkedBy
    function self:WorkedBy(worker, numworks)
        if worker.prefab == "san" then
            local a = 0
            if worker.components.inventory then
                a = worker.components.inventory.equipslots.hands
            end
            local item = worker.activeitem or a
            if item then
                if item.prefab == "axe" or
                    item.prefab == "pickaxe" or
                    item.prefab == "shovel" then
                    numworks = (numworks or 1) * 2
                elseif item.prefab == "goldenaxe" or
                    item.prefab == "goldenpickaxe" or
                    item.prefab == "goldenshovel" then
                    numworks = (numworks or 1) * 2
                end
            end
        end
        old(self, worker, numworks)
    end
end)

-- if GLOBAL.TheNet:GetIsServer() then
	
	-- AddComponentPostInit("sanityaura", function(self)
		-- local old = self.GetAura 
		-- function self:GetAura(observer) 
			-- if observer.prefab == "san" and self.inst.prefab == "tentacle" 
										  -- or self.inst.prefab == "ghost" 
										  -- or self.inst.prefab == "crawlinghorror"
										  -- or self.inst.prefab == "terrorbeak" then 
				-- return -10
			-- end
			-- return old(self,observer) 
		-- end
	-- end)	

-- end

local myhandler = GLOBAL.ActionHandler(GLOBAL.ACTIONS.PICK, function(inst, action)
	if action.target.components.pickable then
		if action.target.components.pickable.quickpick or inst.prefab == "san" then
			return "doshortaction"
		else
			return "dolongaction"
		end
	end
end)

AddStategraphActionHandler("wilson", myhandler)



-- The character select screen lines
STRINGS.CHARACTER_TITLES.san = "Wolf Girl"
STRINGS.CHARACTER_NAMES.san = "桑恩"
STRINGS.CHARACTER_DESCRIPTIONS.san = "*大自然的清道夫\n*跑得真快\n*非自然生物会降低她的精神"
STRINGS.CHARACTER_QUOTES.san = "\"Ugh, 我闻起来像一个人类.\""

-- Custom speech strings
STRINGS.CHARACTERS.SAN = require "speech_san"

-- The character's name as appears in-game 
STRINGS.NAMES.SAN = "San"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SAN = 
{
	GENERIC = "是 桑恩!",
	ATTACKER = "桑恩真机智...",
	MURDERER = "凶手!",
	REVIVER = "桑恩， 幽灵的朋友.",
	GHOST = "桑恩 可以用一颗心.",
}


AddMinimapAtlas("images/map_icons/san.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("san", "FEMALE")

