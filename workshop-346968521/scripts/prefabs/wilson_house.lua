

local assets =
{
    Asset("ANIM", "anim/wilson_house.zip"),

}

local prefabs = 
{
    
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()
end

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("hit")
	inst.AnimState:PushAnimation("idle", true)
end

local function onfinished(inst)
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()              
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle", false)
end

local function wakeuptest(inst, phase)
    if phase ~= "night" then
        inst:PushEvent("wake")
    end
end

local function onwake(inst, sleeper)    
    if inst.sleeptask ~= nil then
        inst.sleeptask:Cancel()
        inst.sleeptask = nil
    end

    inst:StopWatchingWorldState("phase", wakeuptest)

    sleeper.sg:GoToState("wakeup")

    inst.AnimState:PushAnimation("wilson_house", true)

    inst.components.finiteuses:Use()
end

local function onhousetick(inst, sleeper)

		

    if sleeper.components.hunger ~= nil then
        -- Check SGwilson, state "bedroll", if you change this value
        sleeper.components.hunger:DoDelta(TUNING.SLEEP_HUNGER_PER_TICK, true, true)
    end

    if sleeper.components.sanity ~= nil and sleeper.components.sanity:GetPercentWithPenalty() < 1 then
        sleeper.components.sanity:DoDelta(TUNING.SLEEP_SANITY_PER_TICK, true)
    end

    if sleeper.components.health ~= nil and (not sleeper.components.hunger or sleeper.components.hunger:GetPercent() > 0) then
        sleeper.components.health:DoDelta(TUNING.SLEEP_HEALTH_PER_TICK * 2, true, "tent", true)
    end

    if sleeper.components.temperature ~= nil then
        sleeper.components.temperature:SetTemperature(sleeper.components.temperature:GetCurrent() + TUNING.SLEEP_TEMP_PER_TICK) 
    end
end

local function onsleep(inst, sleeper)
	-- check if we're in an invalid period (i.e. daytime). if so: wakeup
    inst:WatchWorldState("phase", wakeuptest)

    -- "occupied" anim
    inst.AnimState:PlayAnimation("wilson_house", true)

    if inst.sleeptask ~= nil then
        inst.sleeptask:Cancel()
    end
    inst.sleeptask = inst:DoPeriodicTask(TUNING.HOUSE_TICK_PERIOD, onhousetick, nil, sleeper)
end

local function fn(Sim)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()
     
    local light = inst.entity:AddLight()
    inst.Light:Enable(false)
    inst.Light:SetRadius(1.5)
    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(235/255,121/255,12/255)
     
    MakeObstaclePhysics(inst, 1.5)
     
    if not TheWorld.ismastersim then
        return inst
    end
     
    inst.entity:SetPristine()
     
    inst:AddTag("structure")    
    inst:AddTag("tent")
    inst:AddTag("nosleepanim")     

    inst.AnimState:SetBank("wilson_house")
    inst.AnimState:SetBuild("wilson_house")
    inst.AnimState:PlayAnimation("wilson_house", true)    
    
    inst.MiniMapEntity:SetIcon( "wilson_house.tex" )
     
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(1)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)     
 
    inst:AddComponent("inspectable")
  
    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(20)
    inst.components.finiteuses:SetUses(20)
    inst.components.finiteuses:SetOnFinished( onfinished )
     
    inst:AddComponent("sleepingbag")
    inst.components.sleepingbag.onsleep = onsleep
    inst.components.sleepingbag.onwake = onwake
     
    return inst
end

return Prefab( "common/objects/wilson_house", fn, assets),
		MakePlacer( "common/wilson_house_placer", "wilson_house", "wilson_house", "wilson_house" ) 
