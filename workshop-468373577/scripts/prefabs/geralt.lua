local function OnSave(inst, data)
	if inst.swallowpotresttime then data.swallowpotresttime = inst.swallowpotresttime end --Swallow
	if inst.catpotresttime then data.catpotresttime = inst.catpotresttime end --Cat
	if inst.thundbpotresttime then data.thundbpotresttime = inst.thundbpotresttime end --Thunderbolt
	if inst.blizzpotresttime then data.blizzpotresttime = inst.blizzpotresttime end --Blizzard
	if inst.willowpotresttime then data.willowpotresttime = inst.willowpotresttime end --Willow
end

local function OnLoad(inst, data)
	--Swallow
	if data.swallowpotresttime then 
		inst.swallowpotresttime = data.swallowpotresttime 
		if inst.swallowpotresttime > 0 then
			inst.components.hunger.hungerrate = inst.components.hunger.hungerrate + GERALT_SWALLOWPOT_HUNGERRATE
		end
	end
	--Cat
	if data.catpotresttime then 
		inst.catpotresttime = data.catpotresttime 
		if inst.catpotresttime > 0 then
			inst.components.sanity.dapperness = inst.components.sanity.dapperness - TUNING.DAPPERNESS_SMALL
		end
	end
	--Thunderbolt
	if data.thundbpotresttime then 
		inst.thundbpotresttime = data.thundbpotresttime 
		if inst.thundbpotresttime > 0 then
			inst.components.hunger.hungerrate = inst.components.hunger.hungerrate + GERALT_THUNDBPOT_HUNGERRATE
			inst.components.combat.damagemultiplier = inst.components.combat.damagemultiplier + GERALT_THUNDBPOT_MULT
		end
	end
	--Blizzard
	if data.blizzpotresttime then 
		inst.blizzpotresttime = data.blizzpotresttime 
		if inst.blizzpotresttime > 0 then
			inst.components.sanity.dapperness = inst.components.sanity.dapperness - TUNING.DAPPERNESS_SMALL
			inst.components.hunger.hungerrate = inst.components.hunger.hungerrate + 0.05
			inst.components.locomotor.walkspeed = inst.components.locomotor.walkspeed * GERALT_BLIZZPOT_SPEED
			inst.components.locomotor.runspeed = inst.components.locomotor.runspeed * GERALT_BLIZZPOT_SPEED
		end
	end	
	--Willow
	if data.willowpotresttime then 
		inst.willowpotresttime = data.willowpotresttime 
		if inst.willowpotresttime > 0 then
			inst.components.hunger.hungerrate = inst.components.hunger.hungerrate + GERALT_WILLOWPOT_HUNGERRATE
		end
	end
end

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

        Asset( "ANIM", "anim/geralt.zip" ),
		Asset( "ANIM", "anim/ghost_geralt_build.zip" ),
		
		Asset( "ATLAS", "images/avatars/avatar_geralt.xml"),
		Asset( "ATLAS", "images/avatars/avatar_ghost_geralt.xml"),
}
local prefabs = {}

local start_inv = {
	-- Custom starting items
	"geralt_sword",
	"geralt_wsword",
}

-- This initializes for both the server and client. Tags can be added here.
local function common_postinit(inst)
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "geralt.tex" )
	inst:AddTag("witcher")
	
end

-- This initializes for the server only. Components are added here.
local fn = function(inst)
	--Load/Save for potions
	inst.OnSave = OnSave
	inst.OnLoad = OnLoad
	-- choose which sounds this character will play
	inst.soundsname = "maxwell"
	--table.insert(inst.components.eater.foodprefs, "POTION") --these are from DS
	--table.insert(inst.components.eater.ablefoods, "POTION")
	table.insert(inst.components.eater.preferseating, FOODTYPE.POTION)
    table.insert(inst.components.eater.caneat, FOODTYPE.POTION)
    inst:AddTag(FOODTYPE.POTION.."_eater")
	-- Stats	
	inst.components.health:SetMaxHealth(175)
	inst.components.hunger:SetMax(190)
	inst.components.sanity:SetMax(190)
	--Special Abilities
	inst.components.sanity.night_drain_mult = 1.2
	inst.components.sanity.neg_aura_mult = 0.5
    inst.components.combat.damagemultiplier = 1.1
	inst.components.hunger.hungerrate = 1.25 * TUNING.WILSON_HUNGER_RATE
	inst.components.locomotor.walkspeed = 4
	inst.components.locomotor.runspeed = 6
	
	inst.sworddmgmult = 0
	inst.swordspeedmult = 0
	inst.light = inst.entity:AddLight()
    inst.light:SetFalloff(0.75)
    inst.light:SetIntensity(.6)
    inst.light:SetRadius(10)
    inst.light:SetColour(169/255, 231/255, 245/255)
    inst.light:Enable(false)
	inst:ListenForEvent("death", function(inst)
		if (inst.swallowpotresttime) then if (inst.swallowpotresttime > 0) then inst.swallowpotresttime = 0 end end
		if (inst.catpotresttime) then if (inst.catpotresttime > 0) then 	inst.catpotresttime = 0 end end
		if (inst.thundbpotresttime) then if (inst.thundbpotresttime > 0) then 	inst.thundbpotresttime = 0 end end
		if (inst.blizzpotresttime) then if (inst.blizzpotresttime > 0) then 	inst.blizzpotresttime = 0 end end
		if (inst.willowpotresttime) then if (inst.willowpotresttime > 0) then 	inst.willowpotresttime = 0 end end
		inst.light:Enable(false)
	end)
	--[[if  inst.AnimState:IsCurrentAnimation("death") or
		--inst.sg:HasStateTag("nomorph") or
        inst:HasTag("playerghost") or
        inst.components.health:IsDead() then --Dead = all variables set to 0
			
		  return
	end]]
	--Sword damage multiplier
	inst:DoPeriodicTask(0.2, function()
	if inst.sworddmgmult ~= 0 then 
		inst.components.combat.damagemultiplier = inst.components.combat.damagemultiplier - inst.sworddmgmult
		inst.sworddmgmult = 0
	end
	
	--Normal speed everytime if not sword equipped
	if inst.swordspeedmult ~= 0 then
		inst.components.locomotor.walkspeed = inst.components.locomotor.walkspeed / inst.swordspeedmult 
		inst.components.locomotor.runspeed = inst.components.locomotor.runspeed / inst.swordspeedmult
		inst.swordspeedmult = 0
	end
	
	if inst.components.inventory then
	local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	local percent = inst.components.sanity:GetPercent()
	if item then
		if item:HasTag("sword") or item:HasTag("wsword") then
			if (percent > 0.95) then -- More than 95%
				inst.sworddmgmult = 0.3
			elseif (percent > 0.90) then -- More than 90%
				inst.sworddmgmult = 0.25
			elseif (percent > 0.85) then -- More than 85%
				inst.sworddmgmult = 0.20
			elseif (percent > 0.80) then
				inst.sworddmgmult = 0.15
			elseif (percent > 0.75) then
				inst.sworddmgmult = 0.10
			elseif (percent > 0.70) then
				inst.sworddmgmult = 0.05
			elseif (percent < 0.15) then
				inst.sworddmgmult = 0.10
			else
				inst.sworddmgmult = 0.00
			end
			inst.components.combat.damagemultiplier = inst.components.combat.damagemultiplier + inst.sworddmgmult
			inst.swordspeedmult = 1.1
			inst.components.locomotor.walkspeed = inst.components.locomotor.walkspeed * inst.swordspeedmult 
			inst.components.locomotor.runspeed = inst.components.locomotor.runspeed * inst.swordspeedmult
		end			
	end
	end
	end)
	--Potions
	inst:DoPeriodicTask(1, function()
		--Swallow potion
		if inst.swallowpotresttime then	
			if inst.swallowpotresttime > 0 then			
				inst.swallowpotresttime = inst.swallowpotresttime - 1
				inst:DoTaskInTime(1, function()
					inst.components.health:DoDelta(GERALT_SWALLOWPOT_REGENRATE, true, "geralt_swallowpot", true)
					end)
			elseif inst.swallowpotresttime == 0 then
				inst.components.hunger.hungerrate = inst.components.hunger.hungerrate - GERALT_SWALLOWPOT_HUNGERRATE  --when it will become 0, do final changes and that's all
				inst.swallowpotresttime = inst.swallowpotresttime - 1
			end
		end
		--Cat potion
		if inst.catpotresttime then
			if inst.catpotresttime > 0 then				
				inst.catpotresttime = inst.catpotresttime - 1
				if TheWorld.state.isnight then	
					inst.light:SetFalloff(0.75)
					inst.light:SetIntensity(.6)
					inst.light:SetRadius(10)
					inst.light:SetColour(169/255, 231/255, 245/255)
					inst.light:Enable(true)
					inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
				else
					inst.light:Enable(false)
				end
			elseif inst.catpotresttime == 0 then
				inst.components.sanity.dapperness = inst.components.sanity.dapperness + TUNING.DAPPERNESS_SMALL
				inst.light:Enable(false)
				inst.catpotresttime= inst.catpotresttime - 1
			end
		end
		--Thunderblot potion
		if inst.thundbpotresttime then	
			if inst.thundbpotresttime > 0 then			
				inst.thundbpotresttime = inst.thundbpotresttime - 1
				inst:DoTaskInTime(1, function()
					inst.components.health:DoDelta(-TUNING.HEALING_TINY * 2 / 3, true, "geralt_thundbpot", true) -- 30 hp over 45 seconds gone
					end)
			elseif inst.thundbpotresttime == 0 then
				inst.components.hunger.hungerrate = inst.components.hunger.hungerrate - GERALT_THUNDBPOT_HUNGERRATE
				inst.thundbpotresttime = inst.thundbpotresttime - 1
				inst.components.combat.damagemultiplier = inst.components.combat.damagemultiplier - GERALT_THUNDBPOT_MULT
			end
		end
		--Blizzard potion
		if inst.blizzpotresttime then	
			if inst.blizzpotresttime > 0 then			
				inst.blizzpotresttime = inst.blizzpotresttime - 1
			elseif inst.blizzpotresttime == 0 then
				inst.components.sanity.dapperness = inst.components.sanity.dapperness + TUNING.DAPPERNESS_SMALL
				inst.components.hunger.hungerrate = inst.components.hunger.hungerrate - 0.05
				inst.components.locomotor.walkspeed = inst.components.locomotor.walkspeed / GERALT_BLIZZPOT_SPEED
				inst.components.locomotor.runspeed = inst.components.locomotor.runspeed / GERALT_BLIZZPOT_SPEED
				inst.blizzpotresttime = inst.blizzpotresttime - 1
			end
		end
		--Willow potion
		if inst.willowpotresttime then	
			if inst.willowpotresttime > 0 then			
				inst.willowpotresttime = inst.willowpotresttime - 1
			elseif inst.willowpotresttime == 0 then
				inst.components.hunger.hungerrate = inst.components.hunger.hungerrate - GERALT_WILLOWPOT_HUNGERRATE  --when it will become 0, do final changes and that's all
				inst.willowpotresttime = inst.willowpotresttime - 1
			end
		end
		--other potions
	end)	
end
	
return MakePlayerCharacter("geralt", prefabs, assets, common_postinit, fn, start_inv)