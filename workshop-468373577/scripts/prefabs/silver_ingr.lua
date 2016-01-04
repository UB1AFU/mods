local assets = {
	Asset("ANIM", "anim/silver_ingr.zip"),
	Asset("ATLAS", "images/inventoryimages/silver_ingr.xml"),
}

local function fn()
	local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
 
    MakeInventoryPhysics(inst)
 
	inst.AnimState:SetBank("silver_ingr")
    inst.AnimState:SetBuild("silver_ingr")
    inst.AnimState:PlayAnimation("idle")
     
    inst.entity:SetPristine()
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst:AddComponent("inspectable")
 
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/silver_ingr.xml"
 
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
 
    return inst    
end

return Prefab( "common/inventory/silver_ingr", fn, assets)