local assets=
{
    Asset("ANIM", "anim/sanspear.zip"),
    Asset("ANIM", "anim/swap_sanspear.zip"),
  
    Asset("ATLAS", "images/inventoryimages/sanspear.xml"),
    Asset("IMAGE", "images/inventoryimages/sanspear.tex"),
}

local prefabs = 
{
	"zoro"
}

local function OnEquip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_sanspear", "swap_sanspear")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end
  
local function OnUnequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end
 
local function fn()
  
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
     
    MakeInventoryPhysics(inst)   
      
    inst.AnimState:SetBank("sanspear")
    inst.AnimState:SetBuild("sanspear")
    inst.AnimState:PlayAnimation("idle")
 
    inst:AddTag("sharp")
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()
     
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(35)
	  
    inst:AddComponent("inspectable")
      
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
    inst.components.inventoryitem.imagename = "sanspear"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sanspear.xml"
      
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	inst.components.inventoryitem.keepondeath = true
	     
    return inst
end
return  Prefab("common/inventory/sanspear", fn, assets, prefabs) 