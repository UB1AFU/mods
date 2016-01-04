-- This information tells other players more about the mod
name = "Geralt"
description = "This mod allows you to play for Geralt the Witcher. He has 2 swords and also able to craft unique potions"
author = "Amalleus"
version = "1.0.8b" -- This is the version of the template. Change it to your own number.

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
forumthread = ""


-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = true
all_clients_require_mod = true -- Character mods need this set to true
client_only_mod = false


icon_atlas = "modicon.xml"
icon = "modicon.tex"

--configuration_options = {}

configuration_options =
{
	{
		name="geralt_sword_damage"
		,label="SteelSword damage"
		,options = {
			{data=13,description="13 / 39"}
			,{data=14,description="14 / 42"}
			,{data=15,description="15 / 45"}
			,{data=16,description="16 / 48"}
			,{data=17,description="17 / 51"}
			,{data=18,description="18 / 54"}
			,{data=19,description="19 / 57"}
			,{data=20,description="20 / 60"}
			,{data=21,description="21 / 63"}
			,{data=22,description="22 / 66"}
			,{data=23,description="23 / 69"}
			,{data=24,description="24 / 72"}
		}
		,default=19
	},
	
	{
		name="geralt_wsword_damage"
		,label="SilverSword damage"
		,options = {
			{data=13,description="13 / 39"}
			,{data=14,description="14 / 42"}
			,{data=15,description="15 / 45"}
			,{data=16,description="16 / 48"}
			,{data=17,description="17 / 51"}
			,{data=18,description="18 / 54"}
			,{data=19,description="19 / 57"}
			,{data=20,description="20 / 60"}
			,{data=21,description="21 / 63"}
			,{data=22,description="22 / 66"}
			,{data=23,description="23 / 69"}
			,{data=24,description="24 / 72"}
		}
		,default=19
	},
	
	{
		name="geralt_swallowpot_regenrate"
		,label="Swallow RegenRate"
		,options = {
			{data=1,description="1 hp/sec"}
			,{data=2,description="2 hp/sec"}
			,{data=3,description="3 hp/sec"}
			,{data=4,description="4 hp/sec"}
			,{data=5,description="5 hp/sec"}
			,{data=6,description="6 hp/sec"}
			,{data=7,description="7 hp/sec"}
		}
		,default=3
	},
	
	{
		name="geralt_swallowpot_hungerrate"
		,label="Swallow HungLossRate"
		,options = {
			 {data=0.00,description="None"}
			,{data=0.05,description="SuperTiny"}
			,{data=0.10,description="Tiny"} 
			,{data=0.20,description="Small"}
			,{data=0.30,description="Medium"}
			,{data=0.40,description="Med-Large"}
			,{data=0.50,description="Huge"}
			,{data=0.60,description="SuperHuge"}
		}
		,default=0.40
	},
	 
	{
		name="geralt_thundbpot_mult"
		,label="Thunderbolt AdditMult"
		,options = {
			{data=0.4,description="x0.4"}
			,{data=0.6,description="x0.6"}
			,{data=0.8,description="x0.8"}
			,{data=1.0,description="x1.0"}
			,{data=1.2,description="x1.2"}
			,{data=1.4,description="x1.4"}
			,{data=1.6,description="x1.6"}
			,{data=1.8,description="x1.8"}
		}
		,default=1.0
	},
	
	{
		name="geralt_thundbpot_hungerrate"
		,label="Thunderbolt HungLostRate"
		,options = {
			 {data=0.00,description="None"}
			,{data=0.05,description="SuperTiny"}
			,{data=0.10,description="Tiny"}
			,{data=0.20,description="Small"}
			,{data=0.30,description="Medium"}
			,{data=0.40,description="Large"}
			,{data=0.50,description="Huge"}
			,{data=0.60,description="SuperHuge"}
		}
		,default=0.40
	},

	{
		name="geralt_blizzpot_speed"
		,label="Blizzard Speed"
		,options = {
			{data=1.2,description="x1.2"}
			,{data=1.3,description="x1.3"}
			,{data=1.4,description="x1.4"}
			,{data=1.5,description="x1.5"}
			,{data=1.6,description="s1.6"}
			,{data=1.7,description="x1.7"}
		}
		,default=1.4
	},
	
	{
		name="geralt_willowpot_hungerrate"
		,label="Willow HungLossRate"
		,options = {
			 {data=0.00,description="None"}
			,{data=0.05,description="SuperTiny"}
			,{data=0.10,description="Tiny"}
			,{data=0.20,description="Small"}
			,{data=0.30,description="Medium"}
			,{data=0.40,description="Large"}
			,{data=0.50,description="Huge"}
			,{data=0.60,description="SuperHuge"}
		}
		,default=0.40
	},
}