local assets=
{
    Asset("ANIM", "anim/bow.zip"),
    Asset("ANIM", "anim/swap_bow.zip"),
	
    Asset("ATLAS", "images/inventoryimages/bow.xml"),
    Asset("IMAGE", "images/inventoryimages/bow.tex"),
	
	Asset("ATLAS", "images/inventoryimages/arrow.xml"),
    Asset("IMAGE", "images/inventoryimages/arrow.tex"),
	Asset("ATLAS", "images/inventoryimages/goldarrow.xml"),
    Asset("IMAGE", "images/inventoryimages/goldarrow.tex"),
	Asset("ATLAS", "images/inventoryimages/moonstonearrow.xml"),
    Asset("IMAGE", "images/inventoryimages/moonstonearrow.tex"),
	Asset("ATLAS", "images/inventoryimages/firearrow.xml"),
    Asset("IMAGE", "images/inventoryimages/firearrow.tex"),
	Asset("ATLAS", "images/inventoryimages/icearrow.xml"),
    Asset("IMAGE", "images/inventoryimages/icearrow.tex"),
	Asset("ATLAS", "images/inventoryimages/thunderarrow.xml"),
    Asset("IMAGE", "images/inventoryimages/thunderarrow.tex"),
	Asset("ATLAS", "images/inventoryimages/dischargedthunderarrow.xml"),
    Asset("IMAGE", "images/inventoryimages/dischargedthunderarrow.tex"),
	 
--------------------------------------------------------------------	 
	 
	Asset("ANIM", "anim/crossbow.zip"),
    Asset("ANIM", "anim/swap_crossbow.zip"),
	 
    Asset("ATLAS", "images/inventoryimages/crossbow.xml"),
    Asset("IMAGE", "images/inventoryimages/crossbow.tex"),
	
	Asset("ATLAS", "images/inventoryimages/bolt.xml"),
    Asset("IMAGE", "images/inventoryimages/bolt.tex"),
	Asset("ATLAS", "images/inventoryimages/poisonbolt.xml"),
    Asset("IMAGE", "images/inventoryimages/poisonbolt.tex"),
	Asset("ATLAS", "images/inventoryimages/explosivebolt.xml"),
    Asset("IMAGE", "images/inventoryimages/explosivebolt.tex"),
	
---------------------------------------------------------------------

    Asset("ANIM", "anim/swap_magicbow.zip"),
	
    Asset("ATLAS", "images/inventoryimages/magicbow.xml"),
    Asset("IMAGE", "images/inventoryimages/magicbow.tex"),
	
---------------------------------------------------------------------

    Asset("ANIM", "anim/musket.zip"),
    Asset("ANIM", "anim/swap_musket.zip"),
	
    Asset("ATLAS", "images/inventoryimages/musket.xml"),
    Asset("IMAGE", "images/inventoryimages/musket.tex"),
    Asset("ATLAS", "images/inventoryimages/musket_bullet.xml"),
    Asset("IMAGE", "images/inventoryimages/musket_bullet.tex"),
}
prefabs = {
    "explode_small",
	"sparkles",
}

----------------------------------------------------------------------------BOWS--------------------------------------------------------------

local function OnHostSetAtkRange(inst)
	if inst._atkrange:value() > 2 and inst.replica.inventoryitem.classified then
		inst.replica.inventoryitem:SetAttackRange(inst._atkrange:value())
	end
end

local function DoPostAttackTask(inst, attacker)
	local quiver = attacker.components.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
	local equiphand = attacker.components.inventory and attacker.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	
	if equiphand then
		if equiphand:HasTag("magic") and equiphand:HasTag("bow") then
			if equiphand.components.fueled ~= nil and not equiphand.components.fueled:IsEmpty() then
				equiphand.components.fueled:DoDelta(-1)
			end
		elseif equiphand:HasTag("musket") then
			if equiphand:HasTag("readytoshoot") then
				equiphand:RemoveTag("readytoshoot")
			end
		else	
			if quiver ~= nil and quiver.components.container ~= nil then
				local projinquiver = quiver.components.container:GetItemInSlot(1)
					if projinquiver ~= nil then
						if projinquiver.components.stackable.stacksize == 1 and attacker.components.inventory:Has(projinquiver.prefab, 1) then
							local projtotransfer = SpawnPrefab(projinquiver.prefab)
							local amounttotransfer = select(2, attacker.components.inventory:Has(projinquiver.prefab, 1))
							quiver.components.container:ConsumeByName(projinquiver.prefab,1)
							
							if amounttotransfer < projtotransfer.components.stackable.maxsize then
								projtotransfer.components.stackable:SetStackSize(amounttotransfer)
								attacker.components.inventory:ConsumeByName(projinquiver.prefab,amounttotransfer)
							else
								projtotransfer.components.stackable:SetStackSize(projtotransfer.components.stackable.maxsize)
								attacker.components.inventory:ConsumeByName(projinquiver.prefab,projtotransfer.components.stackable.maxsize)						
							end
							
							quiver.components.container:GiveItem(projtotransfer)
						else
							quiver.components.container:ConsumeByName(projinquiver.prefab,1)				
						end
					end
			end
		end
	end
	
	if equiphand and equiphand:HasTag("crossbow") and equiphand.components.zupalexsrangedweapons then
		-- print("I should disarm the Xbow")
		equiphand:RemoveTag("readytoshoot")
		attacker.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow")
	end
end

local function onattack(inst, attacker, target)
    if target.components.sleeper and target.components.sleeper:IsAsleep() then
        target.components.sleeper:WakeUp()
    end

    if target.components.combat then
        target.components.combat:SuggestTarget(attacker)
    end
end

local function AssignProjInQuiver(inst, owner)
	local quiver = owner.components. inventory and owner.components.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
	
	if quiver then
		local projinquiver = quiver.components.container:GetItemInSlot(1)
		if projinquiver then
			inst.components.weapon:SetProjectile(projinquiver.prefab)
		end
	end
end

local function OnEquipBow(inst, owner)		
	AssignProjInQuiver(inst, owner)
	
	-- owner.replica.combat._attackrange:set(TUNING.BOWRANGE)
	
    owner.AnimState:OverrideSymbol("swap_object", "swap_bow", "swap_bow")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end
 
local function OnUnequipBow(inst, owner)		
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function OnFinished(inst)
	inst:Remove()
end

local function bowfn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
     
    anim:SetBank("bow")
    anim:SetBuild("bow")
    anim:PlayAnimation("bow_idle")
 
	inst:AddTag("bow") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	inst:AddTag("ranged")
	inst:AddTag("usequiverproj")	
	
	inst._atkrange = net_float(inst.GUID, "_atkrange", "onhostsetatkrange")
	inst:ListenForEvent("onhostsetatkrange", OnHostSetAtkRange)
	
 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then	
        return inst
    end
----------------------------------------------------------------
	
--	print("BOW USES = " , TUNING.BOWUSES, "   /   BOW DMG = ", TUNING.BOWDMG)
	
	if TUNING.BOWUSES < 201 then
		inst:AddComponent("finiteuses")
		inst.components.finiteuses:SetMaxUses(TUNING.BOWUSES)
		inst.components.finiteuses:SetUses(TUNING.BOWUSES)
		inst.components.finiteuses:SetOnFinished(OnFinished)
	end
	
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "bow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/bow.xml"
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquipBow )
    inst.components.equippable:SetOnUnequip( OnUnequipBow )
	
	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(0)
    inst.components.weapon:SetRange((TUNING.BOWRANGE-2), TUNING.BOWRANGE)
	inst._atkrange:set(TUNING.BOWRANGE)
    inst.components.weapon:SetProjectile("arrow")
	inst.components.weapon:SetOnAttack(onattack)
	
	inst:AddComponent("zupalexsrangedweapons")
	inst.components.zupalexsrangedweapons:SetAllowedProjectiles( { "arrow", "goldarrow", "moonstonearrow", "firearrow", "icearrow", "thunderarrow", "dischargedthunderarrow" } )
	inst.components.zupalexsrangedweapons:SetCooldownTime(1.3)

    MakeHauntableLaunch(inst)
 
    return inst
end

----------------------------------------------------ARROWS----------------------------------------------------------

local function onthrown_regular(inst, data)
    inst.AnimState:SetOrientation( ANIM_ORIENTATION.OnGround )
	if inst.Physics ~= nil and not inst:HasTag("nocollisionoverride") then
		inst.Physics:ClearCollisionMask()
		inst.Physics:CollidesWith(COLLISION.WORLD)
		if TUNING.COLLISIONSAREON then
			inst.Physics:CollidesWith(COLLISION.OBSTACLES)
		end
	end
	local attacker = FindEntity(inst, 1.8, nil, { "player" })
	print("I check for the attacker -> ", attacker or "NOT FOUND!")
	if attacker then 
		inst.components.projectile.owner = attacker 
		DoPostAttackTask(inst, attacker)	
	end
end

local function onpickup(inst)
	if inst.prefab == "moonstonearrow" then	
		inst.Light:Enable(false)
	end
end

local function onputininventory(inst, owner)
	local activeitem = nil
	local quiver = nil
	local projinquiver = nil
	
	if owner.components.inventory ~= nil then
		inst:DoTaskInTime(0, function () 
								activeitem = owner.components.inventory:GetActiveItem()
								quiver = owner.components.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
--								print("Active item is : ", activeitem or "UNAVAILABLE", "  / Quiver is : ", quiver or "UNAVAILABLE")
								
								if inst ~= activeitem and quiver ~= nil then
									projinquiver = quiver.replica.container:GetItemInSlot(1)
--									print("Player ", inst.components.inventoryitem.owner, " put ", inst, " in its inventory (owner = ", owner, ")")
--									print("Quiver has : ", projinquiver or "EMPTY")
									if projinquiver == nil then
										local projtostore = SpawnPrefab(string.lower(inst.prefab))
										projtostore.components.stackable:SetStackSize(inst.components.stackable.stacksize)
										quiver.components.container:GiveItem(projtostore, 1)
										inst:Remove()
									elseif projinquiver.prefab == inst.prefab and not projinquiver.components.stackable:IsFull() then
										local currentactivestack = inst.components.stackable.stacksize
										local currentstackinquiver = projinquiver.components.stackable.stacksize
										local stackoverflow = currentactivestack - projinquiver.components.stackable:RoomLeft()			
										
										if stackoverflow <= 0 then
											projinquiver.components.stackable:SetStackSize(currentactivestack + currentstackinquiver)
											inst:Remove()
										else
											projinquiver.components.stackable:SetStackSize(projinquiver.components.stackable.maxsize)
											local projtostore = SpawnPrefab(string.lower(inst.prefab))
											projtostore.components.stackable:SetStackSize(stackoverflow)
											owner:DoTaskInTime(0, function() owner.components.inventory:GiveItem(projtostore) end)
											inst:Remove()
										end
									end								
								end
							end)
	end
end

local function commonarrowfn(arrowanim, tags) 
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
 
	inst:AddTag("projectile") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	inst:AddTag("arrow")

	if tags ~= nil then
        for i, v in ipairs(tags) do
            inst:AddTag(v)
        end
    end
	
	anim:SetBank("arrow")
    anim:SetBuild("bow")
    anim:PlayAnimation(arrowanim, true)
	
 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then	
        return inst
    end
----------------------------------------------------------------

	inst:AddComponent("weapon")	
	inst.components.weapon:SetDamage(0)
	inst:AddComponent("projectile")
	
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem:SetOnPickupFn(onpickup)
	inst.components.inventoryitem:SetOnPutInInventoryFn(onputininventory)
	
	
	inst:AddComponent("zupalexsrangedweapons")
	
	inst:AddComponent("stackable")
	
    inst:ListenForEvent("onthrown", onthrown_regular)	
	
    return inst
end

local function onhitarrow_fire(attacker, target)
	target.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_impact_fire")
	
--	print("I am shooting a Fire Arrow")
	
	if target.components.burnable then
        target.components.burnable:Ignite(nil, attacker)
    end
    if target.components.freezable then
        target.components.freezable:Unfreeze()
    end
    if target.components.health then
        target.components.health:DoFireDamage((TUNING.BOWDMG*(TUNING.FIREARROWDMGMOD/2.0)), attacker)
    end
end

local function onhitarrow_ice(attacker, target)
--	print("I am shooting an Ice Arrow")
   
    if target.components.burnable then
        if target.components.burnable:IsBurning() then
            target.components.burnable:Extinguish()
        elseif target.components.burnable:IsSmoldering() then
            target.components.burnable:SmotherSmolder()
        end
    end

    if target.components.freezable then
        target.components.freezable:AddColdness(1)
        target.components.freezable:SpawnShatterFX()
    end
end

local function onhitarrow_thunder(inst, attacker, target)
	local lightningstrike = SpawnPrefab("lightning")
	lightningstrike.Transform:SetPosition(target.Transform:GetWorldPosition())
	
	if not target:HasTag("stunned") then
		target:AddTag("stunned")
		
		if TheWorld.ismastersim and target.stuneffect == nil and target.components.health and not target.components.health:IsDead() then
			local symboltofollow = nil
			local symboltofollow_x = 0
			local symboltofollow_y = -100
			local symboltofollow_z = 0.02
		
			symboltofollow = target.components.combat.hiteffectsymbol
		
			if (symboltofollow == "marker" or symboltofollow == nil) and target.components.burnable then
				for k, v in pairs(target.components.burnable.fxdata) do
					if v.follow ~= nil then
						symboltofollow = v.follow
						symboltofollow_x = v.x
						symboltofollow_y = v.y - 190
						symboltofollow_z = v.z
					end
				end
			end
		
		
			if symboltofollow ~= nil and symboltofollow ~= "marker" then
				target.stuneffect = SpawnPrefab("stuneffect")
				target.stuneffect.Transform:SetPosition(target:GetPosition():Get())
				target.stuneffect:SetFollowTarget(target, symboltofollow, symboltofollow_x, symboltofollow_y, symboltofollow_z)
				target:ListenForEvent("death", function()
													if target.stuneffect ~= nil then
														target.stuneffect:SetFollowTarget(nil)
														target.stuneffect = nil
													end
												end
									)	
			end
		end
		
		if target.components.locomotor then
			target.preventmoving = target:DoPeriodicTask(0, function(target) target.components.locomotor:Stop() end)
			target.electricstun = target:DoPeriodicTask(4, function(target) 
																	target:RemoveTag("stunned")
																	
																	if TheWorld.ismastersim and target.stuneffect  ~= nil then
																		target.stuneffect:SetFollowTarget(nil)
																		target.stuneffect = nil
																	end
																	
																	if target.electricstun then
																		target.electricstun:Cancel()
																		target.electricstun = nil
																	end
																
																	if target.preventmoving then
																		target.preventmoving:Cancel()
																		target.preventmoving = nil
																	end
																end
															)															
		end
	end
	
	if TheWorld.state.israining then
		if math.random() <= 0.5 then
			if attacker.components.playerlightningtarget then
				attacker.components.playerlightningtarget:DoStrike()
				TheWorld:PushEvent("ms_sendlightningstrike", attacker:GetPosition())
			end
		end
	end
end

local function PoisonWearOff(target)
	 if target.components.combat then
		target.components.combat.damagemultiplier = nil
		
		if	target.components.locomotor then
			target.components.locomotor.externalspeedmultiplier = 1
		end
		
		if target:HasTag("poisoned") then
			target:RemoveTag("poisoned")
		end
		
		if TheWorld.ismastersim and target.poisoncloud ~= nil then
			target.poisoncloud:SetFollowTarget(nil)
			target.poisoncloud = nil
		end
		
		if target.poisonwearofftask then
			target.poisonwearofftask:Cancel()
			target.poisonwearofftask = nil
		end
	 end
end

local function onhitbolt_poison(attacker, target)
--	print("I am shooting an Ice Arrow")
   
    if target.components.combat then
		if not target:HasTag("poisoned") then
			target:AddTag("poisoned")
			
			if TheWorld.ismastersim and target.components.burnable and target.poisoncloud == nil then
				local symboltofollow = nil
				local symboltofollow_x = 0
				local symboltofollow_y = 0
				local symboltofollow_z = 0.02
			
				symboltofollow = target.components.combat.hiteffectsymbol			
			
				if (symboltofollow == "marker" or symboltofollow == nil) and target.components.burnable then
					for k, v in pairs(target.components.burnable.fxdata) do
						if v.follow ~= nil then
							symboltofollow = v.follow
							symboltofollow_x = v.x
							symboltofollow_y = v.y - 30
							symboltofollow_z = v.z
						end
					end
				end
			
				if symboltofollow ~= nil and symboltofollow ~= "marker" then
					target.poisoncloud = SpawnPrefab("poisoncloud")
					target.poisoncloud.Transform:SetPosition(target:GetPosition():Get())
					target.poisoncloud:SetFollowTarget(target, symboltofollow, 0, 0, 1)	
					target:ListenForEvent("death", function()
													if target.poisoncloud ~= nil then
														target.poisoncloud:SetFollowTarget(nil)
														target.poisoncloud = nil
													end
												end
										)
				end
			end
		end
		
		target.components.combat.damagemultiplier = 0.6
		
		if target.components.health and not target.components.health:IsDead() then
			local timeouttick = 0
			target.loosehealthovertime = target:DoPeriodicTask(1, function(target) 
																	target.components.health:DoDelta(-TUNING.BOWDMG*TUNING.CROSSBOWDMGMOD*TUNING.POISONBOLTDMGMOD/TUNING.POISONBOLTDURATION, true)
																	timeouttick = timeouttick+1
																	if timeouttick == TUNING.POISONBOLTDURATION then
																		target.loosehealthovertime:Cancel()
																		target.loosehealthovertime = nil
																	end
																end
															)															
		end
		
		if	target.components.locomotor then
			target.components.locomotor.externalspeedmultiplier = 0.5
		end
		
		if target.poisonwearofftask == nil then
			target.poisonwearofftask = target:DoPeriodicTask(10, PoisonWearOff)
		else
			target.poisonwearofftask:Cancel()
			target.poisonwearofftask = nil
			target.poisonwearofftask = target:DoPeriodicTask(10, PoisonWearOff)
		end
	end
end

local function onhitbolt_explosive(inst, attacker, target)
--	print("I am shooting an Explosive Bolt")
	local isPvPon = TheNet:GetPVPEnabled()
	
	local targposx, targposy, targposz
	if target ~= inst then
		targposx, targposy, targposz = target.Transform:GetWorldPosition()
	else
		targposx, targposy, targposz = inst.Transform:GetWorldPosition()
	end
	
	for i, v in ipairs(AllPlayers) do
        local distSq = v:GetDistanceSqToInst(inst)
        local k = math.max(0, math.min(1, distSq / 1600))
        local intensity = k * (k - 2) + 1 --easing.outQuad(k, 1, -1, 1)
        if intensity > 0 then
            v:ScreenFlash(intensity)
            v:ShakeCamera(CAMERASHAKE.FULL, .7, .02, intensity / 2)
        end
    end
	
	local ents = TheSim:FindEntities(targposx, targposy, targposz, TUNING.EXPLOSIVEBOLTRAD)
    for i, ent in ipairs(ents) do
		if (not isPvPon and not ent:HasTag("player")) or (isPvPon) then
			if ent ~= inst and attacker.components.combat:IsValidTarget(ent)
				then
					ent.components.combat:GetAttacked(attacker, TUNING.EXPLOSIVEBOLTDMG)
			elseif ent.components.workable ~= nil and ent.components.workable:CanBeWorked() then
					ent.components.workable:WorkedBy(inst, TUNING.EXPLOSIVEBOLTDMG)
			elseif ent == attacker then
					ent.components.combat:GetAttacked(attacker, TUNING.EXPLOSIVEBOLTDMG*0.2)
			elseif isPvPon and ent:HasTag("player") then
					ent.components.combat:GetAttacked(attacker, TUNING.EXPLOSIVEBOLTDMG*0.2)
			end
			
			ent:DoTaskInTime(0.5, function()
										if ent:IsValid() and not ent:IsInLimbo() then
											if ent.components.burnable and
											not ent.components.burnable:IsBurning() and
											not ent:HasTag("burnt")
											then
												ent.components.burnable:Ignite(true)
											end
										end
									end
							)
		end
    end

    SpawnPrefab("explode_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/blackpowder_explo")
	
	local rdmradius = TUNING.EXPLOSIVEBOLTRAD/4
	
	TheWorld:DoTaskInTime(0.15, function() SpawnPrefab("explode_small").Transform:SetPosition(targposx+math.random(-rdmradius, rdmradius), targposy+math.random(-rdmradius, rdmradius), targposz+math.random(-rdmradius, rdmradius)) end)
	target:DoTaskInTime(0.15, function() target.SoundEmitter:PlaySound("dontstarve/common/blackpowder_explo") end)
	TheWorld:DoTaskInTime(0.25, function() SpawnPrefab("explode_small").Transform:SetPosition(targposx+math.random(-rdmradius, rdmradius), targposy+math.random(-rdmradius, rdmradius), targposz+math.random(-rdmradius, rdmradius)) end)
	target:DoTaskInTime(0.25, function() target.SoundEmitter:PlaySound("dontstarve/common/blackpowder_explo") end)
	TheWorld:DoTaskInTime(0.4, function() SpawnPrefab("explode_small").Transform:SetPosition(targposx+math.random(-rdmradius, rdmradius), targposy+math.random(-rdmradius, rdmradius), targposz+math.random(-rdmradius, rdmradius)) end)
	target:DoTaskInTime(0.4, function() target.SoundEmitter:PlaySound("dontstarve/common/blackpowder_explo") end)
	
end

local function shootarrow(inst)
    inst.AnimState:PlayAnimation("arrow_flight")
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function shootgoldarrow(inst)
    inst.AnimState:PlayAnimation("goldarrow_flight")
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function shootmoonstonearrow(inst)
    inst.AnimState:PlayAnimation("moonstonearrow_flight", true)
	inst.Light:Enable(true)
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function onmissarrow_regular(inst, attacker, target)
	local RecChanceBonus = 0
	local zupaproj = inst.components.zupalexsrangedweapons
	
	if attacker:HasTag("improvedsight") then
		RecChanceBonus = TUNING.VITAMINRRECMOD
	end
	
	local RecChance = zupaproj and zupaproj:GetRecChance(false) + RecChanceBonus
	
	if math.random() <= RecChance and inst:HasTag("recoverable") then
		local currentweaponbaseproj = zupaproj and zupaproj:GetBasicAmmo()
--		print("currentprojbasic in super miss = ", currentprojbasicammo)
		local recoveredarrow = currentweaponbaseproj and SpawnPrefab(currentweaponbaseproj)
		if recoveredarrow then
			recoveredarrow.Transform:SetPosition(inst.Transform:GetWorldPosition())
		end
	end

	inst:Remove()
end

local function onmiss_explosivebolt(inst, attacker, target)
	local shooter = inst.components.zupalexsrangedweapons.owner
	onhitbolt_explosive(inst, shooter, target)
	inst:Remove()
end

local function onhitarrow_healing(inst, attacker, target)
	if target ~= nil then
		if target.components.health ~= nil and not target.components.health:IsDead() then
		target.components.health:DoDelta(25)
		end
		
		if target.components.sanity ~= nil then
			target.components.sanity:DoDelta(-5)
		end
	end
end

local function HITorMISSHandler(inst, attacker, target, DamageToApply, canmiss, canrecover)
	local misschancesmall, misschancebig = inst.components.zupalexsrangedweapons:GetMissChance()
	
	local misschance
	local RecChance
	local RecChanceBonus = 0
	
	local ignoreattack = false
	
	if TUNING.HITCHANCEFLYINGBIRDS and target:HasTag("bird") and target.sg and target.sg:HasStateTag("flying") then
		misschance = 0.995
		ignoreattack = true
	elseif TUNING.HITCHANCEBUGS and target.prefab == "bee" or target.prefab == "butterfly" then
		misschance = 0.99
	elseif canmiss then
		if target:HasTag("rabbit") or target:HasTag("bird") or target:HasTag("mole") or target:HasTag("butterfly") or target:HasTag("bee") or target:HasTag("frog") then 
			misschance = misschancesmall
		else
			misschance = misschancebig
		end
	else
		misschance = -1
	end
	
	local hitscore = math.random()
	
	if attacker:HasTag("improvedsight") then
		misschance = misschance * TUNING.VITAMINRACCMOD
		RecChanceBonus = TUNING.VITAMINRRECMOD
	end
	
--	print("hitscore = ", hitscore)
--	print("miss chance = ", misschance)
	
	if not target:IsInLimbo() then
		if hitscore <= misschance then	
			if attacker ~= nil and attacker.components and attacker.components.talker then
				local miss_message = "I should aim better next time!"
				attacker.components.talker:Say(miss_message)
			end
			
			if not ignoreattack then
				target:PushEvent("attacked", {attacker = attacker, damage = 0.1})
			end
			
			if inst.prefab == "explosivebolt" then
				onhitbolt_explosive(inst, attacker, target)
			end
			
			if canrecover and inst:HasTag("recoverable") then
				RecChance = inst.components.zupalexsrangedweapons:GetRecChance(false) + RecChanceBonus
--				print("rec chance = ", RecChance)
				
				if math.random() <= RecChance then
					local rdmshift = Vector3(math.random(-1, 0)+math.random(), math.random(-1, 0)+math.random(), math.random(-1, 0)+math.random())
					local targposx, targposy, targposz = target.Transform:GetWorldPosition()
					local currentprojbasicammo = inst.components.zupalexsrangedweapons:GetBasicAmmo()
		--			print("currentprojbasic in miss = ", currentprojbasicammo)
					local recoveredarrow = SpawnPrefab(currentprojbasicammo)
					recoveredarrow.Transform:SetPosition((targposx + rdmshift.x), (targposy + rdmshift.y), (targposz + rdmshift.z))
				end		
			end
		else	
			if target:HasTag("player") then
				if (1-hitscore) <= TUNING.CRITCHANCEPVP then
	--				print("Score a critical against a Player!")
					DamageToApply = DamageToApply*TUNING.CRITDMGMODPVP
				end
			else
				if (1-hitscore) <= TUNING.CRITCHANCEPVE then
	--				print("Score a critical against a Mob!")
					DamageToApply = DamageToApply*TUNING.CRITDMGMODPVE
				end
			end
				
--			print("Damage To Apply = ", DamageToApply)	
				
			target.components.combat:GetAttacked(attacker, DamageToApply)
			
			if inst.prefab == "firearrow" then
				onhitarrow_fire(attacker, target)
			elseif inst.prefab == "icearrow" then
				onhitarrow_ice(attacker, target)
			elseif inst.prefab == "thunderarrow" then
				onhitarrow_thunder(inst, attacker, target)
			elseif inst.prefab == "poisonbolt" then
				onhitbolt_poison(attacker, target)
			elseif inst.prefab == "explosivebolt" then
				onhitbolt_explosive(inst, attacker, target)
			elseif inst.prefab == "healingarrow" then
				onhitarrow_healing(inst, attacker, target)
			end
			
			if canrecover and inst:HasTag("recoverable") then
				RecChance = inst.components.zupalexsrangedweapons:GetRecChance(true) + RecChanceBonus		
--				print("rec chance = ", RecChance)
				
				if math.random() <= RecChance then
					if target.arrowtorecover == nil then
						target.arrowtorecover = {}
						target.arrowtorecover[inst.prefab] = 1
					elseif target.arrowtorecover ~= nil and target.arrowtorecover[inst.prefab] == nil then
						target.arrowtorecover[inst.prefab] = 1
					else
						target.arrowtorecover[inst.prefab] = target.arrowtorecover[inst.prefab] + 1
					end
					
					for k, v in pairs(target.arrowtorecover) do
--						print(k, "  ->  ", v)
					end
--					print("****************************************")
					
					if target.RetrievePinnedArrows == nil then
						if target.components.health and target.components.health:IsDead() then
							local recoveredarrow = SpawnPrefab(inst.components.zupalexsrangedweapons:GetBasicAmmo())
							local rdmshift = Vector3(math.random(-1, 0)+math.random(), math.random(-1, 0)+math.random(), math.random(-1, 0)+math.random())
							local targposx, targposy, targposz = target.Transform:GetWorldPosition()
							recoveredarrow.Transform:SetPosition((targposx + rdmshift.x), (targposy + rdmshift.y), (targposz + rdmshift.z))
						else
							target.RetrievePinnedArrows = function()
															target:DoTaskInTime(0.5, function() 
																						if target.arrowtorecover ~= nil then
																							for k, v in pairs(target.arrowtorecover) do
																								local NbrOfStack = math.ceil(v/20)
																								local LastStackSize = v - (NbrOfStack-1)*20
																								
																								local StS = 1 -- Stack to Spawn
																								while StS <= NbrOfStack do
																									local pinnedarrow = SpawnPrefab(k)								
--																									print("Arrow to recover = ", pinnedarrow.components.zupalexsrangedweapons:GetBasicAmmo())
																									local recoveredarrow = SpawnPrefab(pinnedarrow.components.zupalexsrangedweapons:GetBasicAmmo())
																									pinnedarrow:Remove()
																									
																									if StS == NbrOfStack then
																										recoveredarrow.components.stackable:SetStackSize(LastStackSize)
																									else
																										recoveredarrow.components.stackable:SetStackSize(recoveredarrow.components.stackable.maxsize)
																									end
																									
																									local rdmshift = Vector3(math.random(-1, 0)+math.random(), math.random(-1, 0)+math.random(), math.random(-1, 0)+math.random())
																									local targposx, targposy, targposz = target.Transform:GetWorldPosition()
																									recoveredarrow.Transform:SetPosition((targposx + rdmshift.x), (targposy + rdmshift.y), (targposz + rdmshift.z))
																									StS = StS+1
																								end
																							end						
																							target.arrowtorecover = nil
																						end
																					end					
																				)
														end
							target:ListenForEvent("death", target.RetrievePinnedArrows)
						end
					end
				end	
			end
		end	
	elseif inst:HasTag("recoverable") then
		if not inst:HasTag("explosive") then
			onmissarrow_regular(inst, attacker, inst)
		else
			onmiss_explosivebolt(inst, attacker, inst)
		end
	end
end

local function CalcFinalDamage(inst, attacker, target, applydodelta)
	local BaseDamage = inst.components.zupalexsrangedweapons:GetArrowBaseDamage()
	local DmgModifier = 1.0
	local DmgMultiplier = (attacker.components.combat.damagemultiplier or 1) -- Damage multiplier of a specific character
	
	local AdditionnalDmgMultiplier =
		(inst.components.zupalexsrangedweapons.stimuli == "electric" and
		not (target:HasTag("electricdamageimmune") or (target.components.inventory ~= nil and target.components.inventory:IsInsulated()))
		and TUNING.ELECTRIC_DAMAGE_MULT + TUNING.ELECTRIC_WET_DAMAGE_MULT * (target.components.moisture ~= nil and target.components.moisture:GetMoisturePercent() or (target:GetIsWet() and 1 or 0)))
		or 0
	
	if attacker ~= nil and attacker.components.sanity ~= nil then
		if inst.prefab == "lightarrow" then 
			if target:HasTag("shadowcreature") then
				DmgModifier = 1.6
				if applydodelta then attacker.components.sanity:DoDelta(5) end
			elseif not target:HasTag("hostile") then
				DmgModifier = 0.6
				if applydodelta then attacker.components.sanity:DoDelta(-10) end					
			end	
		elseif inst.prefab == "shadowarrow" then 
			if target:HasTag("shadowcreature")then
				DmgModifier = 0.2
				if applydodelta then attacker.components.sanity:DoDelta(-10) end
			else 
				if applydodelta then attacker.components.sanity:DoDelta(-2) end
			end
		elseif inst.prefab == "healingarrow" then 
			if target:HasTag("hostile")then
				if applydodelta then attacker.components.sanity:DoDelta(-15) end
			elseif target:HasTag("player")then
				if applydodelta then attacker.components.sanity:DoDelta(-5) end
			end
		end
	end
	
	return BaseDamage*(DmgModifier*DmgMultiplier + AdditionnalDmgMultiplier)
end

local function onhitcommon(inst, attacker, target)	
	print("Final Damage = ", CalcFinalDamage(inst, attacker, target, false))

	HITorMISSHandler(inst, attacker, target, CalcFinalDamage(inst, attacker, target, true), true, true)

	if target.components.health and not target.components.health:IsDead() and math.random() < 0.65 then
		if target:HasTag("bird") then
			TheWorld:DoTaskInTime(0.5, function() target.sg:GoToState("flyaway") end)
		elseif target.prefab == "rabbit" then
			TheWorld:DoTaskInTime(0.5, function() target:PushEvent("gohome") end)
		end
	end
	
	if inst:IsValid() then
		inst:Remove()
	end
end

local function oncollide(inst, other)
	local attacker = inst.components.projectile and inst.components.projectile.owner

	print("COLLISION! inst :", inst, "with :", other, "(attacker: ", attacker,")")
	
	if not attacker and inst:HasTag("recoverable") then
		local spawnlocx, spawnlocy, spawnlocz = inst.Transform:GetWorldPosition()
		local recoveredarrow = SpawnPrefab(inst.prefab)
		inst:Remove()
		recoveredarrow.Transform:SetPosition(spawnlocx+1, spawnlocy+1, spawnlocz+1)
		return
	end
	
	if attacker and inst:HasTag("explosive") then
		onhitbolt_explosive(inst, attacker, other)
		inst:Remove()
		return
	end
	
	if not attacker and not inst:HasTag("recoverable") then
		inst:Remove()
		return		
	end
	
	if other.components.combat ~= nil and other:IsValid() and not other:IsInLimbo() and not other:HasTag("wall") then
		HITorMISSHandler(inst, attacker, other, CalcFinalDamage(inst, attacker, other, true), false, false)
		return
	elseif not (other:HasTag("campfire") or other:HasTag("watersource") or other:HasTag("sentry")) then
		if inst.components.zupalexsrangedweapons ~= nil and not inst:HasTag("explosive") then	
			if inst:HasTag("recoverable") then
				local inst_x, inst_y, inst_z = inst.Transform:GetWorldPosition()
				local obstacle_x, obstacle_y, obstacle_z = other.Transform:GetWorldPosition()
				local currentprojbasicammo = inst.components.zupalexsrangedweapons:GetBasicAmmo()
				local recoveredarrow = SpawnPrefab(currentprojbasicammo)
				recoveredarrow.Transform:SetPosition((2*inst_x-obstacle_x), (2*inst_y-obstacle_y), (2*inst_z-obstacle_z))
			end
		elseif inst.components.zupalexsrangedweapons ~= nil and inst:HasTag("explosive") then
			onhitbolt_explosive(inst, attacker, other) -- in case something went wrong before...
		end
 
		if inst:IsValid() then
			inst:Remove()
		end		
	elseif other:HasTag("campfire") or other:HasTag("watersource") or other:HasTag("sentry") then
--		print("Low obstalce encountered")
		RemovePhysicsColliders(inst)
		inst.Physics:CollidesWith(COLLISION.WORLD)
		inst.Physics:CollidesWith(COLLISION.OBSTACLES)
	end
end

local function regulararrowfn()
	local inst = commonarrowfn("arrow_idle", { "piercing", "sharp", "recoverable" })
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootarrow)
	inst.components.projectile:SetOnHitFn(onhitcommon)
	inst.components.projectile:SetOnMissFn(onmissarrow_regular)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	
	inst.components.inventoryitem.imagename = "arrow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/arrow.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

local function goldarrowfn()
	local inst = commonarrowfn("goldarrow_idle", { "piercing", "sharp", "golden", "recoverable" })
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootgoldarrow)
	inst.components.projectile:SetOnHitFn(onhitcommon)
	inst.components.projectile:SetOnMissFn(onmissarrow_regular)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	
	inst.components.inventoryitem.imagename = "goldarrow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/goldarrow.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

local function ondroppedMSarrow(inst)
	inst.Light:Enable(true)
end

local function moonstonearrowfn()
	local inst = commonarrowfn("moonstonearrow_idle", { "piercing", "sharp", "moonstone", "recoverable" })
	
	local light = inst.entity:AddLight()
	
	inst.Light:SetIntensity(0.6)
	inst.Light:SetRadius(0.5)
	inst.Light:SetFalloff(0.75)
	inst.Light:Enable(true)
	inst.Light:SetColour(0/255, 0/255, 255/255)
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Physics:SetCollisionCallback(oncollide)
	
    inst.components.inventoryitem:SetOnDroppedFn(ondroppedMSarrow)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootmoonstonearrow)
	inst.components.projectile:SetOnHitFn(onhitcommon)
	inst.components.projectile:SetOnMissFn(onmissarrow_regular)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	
	inst.components.inventoryitem.imagename = "moonstonearrow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/moonstonearrow.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

local function onmissarrow_special(inst, attacker, target)
	inst:Remove()
end

local function shootarrow_fire(inst)
    inst.AnimState:PlayAnimation("firearrow_flight", true)
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function shootarrow_ice(inst)
    inst.AnimState:PlayAnimation("icearrow_flight", true)
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function firearrowfn()
	local inst = commonarrowfn("firearrow_idle", { "burning", "recoverable" })
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootarrow_fire)
    inst.components.projectile:SetOnHitFn(onhitcommon)
    inst.components.projectile:SetOnMissFn(onmissarrow_regular)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	
	inst.components.inventoryitem.imagename = "firearrow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/firearrow.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

local function icearrowfn()
	local inst = commonarrowfn("icearrow_idle", { "freezing", "recoverable" })
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootarrow_ice)
    inst.components.projectile:SetOnHitFn(onhitcommon)
    inst.components.projectile:SetOnMissFn(onmissarrow_regular)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	
	inst.components.inventoryitem.imagename = "icearrow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/icearrow.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

local function startflickering(inst)
	if inst.flickering == nil then
		inst.flickering = inst:DoPeriodicTask(0.075, function(inst)
														inst.lightstate = inst.Light:IsEnabled()
														inst.Light:Enable(not inst.lightstate)
													end
											)
	end
end

local function stopflickering(inst)
	if inst.flickering ~= nil then
		inst.flickering:Cancel()
		inst.flickering = nil
	end
end

local function shootarrow_thunder(inst)
    inst.AnimState:PlayAnimation("thunderarrow_flight", true)
	startflickering(inst)
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function thunderarrowfn()
	local inst = commonarrowfn("thunderarrow_idle", { "electric", "recoverable" })
	
	local light = inst.entity:AddLight()
	
	inst.Light:SetIntensity(0.4)
	inst.Light:SetRadius(0.3)
	inst.Light:SetFalloff(0.66)
	inst.Light:SetColour(152/255, 229/255, 243/255)
	inst.Light:Enable(false)
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Physics:SetCollisionCallback(oncollide)
	
	
	inst.components.inventoryitem:SetOnDroppedFn(startflickering)	
	inst.components.inventoryitem:SetOnPickupFn(stopflickering)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootarrow_thunder)
    inst.components.projectile:SetOnHitFn(onhitcommon)
    inst.components.projectile:SetOnMissFn(onmissarrow_regular)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	
	inst.components.inventoryitem.imagename = "thunderarrow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/thunderarrow.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	inst.components.zupalexsrangedweapons.stimuli = "electric"
	
	return inst
end

local function shootarrow_thunder_discharged(inst)
    inst.AnimState:PlayAnimation("thunderarrow_flight_discharged", true)
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function dischargedthunderarrowfn()
	local inst = commonarrowfn("thunderarrow_idle_discharged", { "electric", "discharged", "recoverable" })
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootarrow_thunder_discharged)
    inst.components.projectile:SetOnHitFn(onhitcommon)
    inst.components.projectile:SetOnMissFn(onmissarrow_regular)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	
	inst.components.inventoryitem.imagename = "dischargedthunderarrow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/dischargedthunderarrow.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

------------------------------------------------------------ CROSSBOWS ------------------------------------------------------------

local function onarmedxbow(inst, armer)
	inst:AddTag("readytoshoot")
	armer.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow_armed")
end

local function OnEquipXbow(inst, owner)
	AssignProjInQuiver(inst, owner)

	-- owner.replica.combat._attackrange:set(TUNING.BOWRANGE*TUNING.CROSSBOWRANGEMOD)
	
	if inst:HasTag("readytoshoot") then
		owner.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow_armed")
	else
		owner.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow")
	end
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end
 
local function OnUnequipXbow(inst, owner)	
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function crossbowfn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
     
    anim:SetBank("crossbow")
    anim:SetBuild("crossbow")
    anim:PlayAnimation("crossbow_idle")
 
	inst:AddTag("crossbow") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	inst:AddTag("ranged")
	inst:AddTag("usequiverproj")
	
	inst._atkrange = net_float(inst.GUID, "_atkrange", "onhostsetatkrange")
	inst:ListenForEvent("onhostsetatkrange", OnHostSetAtkRange)
	
 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then	
        return inst
    end
----------------------------------------------------------------
	
--	print("BOW USES = " , TUNING.BOWUSES, "   /   BOW DMG = ", TUNING.BOWDMG)
	
	if TUNING.BOWUSES < 201 then
		inst:AddComponent("finiteuses")
		inst.components.finiteuses:SetMaxUses(TUNING.BOWUSES)
		inst.components.finiteuses:SetUses(TUNING.BOWUSES)
		inst.components.finiteuses:SetOnFinished(OnFinished)
	end
	
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "crossbow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/crossbow.xml"
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquipXbow )
    inst.components.equippable:SetOnUnequip( OnUnequipXbow )
	
	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(0)
    inst.components.weapon:SetRange((TUNING.BOWRANGE*TUNING.CROSSBOWRANGEMOD - 2), TUNING.BOWRANGE*TUNING.CROSSBOWRANGEMOD)
	inst._atkrange:set(TUNING.BOWRANGE*TUNING.CROSSBOWRANGEMOD)
    inst.components.weapon:SetProjectile("bolt")
	inst.components.weapon:SetOnAttack(onattack)
	
	inst:AddComponent("zupalexsrangedweapons")
	inst.components.zupalexsrangedweapons:SetAllowedProjectiles( { "bolt", "poisonbolt", "explosivebolt"} )
	inst.components.zupalexsrangedweapons:SetCooldownTime(1.5)
	inst.components.zupalexsrangedweapons:SetOnArmedFn(onarmedxbow)
	
    MakeHauntableLaunch(inst)
 
    return inst
end


------------------------------------------------------------ BOLTS ----------------------------------------------------------------

local function commonboltfn(boltanim, tags) 
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
     
    anim:SetBank("bolt")
    anim:SetBuild("crossbow")
    anim:PlayAnimation(boltanim)
 
	inst:AddTag("projectile") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	inst:AddTag("bolt")

	if tags ~= nil then
        for i, v in ipairs(tags) do
            inst:AddTag(v)
        end
    end

 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
----------------------------------------------------------------
	
	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(0)
	inst:AddComponent("projectile")
	
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem:SetOnPickupFn(onpickup)
	inst.components.inventoryitem:SetOnPutInInventoryFn(onputininventory)
	
	inst:AddComponent("zupalexsrangedweapons")
	
	inst:AddComponent("stackable")
	
    inst:ListenForEvent("onthrown", onthrown_regular)
	
    return inst
end

local function shootbolt(inst)
    inst.AnimState:PlayAnimation("bolt_flight",true)
    inst:AddTag("NOCLICK")
    inst.persists = false
end
	
local function regularboltfn()
	local inst = commonboltfn("bolt_idle", { "piercing", "sharp", "recoverable" })
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootbolt)
    inst.components.projectile:SetOnHitFn(onhitcommon)
    inst.components.projectile:SetOnMissFn(onmissarrow_regular)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	
	inst.components.inventoryitem.imagename = "bolt"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/bolt.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

local function shootpoisonbolt(inst)
    inst.AnimState:PlayAnimation("poisonbolt_flight",true)
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function poisonboltfn()
	local inst = commonboltfn("poisonbolt_idle", { "poison" })
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootpoisonbolt)
    inst.components.projectile:SetOnHitFn(onhitcommon)
    inst.components.projectile:SetOnMissFn(onmissarrow_regular)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	
	inst.components.inventoryitem.imagename = "poisonbolt"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/poisonbolt.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

local function shootexplosivebolt(inst)
    inst.AnimState:PlayAnimation("explosivebolt_flight",true)
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function explosiveboltfn()
	local inst = commonboltfn("explosivebolt_idle", { "explosive" })
	
	inst.entity:AddSoundEmitter()
	
	if not TheWorld.ismastersim then
        return inst
    end
		
	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootexplosivebolt)
    inst.components.projectile:SetOnHitFn(onhitcommon)
    inst.components.projectile:SetOnMissFn(onmiss_explosivebolt)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	
	inst.components.inventoryitem.imagename = "explosivebolt"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/explosivebolt.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

----------------------------------------------------------------------------------------------MAGIC BOW-----------------------------------------------------------------

local function SpawnSparkles(inst, owner)
	if inst.sparkles01 == nil then
        inst.sparkles01 = SpawnPrefab("sparkles")
        inst.sparkles01.Transform:SetPosition(inst:GetPosition():Get())
        inst.sparkles01:SetFollowTarget(owner, "swap_object", -100, -300, 0.02)
    end
	
	inst.Light:Enable(true)
	
	local ismoving = false
	
	inst.onlocomote = function(owner)
		if inst.sparkles01 ~= nil then
			if inst.components.fueled ~= nil and not inst.components.fueled:IsEmpty() then
				if owner.components.locomotor.wantstomoveforward and not ismoving then
					ismoving = true
					inst.sparkles01:SetFollowTarget(owner, "swap_hat", 50, -280, 0.02)
					inst.sparkles01.AnimState:PlayAnimation("mov", true)
		--          inst.sparkles01.SoundEmitter:PlaySound("dontstarve/common/fan_twirl_LP", "twirl")
				elseif not owner.components.locomotor.wantstomoveforward and ismoving then
					ismoving = false
					inst.sparkles01:SetFollowTarget(owner, "swap_object", -100, -300, 0.02)
					inst.sparkles01.AnimState:PlayAnimation("idle", true)
		--          inst.sparkles01.SoundEmitter:KillSound("twirl")
				end
			else
				inst:RemoveEventCallback("locomote", inst.onlocomote, owner)
			end
		else
			inst:RemoveEventCallback("locomote", inst.onlocomote, owner)
		end
    end

    inst:ListenForEvent("locomote", inst.onlocomote, owner)
end

local function OnEquipMagicBow(inst, owner)
	owner.AnimState:OverrideSymbol("swap_object", "swap_magicbow", "swap_magicbow")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
	
	-- owner.replica.combat._attackrange:set(TUNING.BOWRANGE)
	
	if inst.components.fueled ~= nil and not inst.components.fueled:IsEmpty() then
		inst:AddTag("hasfuel")
	end
	
	if inst:HasTag("hasfuel") then
		SpawnSparkles(inst, owner)
	end
	
	if inst.components.weapon.projectile.prefab == "healingarrow" and not self.inst:HasTag("healer") then
		self.inst:AddTag("healer")
	end
end
 
local function OnUnequipMagicBow(inst, owner)		
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")

	if inst.sparkles01 ~= nil then
        inst.sparkles01:SetFollowTarget(nil)
        inst.sparkles01 = nil
		inst:RemoveEventCallback("locomote", inst.onlocomote, owner)
    end
	
	inst.Light:Enable(false)
end

local function MBSetNewProjectile(inst, itemprefab)
	local currentproj = inst.components.weapon.projectile
	
	local newproj = nil
	local lightR, lightG, lightB = nil, nil, nil
	
	if itemprefab == "nightmarefuel" then
		newproj = string.lower("shadowarrow")
		lightR = 204/255
		lightG = 0/255
		lightB = 255/255
	elseif itemprefab == "z_firefliesball" then
		newproj = string.lower("lightarrow")	
		lightR = 255/255
        lightG = 253/255
		lightB = 54/255
	elseif itemprefab == "z_bluegoop" then
		newproj = string.lower("healingarrow")	
		lightR = 247/255
		lightG = 116/255
		lightB = 255/255
	end
	
	if newproj ~= nil then
		inst.components.zupalexsrangedweapons:SetFueledBy(itemprefab)
	
--		print("current proj = ", currentproj or "UNAVAILABLE", " / new proj = ", newproj or "UNAVAILABLE")
	
		if currentproj ~= newproj then
			if inst:HasTag("healer") and not newproj == "z_bluegoop" then
				inst:RemoveTag("healer")
			end
		
			inst.Light:SetColour(lightR, lightG, lightB)
			inst.components.weapon:SetProjectile(newproj)
			
--			print("I successfuly set a new projectile : ", inst.components.weapon.projectile)
			
			return true
		else
			return false
		end
	end	
end

local function magicbow_empty(inst)
	if inst.sparkles01 ~= nil then
        inst.sparkles01:SetFollowTarget(nil)
        inst.sparkles01 = nil
    end
	
	inst.Light:Enable(false)
	
	if inst:HasTag("hasfuel") then
		inst:RemoveTag("hasfuel")
	end
end

local function MagicBowCanAcceptFuelItem(self, item)
	if item ~= nil and item.components.fuel ~= nil and (item.components.fuel.fueltype == FUELTYPE.ZUPALEX or item.prefab == "nightmarefuel") then
		return true
	else
		return false
	end
end

local function MagicBowTakeFuel(self, item)		
	if self:CanAcceptFuelItem(item) then
	
		local changeproj = MBSetNewProjectile(self.inst, item.prefab)
	
--		print("changeproj = ", changeproj)
	
		if changeproj then
			self:MakeEmpty()
		end
	
		if not self.inst:HasTag("hasfuel") then
			if self.inst.components.equippable ~= nil and self.inst.components.equippable:IsEquipped() then
				self.inst.Light:Enable(true)
			end
			self.inst:AddTag("hasfuel")
		end
		
		if item.prefab =="nightmarefuel" or item.prefab == "z_bluegoop" then
			self:DoDelta(5)
		elseif item.prefab =="z_firefliesball" then
			self:DoDelta(10)
		end
		
        item:Remove()

        if TheWorld.ismastersim and self.inst.components.equippable ~= nil and self.inst.components.equippable:IsEquipped() and self.inst.sparkles01 == nil then
			local owner = self.inst.components.inventoryitem.owner
            SpawnSparkles(self.inst, owner)
        end

        return true
    end
end

local function MagicBowOnSaveFueled(self)
    if self.currentfuel > 0 then
      return { fuel = self.currentfuel }
    end
end

local function MagicBowOnSave(inst, data)	
	if inst.components.zupalexsrangedweapons and inst.components.zupalexsrangedweapons.fueledby ~= nil then
        data.fueledby = inst.components.zupalexsrangedweapons.fueledby
    end
end

local function MagicBowOnLoad(inst, data)
    if data and data.fueledby then
        MBSetNewProjectile(inst, data.fueledby)
    end
end

local function magicbowfn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
	
    anim:SetBank("magicbow")
    anim:SetBuild("bow")
    anim:PlayAnimation("magicbow_idle")
 
 	local light = inst.entity:AddLight()
	
	inst.Light:SetIntensity(0.8)
	inst.Light:SetRadius(0.5)
	inst.Light:SetFalloff(0.33)
	inst.Light:SetColour(204/255, 0/255, 255/255)
	inst.Light:Enable(false)
 
	inst:AddTag("bow") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	inst:AddTag("ranged")
	inst:AddTag("magic")
	inst:AddTag("NIGHTMARE_fueled") -- to accept the nightmarefuel as well without modifying the fueltype of the nightmarefuel (better compatibility sake)
	
	inst._atkrange = net_float(inst.GUID, "_atkrange", "onhostsetatkrange")
	inst:ListenForEvent("onhostsetatkrange", OnHostSetAtkRange)
	
 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then	
        return inst
    end
----------------------------------------------------------------
	
--	print("BOW USES = " , TUNING.BOWUSES, "   /   BOW DMG = ", TUNING.BOWDMG)
	
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "magicbow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/magicbow.xml"
	inst.components.inventoryitem:SetOnDroppedFn(function(inst) inst.Light:Enable(false) end)
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquipMagicBow )
    inst.components.equippable:SetOnUnequip( OnUnequipMagicBow )
	
	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(0)
    inst.components.weapon:SetRange((TUNING.BOWRANGE - 2), TUNING.BOWRANGE)
	inst._atkrange:set(TUNING.BOWRANGE)
    inst.components.weapon:SetProjectile("shadowarrow")
	inst.components.weapon:SetOnAttack(onattack)
	
	inst:AddComponent("zupalexsrangedweapons")
	inst.components.zupalexsrangedweapons:SetCooldownTime(1.3)
	
	inst:AddComponent("fueled")
	inst.components.fueled.accepting = true
	inst.components.fueled.fueltype = FUELTYPE.ZUPALEX
--	inst.components.fueled:InitializeFuelLevel(0)
	inst.components.fueled.maxfuel = 10
	inst.components.fueled:StopConsuming()
	inst.components.fueled.CanAcceptFuelItem = MagicBowCanAcceptFuelItem
	inst.components.fueled.TakeFuelItem = MagicBowTakeFuel
	inst.components.fueled:SetDepletedFn(magicbow_empty)
	
	inst.components.fueled.OnSave = MagicBowOnSaveFueled
	
	inst.OnSave = MagicBowOnSave
	inst.OnLoad = MagicBowOnLoad
	
--	for k, v in pairs(FUELTYPE) do
--		print(v)
--	end
	
    MakeHauntableLaunch(inst)
 
    return inst
end


--------------------------------------------------------------------------MAGIC PROJECTILES-------------------------------------------------------------------------

local function commonmagicprojfn(arrowanim, tags) 
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
 
    MakeInventoryPhysics(inst)
 
 	anim:SetBank("magicprojectile")
    anim:SetBuild("bow")
    anim:PlayAnimation(arrowanim)
 
	inst:AddTag("projectile") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	inst:AddTag("arrow")
	inst:AddTag("magic")

	if tags ~= nil then
        for i, v in ipairs(tags) do
            inst:AddTag(v)
        end
    end
	
 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then	
        return inst
    end
----------------------------------------------------------------

	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(0)
	inst:AddComponent("projectile")	
	
	inst:AddComponent("zupalexsrangedweapons")
	
    inst:ListenForEvent("onthrown", onthrown_regular)
	
    return inst
end

local function shootshadowarrow(inst)
    inst.AnimState:PlayAnimation("shadowarrow_flight")
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function shadowarrowfn()
	local inst = commonmagicprojfn("shadowarrow_flight", { "shadow" })
	
	RemovePhysicsColliders(inst)
	
	local light = inst.entity:AddLight()
	
	inst.Light:SetIntensity(0.8)
	inst.Light:SetRadius(3)
	inst.Light:SetFalloff(0.33)
	inst.Light:Enable(true)
	inst.Light:SetColour(119/255, 45/255, 166/255)
	
	inst:AddTag("energy")
	inst:AddTag("nocollisionoverride")
	
	inst.persists = false
	
	if not TheWorld.ismastersim then
        return inst
    end
	
--	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootshadowarrow)
	inst.components.projectile:SetOnHitFn(onhitcommon)
	inst.components.projectile:SetOnMissFn(inst.Remove)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	
	return inst
end

local function shootlightarrow(inst)
    inst.AnimState:PlayAnimation("lightarrow_flight")
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function lightarrowfn()
	local inst = commonmagicprojfn("lightarrow_flight", { "light" })
	
	RemovePhysicsColliders(inst)
	
	local light = inst.entity:AddLight()
	
	inst.Light:SetIntensity(0.8)
	inst.Light:SetRadius(3)
	inst.Light:SetFalloff(0.33)
	inst.Light:Enable(true)
	inst.Light:SetColour(255/255, 253/255, 54/255)
	
	inst:AddTag("energy")
	inst:AddTag("nocollisionoverride")
	
	inst.persists = false
	
	if not TheWorld.ismastersim then
        return inst
    end
	
--	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(30)
	inst.components.projectile:SetOnThrownFn(shootlightarrow)
	inst.components.projectile:SetOnHitFn(onhitcommon)
	inst.components.projectile:SetOnMissFn(inst.Remove)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	
	return inst
end

local function shoothealingarrow(inst)
    inst.AnimState:PlayAnimation("healingarrow_flight")
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function healingarrowfn()
	local inst = commonmagicprojfn("healingarrow_flight", { "healing" })
	
	RemovePhysicsColliders(inst)
	
	local light = inst.entity:AddLight()
	
	inst.Light:SetIntensity(0.8)
	inst.Light:SetRadius(3)
	inst.Light:SetFalloff(0.33)
	inst.Light:Enable(true)
	inst.Light:SetColour(247/255, 116/255, 255/255)
	
	inst:AddTag("energy")
	inst:AddTag("nocollisionoverride")
	
	inst.persists = false
	
	if not TheWorld.ismastersim then
        return inst
    end
	
--	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(20)
	inst.components.projectile:SetOnThrownFn(shoothealingarrow)
	inst.components.projectile:SetOnHitFn(onhitcommon)
	inst.components.projectile:SetOnMissFn(inst.Remove)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	
	return inst
end


---------------------------------------------------------MUSKET-----------------------------------------------------------------------------------

local function OnEquipMusket(inst, owner)
	-- owner.replica.combat._attackrange:set(TUNING.BOWRANGE*TUNING.MUSKETRANGEMOD)

    owner.AnimState:OverrideSymbol("swap_object", "swap_musket", "swap_musket")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end
 
local function OnUnequipMusket (inst, owner)	
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function shootmusketbullet(inst)
	local smoke = SpawnPrefab("musketsmoke")
	local smokeposx, smokeposy, smokeposz = inst.Transform:GetWorldPosition()
	smoke.Transform:SetPosition(smokeposx, smokeposy, smokeposz)
	smoke.AnimState:SetScale(0.5,0.5,-1)
	
    inst.AnimState:PlayAnimation("flight")
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function musket_bulletfn() 
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
 
    MakeInventoryPhysics(inst)
 
 	anim:SetBank("bullet")
    anim:SetBuild("musket")
    anim:PlayAnimation("idle")
 
	inst:AddTag("projectile") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	inst:AddTag("bullet")
	
 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then	
        return inst
    end
----------------------------------------------------------------
	
    inst:AddComponent("inspectable")
	
	inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "musket_bullet"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/musket_bullet.xml"
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(0)
	inst:AddComponent("projectile")	
	inst.components.projectile:SetSpeed(80)
	inst.components.projectile:SetOnHitFn(onhitcommon)
	inst.components.projectile:SetOnMissFn(inst.Remove)
	inst.components.projectile:SetLaunchOffset(Vector3(1, 1.05, 0))
	inst.components.projectile:SetOnThrownFn(shootmusketbullet)
	inst:ListenForEvent("onthrown", onthrown_regular)
	
	inst:AddComponent("zupalexsrangedweapons")
	 
    return inst
end

local function onarmedmusket(inst, armer, projtouse)
	if not inst:HasTag("readytoshoot") then		
		local inventory = armer.components.inventory
		if projtouse then
			if inventory and inventory:Has(projtouse, 1) then
				inventory:ConsumeByName(projtouse, 1)
				inst:AddTag("readytoshoot")
			end
		elseif inventory and inventory:Has("musket_bullet", 1) then
			inventory:ConsumeByName("musket_bullet", 1)
			inst:AddTag("readytoshoot")
		elseif inventory and inventory:Has("musket_silverbullet", 1) then
			inventory:ConsumeByName("musket_silverbullet", 1)
			inst:AddTag("readytoshoot")
		end
	end
end

local function OnSaveMusket(inst, data)
	if inst:HasTag("readytoshoot") then
		data.loaded = 1
	end
end

local function OnLoadMusket(inst, data)
	if data~= nil and data.loaded and data.loaded == 1 then
		inst:AddTag("readytoshoot")
	end
end

local function musketfn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
     
    anim:SetBank("musket")
    anim:SetBuild("musket")
    anim:PlayAnimation("musket_idle")
 
	inst:AddTag("musket") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	inst:AddTag("ranged")
	
	inst._atkrange = net_float(inst.GUID, "_atkrange", "onhostsetatkrange")
	inst:ListenForEvent("onhostsetatkrange", OnHostSetAtkRange)
	
 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then	
        return inst
    end
----------------------------------------------------------------
	
--	print("BOW USES = " , TUNING.BOWUSES, "   /   BOW DMG = ", TUNING.BOWDMG)
	
	if TUNING.BOWUSES < 201 then
		inst:AddComponent("finiteuses")
		inst.components.finiteuses:SetMaxUses(TUNING.BOWUSES)
		inst.components.finiteuses:SetUses(TUNING.BOWUSES)
		inst.components.finiteuses:SetOnFinished(OnFinished)
	end
	
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "musket"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/musket.xml"
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquipMusket )
    inst.components.equippable:SetOnUnequip( OnUnequipMusket )
	
	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(0)
    inst.components.weapon:SetRange((TUNING.BOWRANGE*TUNING.MUSKETRANGEMOD-2), TUNING.BOWRANGE*TUNING.MUSKETRANGEMOD)
	inst._atkrange:set(TUNING.BOWRANGE*TUNING.MUSKETRANGEMOD)
    inst.components.weapon:SetProjectile("musket_bullet")
	inst.components.weapon:SetOnAttack(onattack)
	
	inst:AddComponent("zupalexsrangedweapons")
	inst.components.zupalexsrangedweapons:SetOnArmedFn(onarmedmusket)
	inst.components.zupalexsrangedweapons:SetAllowedProjectiles( { "musket_bullet" } )
	inst.components.zupalexsrangedweapons:SetCooldownTime(1.3)
	
	inst.OnSave = OnSaveMusket
	inst.OnLoad = OnLoadMusket

    MakeHauntableLaunch(inst)
 
    return inst
end


--------------------------------------------------------------------------FXs-------------------------------------------------------------------------

local function AlignToOwner(inst)
    if inst.followtarget ~= nil then
		local ownerrot = inst.followtarget.Transform:GetRotation()
        inst.Transform:SetRotation(ownerrot)
    end
end


local function SetFollowTarget(inst, target, follow_symbol, follow_x, follow_y, follow_z)
    inst.followtarget = target
	if inst.followtarget ~= nil then
		inst.Follower:FollowSymbol(target.GUID, follow_symbol, follow_x, follow_y, follow_z)
		inst.savedfollowtarget = target
	elseif inst.savedfollowtarget ~= nil then
		inst:Remove()
	end
end

local function poisoncloudfn(proxy)
	local inst = CreateEntity()

	inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddFollower()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

    inst.AnimState:SetBank("fx")
    inst.AnimState:SetBuild("bow")
    inst.AnimState:PlayAnimation("poisoncloud", true)
	
	-----------------------------------------------------
    inst:AddTag("FX")
	inst:AddTag("NOCLICK")

    inst.persists = false

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.SetFollowTarget = SetFollowTarget

    return inst
end

local function stuneffectfn(proxy)
	local inst = CreateEntity()

	inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddFollower()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

    inst.AnimState:SetBank("fx")
    inst.AnimState:SetBuild("bow")
    inst.AnimState:PlayAnimation("stuneffect", true)
	
	-----------------------------------------------------
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
	
    inst.persists = false

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.SetFollowTarget = SetFollowTarget

    return inst
end

local function musketsmokefn(anim)
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork()
	inst.entity:AddAnimState()
    inst:AddTag("NOCLICK")
    inst:AddTag("FX")

    inst.AnimState:SetBank("collapse")
    inst.AnimState:SetBuild("structure_collapse_fx")
    inst.AnimState:PlayAnimation("collapse_small")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false
    inst:DoTaskInTime(1, inst.Remove)

	inst:ListenForEvent("animover", inst.Remove)
	
    return inst
end

return  Prefab("common/inventory/bow", bowfn, assets, prefabs),
		Prefab("common/inventory/arrow", regulararrowfn, assets, prefabs),
		Prefab("common/inventory/goldarrow", goldarrowfn, assets, prefabs),
		Prefab("common/inventory/moonstonearrow", moonstonearrowfn, assets, prefabs),
		Prefab("common/inventory/firearrow", firearrowfn, assets, prefabs),
		Prefab("common/inventory/icearrow", icearrowfn, assets, prefabs),
		Prefab("common/inventory/thunderarrow", thunderarrowfn, assets, prefabs),
		Prefab("common/inventory/dischargedthunderarrow", dischargedthunderarrowfn, assets, prefabs),
		Prefab("common/inventory/crossbow", crossbowfn, assets, prefabs),
		Prefab("common/inventory/bolt", regularboltfn, assets, prefabs),
		Prefab("common/inventory/poisonbolt", poisonboltfn, assets, prefabs),
		Prefab("common/inventory/explosivebolt", explosiveboltfn, assets, prefabs),
		Prefab("common/inventory/magicbow", magicbowfn, assets, prefabs),
		Prefab("common/inventory/shadowarrow", shadowarrowfn, assets),
		Prefab("common/inventory/lightarrow", lightarrowfn, assets),
		Prefab("common/inventory/healingarrow", healingarrowfn, assets),
		Prefab("common/inventory/musket", musketfn, assets, prefabs),
		Prefab("common/inventory/musket_bullet", musket_bulletfn, assets, prefabs),
		Prefab("common/fx/poisoncloud", poisoncloudfn, assets),
		Prefab("common/fx/stuneffect", stuneffectfn, assets),
		Prefab("common/fx/musketsmoke", musketsmokefn, assets)	