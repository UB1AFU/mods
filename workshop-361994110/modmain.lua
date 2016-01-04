local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

AddPrefabPostInit("beehat", function(inst)

    inst:AddComponent("fueled")
    inst.components.fueled.fueltype = GLOBAL.FUELTYPE.USAGE
    inst.components.fueled:InitializeFuelLevel(GLOBAL.TUNING.EARMUFF_PERISHTIME / 3)
    inst.components.fueled:SetDepletedFn(inst.Remove)
    
    inst:ListenForEvent("percentusedchange", function (inst, data)
    
    local maxfuel = GLOBAL.TUNING.EARMUFF_PERISHTIME / 3
    local maxcondition = TUNING.ARMOR_BEEHAT
    
        if inst.components.armor then
            inst.components.armor.condition = math.min(data.percent * maxcondition)
        end
        
        if inst.components.fueled then
            inst.components.fueled.currentfuel = math.min(data.percent * maxfuel)
        end
    end)
end)

AddPrefabPostInit("beebox", function(inst)

    local levels =
    {
        { amount=6, idle="honey3", hit="hit_honey3" },
        { amount=3, idle="honey2", hit="hit_honey2" },
        { amount=1, idle="honey1", hit="hit_honey1" },
        { amount=0, idle="bees_loop", hit="hit_idle" },
    }

    local function setlevel(inst, level)
        if not inst.anims then
            inst.anims = {idle = level.idle, hit = level.hit}
        else
            inst.anims.idle = level.idle
            inst.anims.hit = level.hit
        end
        inst.AnimState:PlayAnimation(inst.anims.idle)
    end

    local function updatelevel(inst)
        for k,v in pairs(levels) do
            if inst.components.harvestable.produce >= v.amount then
                setlevel(inst, v)
                break
            end
        end
    end
    
    local function OnHarvest(inst, picker)
        updatelevel(inst)
        if inst.components.childspawner and not GLOBAL.TheWorld.state.iswinter then
            if not (picker.components.inventory and picker.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HEAD) and picker.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HEAD).prefab == "beehat") then 
                inst.components.childspawner:ReleaseAllChildren(picker)
            end
        end
    end
    
    if inst.components.harvestable then
        inst.components.harvestable:SetUp("honey", 6, nil, OnHarvest, updatelevel)
    end
    
    
end)

if GLOBAL.KnownModIndex:GetModActualName("DST Fish Farm") then
    
    AddPrefabPostInit("w_pond", function (inst)
    
        local levels = 
        {
            { amount=3, idle="honey3", hit="hit_honey3" },
            { amount=2, idle="honey2", hit="hit_honey2" },
            { amount=1, idle="honey1", hit="hit_honey1" },
            { amount=0, idle="bees_loop", hit="hit_idle" },
        }
        
        local function setlevel(inst, level)
            if not inst.anims then
                inst.anims = {idle = level.idle, hit = level.hit}
            else
                inst.anims.idle = level.idle
                inst.anims.hit = level.hit
            end
            inst.AnimState:PlayAnimation(inst.anims.idle)
        end

        local function updatelevel(inst)
            for k,v in pairs(levels) do
                if inst.components.harvestable.produce >= v.amount then
                    setlevel(inst, v)
                    break
                end
            end
        end

        local function OnHarvest(inst, picker)
            updatelevel(inst)
            if inst.components.childspawner and not GLOBAL.TheWorld.state.iswinter then
                if not (picker.components.inventory and picker.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HEAD) and picker.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HEAD).prefab == "beehat") then 
                    inst.components.childspawner:ReleaseAllChildren(picker)
                end
            end
        end

        if inst.components.harvestable then
            inst.components.harvestable:SetUp("fish", 3, nil, OnHarvest, updatelevel)
        end
    end)
end
