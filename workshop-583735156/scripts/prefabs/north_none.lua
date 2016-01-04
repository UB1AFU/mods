local assets =
{
	Asset( "ANIM", "anim/north.zip" ),
	Asset( "ANIM", "anim/ghost_north_build.zip" ),
}

local skins =
{
	normal_skin = "north",
	ghost_skin = "ghost_north_build",
}

local base_prefab = "north"

local tags = {"NORTH", "CHARACTER"}

return CreatePrefabSkin("north_none",
{
	base_prefab = base_prefab, 
	skins = skins, 
	assets = assets,
	tags = tags,
	
	skip_item_gen = true,
	skip_giftable_gen = true,
})