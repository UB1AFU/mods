local assets=
{ 
    Asset("ANIM", "anim/geralt_sword.zip"),
    Asset("ANIM", "anim/swap_geralt_sword.zip"), 

    Asset("ATLAS", "images/inventoryimages/geralt_sword.xml"),
    Asset("IMAGE", "images/inventoryimages/geralt_sword.tex"),
}

local function OnAttack(inst, attacker, target)	
	if target then
		local damage = attacker.components.combat:CalcDamage(target, inst, 2)
		if not target:HasTag("monster") then
			if attacker and attacker.components.sanity then
				target.components.combat:GetAttacked(inst, damage)
			end
		end
	end
end




local function OnEquip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_object", "swap_geralt_sword", "geralt_sword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
end

local function OnUnequip(inst, owner) 
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 		
end

local function fn(colour)
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
   
	inst.AnimState:SetBank("geralt_sword")
    inst.AnimState:SetBuild("geralt_sword")
    inst.AnimState:PlayAnimation("idle")
	
	inst:AddTag("sword")
	inst:AddTag("steel")	
	
	inst.entity:SetPristine()
 
    if not TheWorld.ismastersim then
        return inst
    end	

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "geralt_sword"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/geralt_sword.xml"
    
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	--inst.components.equippable.walkspeedmult = 1.10
	
	inst:AddComponent("inspectable")
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(GERALT_SWORD_DAMAGE)
	inst.components.weapon:SetRange(0.15, 0.15)
	inst.components.weapon:SetOnAttack(OnAttack)
	
	inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(200)
    inst.components.finiteuses:SetUses(200)
    inst.components.finiteuses:SetOnFinished(inst.Remove)
	
	--[[if not inst.components.characterspecific then
    inst:AddComponent("characterspecific")
	end
 
    inst.components.characterspecific:SetOwner("geralt")
    inst.components.characterspecific:SetStorable(true)
    inst.components.characterspecific:SetComment("I don't know how to use it")]]
	
    return inst
end

return  Prefab("common/inventory/geralt_sword", fn, assets)