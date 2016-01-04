 -- Import the lib use.
modimport("libs/env.lua")
 
-- Disable the map screen.
use "data/screens/mapscreen" 

-- Actions Initialization.
use "data/actions/init"

-- Component Initialization.
use "data/components/init"

PrefabFiles = {
	"zoro", "zoroswordmouth", "sandai", "shusui", "zoro_projectile", "zorosheath", "zoro_none",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/zoro.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/zoro.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/zoro.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/zoro.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/zoro_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/zoro_silho.xml" ),

    Asset( "IMAGE", "bigportraits/zoro.tex" ),
    Asset( "ATLAS", "bigportraits/zoro.xml" ),
	
	Asset( "IMAGE", "images/map_icons/zoro.tex" ),
	Asset( "ATLAS", "images/map_icons/zoro.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_zoro.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_zoro.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_zoro.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_zoro.xml" ),
	
	Asset( "IMAGE", "bigportraits/zoro_none.tex" ),
    Asset( "ATLAS", "bigportraits/zoro_none.xml" ),
	
	Asset( "IMAGE", "images/names_zoro.tex" ),
    Asset( "ATLAS", "images/names_zoro.xml" ),

}

local STRINGS = GLOBAL.STRINGS
local require = GLOBAL.require
local SpawnPrefab = GLOBAL.SpawnPrefab

AddPlayerPostInit(function(inst)
   if inst.components.combat == nil then
        return
    end
	if GLOBAL.TheWorld.ismastersim then
		local old_start = inst.components.combat.StartAttack
		inst.components.combat.StartAttack = function(self)
			old_start(self)
			if self.target then
				local weapon = self:GetWeapon()
				if weapon and weapon.components.weapon and weapon.components.weapon.blinking then
					local distance = math.sqrt(self.inst:GetDistanceSqToInst(self.target))
					local hitrange = weapon.components.weapon.hitrange
					if distance > hitrange then
						local smoke1 = SpawnPrefab("maxwell_smoke")
						local smoke2 = SpawnPrefab("maxwell_smoke")
						local sx, sy, sz = self.inst.Transform:GetWorldPosition()
						smoke1.Transform:SetPosition(sx, sy, sz)
						local fx, fy, fz = self.target.Transform:GetWorldPosition()
						local q = (distance - hitrange + 0.2) / distance
						local dx = sx - q * (sx - fx)
						local dy = sy - q * (sy - fy)
						local dz = sz - q * (sz - fz)
						inst.Transform:SetPosition(dx, dy, dz)
						smoke2.Transform:SetPosition(dx, dy, dz)
					end
				end
			end
		end
	end
end)



 function _G.IsDontStarveTogether()
return kleifileexists("scripts/networking.lua") and true or false
end


local containers = require("containers")
 
local oldwidgetsetup = containers.widgetsetup
containers.widgetsetup = function(container, prefab)
    if not prefab and container.inst.prefab == "zorosheath" then
        prefab = "backpack"
    end
    oldwidgetsetup(container, prefab)
end 

STRINGS.NAMES.ZOROSWORDMOUTH = "和道一文字"
STRINGS.NAMES.SANDAI = "三代鬼彻"
STRINGS.NAMES.SHUSUI = "黒刀秋水"
STRINGS.NAMES.ZOROSHEATH = "索隆的武士刀鞘"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ZOROSWORDMOUTH= "一把剑，对于真正的剑客，有很多的感情价值."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SHUSUI= "只有传说中的掌控者可以持有这把劍."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SANDAI= "只有极少数已经克服了诅咒和生存."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ZOROSHEATH= "它拥有三把特殊的剑，每把剑都有自己独有的特点."


local untouchables = {
    crow = true,
    robin = true,
    robin_winter = true,
	babybeefalo = true, 
	penguin = true, 
	smallbird = true,
	catcoon = true,
	chester = true,
	mosquito = true
	
}

AddComponentPostInit("playeractionpicker", function(self)
    local old = self.SortActionList
    function self:SortActionList(actions, target, useitem)
        if #actions == 0 then
            return actions
        end
        local c = 0
        for k, v in pairs(actions) do
            if v == GLOBAL.ACTIONS.ATTACK and
            self.inst.prefab == "zoro" and
            untouchables[target.prefab] then
                c = 1
                break
            end
        end
        if c == 1 then
            return {}
        else
            return old(self, actions, target, useitem)
        end
    end
end)

-- The character select screen lines
STRINGS.CHARACTER_TITLES.zoro = "世界上最伟大的剑客"
STRINGS.CHARACTER_NAMES.zoro = "索隆"
STRINGS.CHARACTER_DESCRIPTIONS.zoro = "*攻击力强\n*剑有多种用途\n*没有方向感"
STRINGS.CHARACTER_QUOTES.zoro = "\"背部的伤痕是剑士的耻辱\""

-- Custom speech strings
STRINGS.CHARACTERS.ZORO = require "speech_zoro"

-- The character's name as appears in-game 
STRINGS.NAMES.ZORO = "Zoro"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ZORO = 
{
	GENERIC = "是索隆!",
	ATTACKER = "索隆真机智...",
	MURDERER = "凶手!",
	REVIVER = "索隆，幽灵的朋友.",
	GHOST = "索隆可以用一颗心.",
}

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "zoro")


AddMinimapAtlas("images/map_icons/zoro.xml")
AddModCharacter("zoro")
