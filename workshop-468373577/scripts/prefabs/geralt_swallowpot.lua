local assets = {
    Asset("ANIM", "anim/geralt_swallowpot.zip"),
    Asset("ATLAS", "images/inventoryimages/geralt_swallowpot.xml"),
}
 
local function item_oneaten(inst, eater)
	eater.swallowpotresttime = 30 * 2
	eater.components.hunger.hungerrate = eater.components.hunger.hungerrate + GERALT_SWALLOWPOT_HUNGERRATE
end
  
local function fn()
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
 
    MakeInventoryPhysics(inst)
 
    inst.AnimState:SetBank("geralt_swallowpot")
    inst.AnimState:SetBuild("geralt_swallowpot")
    inst.AnimState:PlayAnimation("idle")
     
    inst.entity:SetPristine()
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst:AddComponent("edible")
    inst.components.edible.foodtype = FOODTYPE.POTION
    inst.components.edible.healthvalue = 10
    inst.components.edible.hungervalue = -TUNING.CALORIES_SMALL
    inst.components.edible.sanityvalue = 0
    inst.components.edible:SetOnEatenFn(item_oneaten)
 
    inst:AddComponent("inspectable")
 
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/geralt_swallowpot.xml"
 
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM
 
    return inst
end
 
return Prefab("common/inventory/geralt_swallowpot", fn, assets)