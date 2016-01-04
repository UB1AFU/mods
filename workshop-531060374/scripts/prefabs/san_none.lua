local assets =
{
	Asset( "ANIM", "anim/san.zip" ),
	Asset( "ANIM", "anim/ghost_san_build.zip" ),
}

local skins =
{
	normal_skin = "san",
	ghost_skin = "ghost_san_build",
}

local base_prefab = "san"

local tags = {"SAN", "CHARACTER"}

return CreatePrefabSkin("san_none",
{
	base_prefab = base_prefab, 
	skins = skins, 
	assets = assets,
	tags = tags,
	
	skip_item_gen = true,
	skip_giftable_gen = true,
})