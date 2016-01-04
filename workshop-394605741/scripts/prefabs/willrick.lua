
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {

        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),
        Asset( "ANIM", "anim/beard.zip" ),

        Asset( "ANIM", "anim/willrick.zip" ),
        Asset( "ANIM", "anim/ghost_willrick_build.zip" ),
}
local prefabs = {}
local start_inv = {
	-- Custom starting items
}

-- This initializes for both clients and the host
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "willrick.tex" )
end

-- This initializes for the host only
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "wilson"
	-- Stats	
	inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.6)
    inst.components.combat.damagemultiplier = 0.5
	inst.components.locomotor.walkspeed = 6
	inst.components.locomotor.runspeed = 7
	inst.components.health:SetMaxHealth(120)
	inst.components.hunger:SetMax(200)
	inst.components.sanity:SetMax(120)
end

return MakePlayerCharacter("willrick", prefabs, assets, common_postinit, master_postinit, start_inv)
