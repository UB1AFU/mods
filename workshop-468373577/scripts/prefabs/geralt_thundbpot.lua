local assets = {
    Asset("ANIM", "anim/geralt_thundbpot.zip"),
    Asset("ATLAS", "images/inventoryimages/geralt_thundbpot.xml"),
}
 
local function item_oneaten(inst, eater)
	eater.thundbpotresttime = 30 * 1.5
	eater.components.hunger.hungerrate = eater.components.hunger.hungerrate + GERALT_THUNDBPOT_HUNGERRATE
	eater.components.combat.damagemultiplier = eater.components.combat.damagemultiplier + GERALT_THUNDBPOT_MULT
end
  
local function fn()
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
 
    MakeInventoryPhysics(inst)
 
    inst.AnimState:SetBank("geralt_thundbpot")
    inst.AnimState:SetBuild("geralt_thundbpot")
    inst.AnimState:PlayAnimation("idle")
     
    inst.entity:SetPristine()
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst:AddComponent("edible")
    inst.components.edible.foodtype = FOODTYPE.POTION
    inst.components.edible.healthvalue = 0
    inst.components.edible.hungervalue = -TUNING.CALORIES_SMALL
    inst.components.edible.sanityvalue = 0
    inst.components.edible:SetOnEatenFn(item_oneaten)
 
    inst:AddComponent("inspectable")
 
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/geralt_thundbpot.xml"
 
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM
 
    return inst
end
 
return Prefab("common/inventory/geralt_thundbpot", fn, assets)