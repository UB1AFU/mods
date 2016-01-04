local assets =
{
	Asset("ANIM", "anim/sancoat.zip"),
	Asset("ANIM", "anim/swap_sancoat.zip"),
    Asset("ATLAS", "images/inventoryimages/sancoat.xml"),
    Asset("IMAGE", "images/inventoryimages/sancoat.tex"),
}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_body", "swap_sancoat", "backpack")
    owner.AnimState:OverrideSymbol("swap_body", "swap_sancoat", "swap_body")
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_body")
    owner.AnimState:ClearOverrideSymbol("backpack")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("sancoat")
    inst.AnimState:SetBuild("sancoat")
    inst.AnimState:PlayAnimation("idle")

    inst.MiniMapEntity:SetIcon("sancoat.png")
    
    inst.foleysound = "dontstarve/movement/foley/backpack"

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()
    
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
	inst.components.inventoryitem.imagename = "sancoat"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sancoat.xml"
	inst.components.inventoryitem.cangoincontainer = true

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
	
    inst:AddComponent("armor")
    inst.components.armor:InitCondition( 9999999999 * 9, TUNING.ARMOR_SANITY_ABSORPTION * 0.5)
    
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)


    MakeHauntableLaunchAndDropFirstItem(inst)

    return inst
end

return Prefab("common/inventory/sancoat", fn, assets)