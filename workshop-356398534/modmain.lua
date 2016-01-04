function PPP_QuickPick(inst)
	if inst.components.pickable then
	inst.components.pickable.quickpick = true
	end
end

AddPrefabPostInit("sapling", PPP_QuickPick)
AddPrefabPostInit("marsh_bush", PPP_QuickPick)
AddPrefabPostInit("reeds", PPP_QuickPick)
AddPrefabPostInit("grass", PPP_QuickPick)
AddPrefabPostInit("berrybush2", PPP_QuickPick)
AddPrefabPostInit("berrybush", PPP_QuickPick)
AddPrefabPostInit("flower_cave", PPP_QuickPick)
AddPrefabPostInit("red_mushroom", PPP_QuickPick)
AddPrefabPostInit("green_mushroom", PPP_QuickPick)
AddPrefabPostInit("blue_mushroom", PPP_QuickPick)
AddPrefabPostInit("cactus", PPP_QuickPick)
AddPrefabPostInit("lichen", PPP_QuickPick)
