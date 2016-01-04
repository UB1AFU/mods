local assets = {
    Asset("ANIM", "anim/geralt_willowpot.zip"),
    Asset("ATLAS", "images/inventoryimages/geralt_willowpot.xml"),
}
 
local function item_oneaten(inst, eater)
	eater.willowpotresttime = 30 * 2
	eater.components.hunger.hungerrate = eater.components.hunger.hungerrate + GERALT_WILLOWPOT_HUNGERRATE
end
  
local function fn()
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
 
    MakeInventoryPhysics(inst)
 
    inst.AnimState:SetBank("geralt_willowpot")
    inst.AnimState:SetBuild("geralt_willowpot")
    inst.AnimState:PlayAnimation("idle")
     
    inst.entity:SetPristine()
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst:AddComponent("edible")
    inst.components.edible.foodtype = FOODTYPE.POTION
    inst.components.edible.healthvalue = 20
    inst.components.edible.hungervalue = -TUNING.CALORIES_SMALL
    inst.components.edible.sanityvalue = 0
    inst.components.edible:SetOnEatenFn(item_oneaten)
 
    inst:AddComponent("inspectable")
 
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/geralt_willowpot.xml"
 
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM
 
    return inst
end
 
return Prefab("common/inventory/geralt_willowpot", fn, assets)