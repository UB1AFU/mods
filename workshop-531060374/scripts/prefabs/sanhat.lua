local assets =
{ 
    Asset("ANIM", "anim/sanhat.zip"),
    Asset("ANIM", "anim/sanhat_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/sanhat.xml"),
    Asset("IMAGE", "images/inventoryimages/sanhat.tex"),
}

local prefabs = 
{
}

local function OnEquip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_hat", "sanhat_swap", "swap_hat")

    owner.AnimState:Show("HAT")
    owner.AnimState:Show("HAT_HAIR")
    owner.AnimState:Hide("HAIR_NOHAT")
    owner.AnimState:Hide("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Hide("HEAD")
        owner.AnimState:Show("HEAD_HAT")
    end
end

local function OnUnequip(inst, owner) 
    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAT_HAIR")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Show("HEAD")
        owner.AnimState:Hide("HEAD_HAT")
    end
end

local function fn()

    local inst = CreateEntity()
    
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("sanhat")
    inst.AnimState:SetBuild("sanhat")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("hat")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("inspectable")

    inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "sanhat"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sanhat.xml"
	
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_HUGE * 1.3)
	
    inst:AddComponent("insulator")
    inst.components.insulator:SetInsulation(TUNING.INSULATION_LARGE * 1.3)
	    
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)
	inst.components.inventoryitem.keepondeath = true
	
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_SMALL
	
    MakeHauntableLaunch(inst)

    return inst
end

return  Prefab("common/inventory/sanhat", fn, assets, prefabs)