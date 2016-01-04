local assets = {
	Asset("ANIM", "anim/geralt_blizzpot.zip"),
	Asset("ATLAS", "images/inventoryimages/geralt_blizzpot.xml"),
}

local function item_oneaten(inst, eater)
	eater.blizzpotresttime = 30 * 8
	eater.components.sanity.dapperness = eater.components.sanity.dapperness - TUNING.DAPPERNESS_SMALL
	eater.components.hunger.hungerrate = eater.components.hunger.hungerrate + 0.05
	eater.components.locomotor.walkspeed = eater.components.locomotor.walkspeed * GERALT_BLIZZPOT_SPEED
	eater.components.locomotor.runspeed = eater.components.locomotor.runspeed * GERALT_BLIZZPOT_SPEED
end

local function fn()
	local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
 
    MakeInventoryPhysics(inst)
 
	inst.AnimState:SetBank("geralt_blizzpot")
    inst.AnimState:SetBuild("geralt_blizzpot")
    inst.AnimState:PlayAnimation("idle")
     
    inst.entity:SetPristine()
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst:AddComponent("edible")
    inst.components.edible.foodtype = FOODTYPE.POTION
    inst.components.edible.healthvalue = 0
    inst.components.edible.hungervalue = -TUNING.CALORIES_SMALL
    inst.components.edible.sanityvalue = TUNING.SANITY_SMALL
    inst.components.edible:SetOnEatenFn(item_oneaten)
 
    inst:AddComponent("inspectable")
 
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/geralt_blizzpot.xml"
 
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM
 
    return inst    
end

return Prefab( "common/inventory/geralt_blizzpot", fn, assets)