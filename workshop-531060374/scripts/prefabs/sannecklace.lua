local assets =
{
    Asset("ANIM", "anim/sannecklace.zip"),
    Asset("ANIM", "anim/torso_sannecklace.zip"),
	Asset("ATLAS", "images/inventoryimages/sannecklace.xml"),
    Asset("IMAGE", "images/inventoryimages/sannecklace.tex"),
}

--[[ Each amulet has a seperate onequip and onunequip function so we can also
add and remove event listeners, or start/stop update functions here. ]]

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_body", "torso_sannecklace", "sannecklace")
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_body")
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("sannecklace")
    inst.AnimState:SetBuild("sannecklace")
    inst.AnimState:PlayAnimation("sannecklace")

    inst.foleysound = "dontstarve/movement/foley/jewlery"

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    -- red amulet now falls off on death, so you HAVE to haunt it
    -- This is more straightforward for prototype purposes, but has side effect of allowing amulet steals
    -- inst.components.inventoryitem.keepondeath = true
    	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "sannecklace"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sannecklace.xml"
    		
    inst:AddComponent("inspectable")

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED     
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
		
    return inst
end

return Prefab("common/inventory/sannecklace", fn, assets)