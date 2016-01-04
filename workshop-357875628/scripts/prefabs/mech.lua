require "prefabutil"

local function OnIsPathFindingDirty(inst)
    if inst._ispathfinding:value() then
        if inst._pfpos == nil then
            inst._pfpos = inst:GetPosition()
            TheWorld.Pathfinder:AddWall(inst._pfpos:Get())
        end
    elseif inst._pfpos ~= nil then
        TheWorld.Pathfinder:RemoveWall(inst._pfpos:Get())
        inst._pfpos = nil
    end
end

local function InitializePathFinding(inst)
    inst:ListenForEvent("onispathfindingdirty", OnIsPathFindingDirty)
    OnIsPathFindingDirty(inst)
end

local function makeobstacle(inst)
    inst.Physics:SetActive(true)
    inst._ispathfinding:set(true)
end

local function clearobstacle(inst)
    inst.Physics:SetActive(false)
    inst._ispathfinding:set(false)
end

local anims = {
    { threshold = 0, anim = "broken" },
    { threshold = 0.4, anim = "onequarter" },
    { threshold = 0.5, anim = "half" },
    { threshold = 0.99, anim = "threequarter" },
    { threshold = 1, anim = {"fullA", "fullB", "fullC"} },
}

local function resolveanimtoplay(inst, percent)
    for i,v in ipairs(anims) do
        if percent <= v.threshold then
            if type(v.anim) == "table" then
                local x,y,z = inst.Transform:GetWorldPosition()
                local x = math.floor(x)
                local z = math.floor(z)
                local t = ( ((x%4)*(x+3)%7) + ((z%4)*(z+3)%7) )% #v.anim + 1
                return v.anim[t]
            else
                return v.anim
            end
        end
    end
end

local function onhealthchange(inst, old_percent, new_percent)
	if old_percent <= 0 and new_percent > 0 then inst:RemoveTag("broken") makeobstacle(inst) end
	if old_percent > 0 and new_percent <= 0 then inst:AddTag("broken") clearobstacle(inst) end

    local anim_to_play = resolveanimtoplay(inst, new_percent)
    if new_percent > 0 and inst.components.wallgates:IsOpen() then
		inst.AnimState:PlayAnimation("broken")
	elseif new_percent > 0 and not inst.components.wallgates:IsOpen() then
        inst.AnimState:PlayAnimation(anim_to_play.."_hit")      
        inst.AnimState:PushAnimation(anim_to_play, false)       
    else
        inst.AnimState:PlayAnimation(anim_to_play)      
    end
end

local function onremove(inst)
    inst._ispathfinding:set_local(false)
    OnIsPathFindingDirty(inst)
end

function MakeMechType(data)

    local assets =
    {
        Asset("ANIM", "anim/wall.zip"),
        Asset("ANIM", "anim/mech_".. data.name..".zip"),
		Asset("ATLAS", "images/inventoryimages/mech_"..data.name.."_item.xml"),
    }

    local prefabs =
    {
        "collapse_small",
    }

    local function onhammered(inst, worker)
        if data.maxloots and data.loot then
            local num_loots = math.max(1, math.floor(data.maxloots*inst.components.health:GetPercent()))
            for k = 1, num_loots do
                inst.components.lootdropper:SpawnLootPrefab(data.loot)
            end
        end

        SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())

        if data.destroysound then
            inst.SoundEmitter:PlaySound(data.destroysound)
        end
		
		local modname = KnownModIndex:GetModActualName("Wall Gates")
		local loot_ver = GetModConfigData("Wall Gates Recipe", modname)
		if loot_ver == "gears" then
			SpawnPrefab("gears").Transform:SetPosition(inst.Transform:GetWorldPosition())
			SpawnPrefab("goldnugget").Transform:SetPosition(inst.Transform:GetWorldPosition())
		elseif loot_ver == "transistor" then
			SpawnPrefab("goldnugget").Transform:SetPosition(inst.Transform:GetWorldPosition())
			SpawnPrefab("transistor").Transform:SetPosition(inst.Transform:GetWorldPosition())
		elseif loot_ver == "gold" then
			SpawnPrefab("goldnugget").Transform:SetPosition(inst.Transform:GetWorldPosition())
			SpawnPrefab("goldnugget").Transform:SetPosition(inst.Transform:GetWorldPosition())
		end
        inst:Remove()
    end

	local function closewallremote(inst)
		local var = inst.components.health:GetPercent()
		if var <= 0 then
			if data.destroysound then
				inst.SoundEmitter:PlaySound(data.destroysound)
			end
			inst.components.wallgates.isopen = true
			inst.AnimState:PushAnimation("broken")
		elseif var <= .4 then
			inst.components.wallgates.isopen = false
			inst.AnimState:PlayAnimation("onequarter")
			if data.buildsound then
				inst.SoundEmitter:PlaySound(data.buildsound)
			end
			makeobstacle(inst)
		elseif var <= .5 then
			inst.components.wallgates.isopen = false
			inst.AnimState:PlayAnimation("half")
			if data.buildsound then
				inst.SoundEmitter:PlaySound(data.buildsound)
			end
			makeobstacle(inst)
		elseif var <= .9 then
			inst.components.wallgates.isopen = false
			inst.AnimState:PlayAnimation("threequarter")
			if data.buildsound then
				inst.SoundEmitter:PlaySound(data.buildsound)
			end
			makeobstacle(inst)
		else
			inst.AnimState:PlayAnimation(resolveanimtoplay(inst, inst.components.health:GetPercent()))
			if data.buildsound then
				inst.SoundEmitter:PlaySound(data.buildsound)
			end
			inst.components.wallgates.isopen = false
			makeobstacle(inst)
		end
	end
	
	local function closewall(inst)
		local x,y,z = inst.Transform:GetWorldPosition()
		local nearbywallgates = TheSim:FindEntities(x,y,z, 2, {"wallgate"} )
		for i = 2, #nearbywallgates do
			if nearbywallgates[i].components.wallgates.isopen == true and not nearbywallgates[i]:HasTag("broken") then
				closewallremote(nearbywallgates[i])
			end
		end
		
		local var = inst.components.health:GetPercent()
		if var <= 0 then
			if data.destroysound then
				inst.SoundEmitter:PlaySound(data.destroysound)
			end	
			inst.components.wallgates.isopen = true
			inst.AnimState:PushAnimation("broken")
		elseif var <= .4 then
			inst.components.wallgates.isopen = false
			inst.AnimState:PlayAnimation("onequarter")
			if data.buildsound then
				inst.SoundEmitter:PlaySound(data.buildsound)
			end
			makeobstacle(inst)
		elseif var <= .5 then
			inst.components.wallgates.isopen = false
			inst.AnimState:PlayAnimation("half")
			if data.buildsound then
				inst.SoundEmitter:PlaySound(data.buildsound)
			end
			makeobstacle(inst)
		elseif var <= .9 then
			inst.components.wallgates.isopen = false
			inst.AnimState:PlayAnimation("threequarter")
			if data.buildsound then
				inst.SoundEmitter:PlaySound(data.buildsound)
			end
			makeobstacle(inst)
		else
			inst.AnimState:PlayAnimation(resolveanimtoplay(inst, inst.components.health:GetPercent()))
			if data.buildsound then
				inst.SoundEmitter:PlaySound(data.buildsound)
			end
			inst.components.wallgates.isopen = false
			makeobstacle(inst)
		end
	end
	
	local function ondeploywall(inst, pt, deployer)
        local mech = SpawnPrefab("mech_"..data.name) 
        if mech ~= nil then 
			pt = Vector3(math.floor(pt.x) + .5, 0, math.floor(pt.z) + .5)
            mech.Physics:SetCollides(false)
            mech.Physics:Teleport(pt:Get())
            mech.Physics:SetCollides(true)
            inst.components.stackable:Get():Remove()
            TheWorld.Pathfinder:AddWall(pt:Get())
			closewall(mech)
        end
    end
	
	local function openwallremote(inst)
	    inst.components.wallgates.isopen = true
	    if data.destroysound then
			inst.SoundEmitter:PlaySound(data.destroysound)
		end	
	    inst.AnimState:PlayAnimation("broken")
	    clearobstacle(inst)
	end
	
	local function openwall(inst)
		local x,y,z = inst.Transform:GetWorldPosition()
		local nearbywallgates = TheSim:FindEntities(x,y,z, 2, {"wallgate"} )
		for i = 2, #nearbywallgates do
			if nearbywallgates[i].components.wallgates.isopen == false and not nearbywallgates[i]:HasTag("broken") then
				openwallremote(nearbywallgates[i])
			end
		end
		
		inst.components.wallgates.isopen = true
	    if data.destroysound then
			inst.SoundEmitter:PlaySound(data.destroysound)
		end		
	    inst.AnimState:PlayAnimation("broken")
	    clearobstacle(inst)
	end
	
    local function itemfn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst:AddTag("wallbuilder")

        inst.AnimState:SetBank("wall")
        inst.AnimState:SetBuild("mech_"..data.name)
        inst.AnimState:PlayAnimation("idle")

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM

        inst:AddComponent("inspectable")
        inst:AddComponent("inventoryitem")
		inst.components.inventoryitem.atlasname = "images/inventoryimages/mech_"..data.name.."_item.xml"

        if data.flammable then
            MakeSmallBurnable(inst, TUNING.MED_BURNTIME)
            MakeSmallPropagator(inst)
            
            inst:AddComponent("fuel")
            inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL

            MakeDragonflyBait(inst, 3)
        end

        inst:AddComponent("deployable")
        inst.components.deployable.ondeploy = ondeploywall
        inst.components.deployable:SetDeployMode(DEPLOYMODE.WALL)

        MakeHauntableLaunch(inst)

        return inst
    end

    local function onhit(inst)
        if data.destroysound then
            inst.SoundEmitter:PlaySound(data.destroysound)
        end

        local healthpercent = inst.components.health:GetPercent()
        local anim_to_play = resolveanimtoplay(inst, healthpercent)
		if healthpercent > 0 and inst.components.wallgates:IsOpen() then
			inst.AnimState:PlayAnimation("broken")
        elseif healthpercent > 0 then
            inst.AnimState:PlayAnimation(anim_to_play.."_hit")
            inst.AnimState:PushAnimation(anim_to_play, false)
        end
    end

    local function onrepaired(inst)
        if data.buildsound then
            inst.SoundEmitter:PlaySound(data.buildsound)
        end
        openwall(inst)
    end
	
	local function onload(inst)
		if inst.components.health:IsDead() then
			inst:AddTag("broken")
			clearobstacle(inst)
		end
	end
	
    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        inst.Transform:SetEightFaced()

        MakeObstaclePhysics(inst, .5)
        inst.Physics:SetDontRemoveOnSleep(true)

        inst:AddTag("wall")
		inst:AddTag("wallgate")

        inst.AnimState:SetBank("wall")
        inst.AnimState:SetBuild("mech_"..data.name)
        inst.AnimState:PlayAnimation("fullA", false)

        for i, v in ipairs(data.tags) do
            inst:AddTag(v)
        end

        MakeSnowCoveredPristine(inst)

        inst._pfpos = nil
        inst._ispathfinding = net_bool(inst.GUID, "_ispathfinding", "onispathfindingdirty")
        makeobstacle(inst)
        inst:DoTaskInTime(0, InitializePathFinding)

        inst.OnRemoveEntity = onremove

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("inspectable")
        inst:AddComponent("lootdropper")

        inst:AddComponent("repairable")
        if data.name == "ruins" then
            inst.components.repairable.repairmaterial = MATERIALS.THULECITE
        else
            inst.components.repairable.repairmaterial = data.name
        end
        inst.components.repairable.onrepaired = onrepaired

        inst:AddComponent("combat")
        inst.components.combat.onhitfn = onhit

        inst:AddComponent("health")
        inst.components.health:SetMaxHealth(data.maxhealth)
        inst.components.health:SetCurrentHealth(data.maxhealth / 2)
        inst.components.health.ondelta = onhealthchange
        inst.components.health.nofadeout = true
        inst.components.health.canheal = false
        if data.name == "moonrock" then
            inst.components.health:SetAbsorptionAmountFromPlayer(TUNING.MOONROCKWALL_PLAYERDAMAGEMOD)
        end
		
		inst:AddComponent("wallgates")
		inst.components.wallgates.openwallfn = openwall
        inst.components.wallgates.closewallfn = closewall
		
        inst:AddTag("noauradamage")

        if data.flammable then
            MakeMediumBurnable(inst)
            MakeLargePropagator(inst)
            inst.components.burnable.flammability = .5

            if data.name == MATERIALS.WOOD then
                inst.components.propagator.flashpoint = 30+math.random()*10         
            end
			inst.components.burnable.canlight = false
        else
            inst.components.health.fire_damage_scale = 0
        end

        if data.buildsound then
            inst.SoundEmitter:PlaySound(data.buildsound)        
        end

        inst:AddComponent("workable")
        inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
        if data.name == "moonrock" then
            inst.components.workable:SetWorkLeft(TUNING.MOONROCKWALL_WORK)
        else
            inst.components.workable:SetWorkLeft(3)
        end
        inst.components.workable:SetOnFinishCallback(onhammered)
        inst.components.workable:SetOnWorkCallback(onhit) 

        MakeHauntableWork(inst)

        inst.OnLoad = onload

        inst:DoTaskInTime(0, function()
			if inst.components.wallgates.isopen == false then
				inst.AnimState:PlayAnimation(resolveanimtoplay(inst, inst.components.health:GetPercent()))			
			else
				inst.AnimState:PlayAnimation("broken")
			end
        end)

        MakeSnowCovered(inst)

        return inst
    end

    return Prefab("common/mech_"..data.name, fn, assets, prefabs),
           Prefab("common/mech_"..data.name.."_item", itemfn, assets, {"mech_"..data.name, "mech_"..data.name.."_item_placer", "collapse_small"}),
           MakePlacer("common/mech_"..data.name.."_item_placer", "wall", "mech_"..data.name, "half", false, false, true, nil, nil, "eight")
end

local mechprefabs = {}

local mechdata = {
            {name = MATERIALS.STONE, tags={"stone"}, loot = "rocks", maxloots = 2, maxhealth=TUNING.STONEWALL_HEALTH, paintable = true, buildsound="dontstarve/common/place_structure_stone", destroysound="dontstarve/common/destroy_stone"},
            {name = MATERIALS.WOOD, tags={"wood"}, loot = "log", maxloots = 2, maxhealth=TUNING.WOODWALL_HEALTH, flammable = true, buildsound="dontstarve/common/place_structure_wood", destroysound="dontstarve/common/destroy_wood"},
            {name = MATERIALS.HAY, tags={"grass"}, loot = "cutgrass", maxloots = 2, maxhealth=TUNING.HAYWALL_HEALTH, flammable = true, buildsound="dontstarve/common/place_structure_straw", destroysound="dontstarve/common/destroy_straw"},
            {name = "ruins", tags={"stone", "ruins"}, loot = "thulecite_pieces", maxloots = 2, maxhealth=TUNING.RUINSWALL_HEALTH, buildsound="dontstarve/common/place_structure_stone", destroysound="dontstarve/common/destroy_stone"},
            {name = "moonrock", tags={"stone", "moonrock"}, loot = "moonrocknugget", maxloots = 2, maxhealth=TUNING.MOONROCKWALL_HEALTH, paintable = true, buildsound="dontstarve/common/place_structure_stone", destroysound="dontstarve/common/destroy_stone"},
        }

for k,v in pairs(mechdata) do
    local mech, item, placer = MakeMechType(v)
    table.insert(mechprefabs, mech)
    table.insert(mechprefabs, item)
    table.insert(mechprefabs, placer)
end

return unpack(mechprefabs)
