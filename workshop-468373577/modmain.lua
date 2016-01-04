PrefabFiles = {
	"geralt",
	"geralt_sword",
	"geralt_catpot",
	"geralt_swallowpot",
	"geralt_thundbpot",
	"geralt_blizzpot",
	"geralt_wsword",
	"silver_ingr",
	"geralt_willowpot"
}
	
local STRINGS = GLOBAL.STRINGS
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/geralt.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/geralt.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/geralt.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/geralt.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/geralt_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/geralt_silho.xml" ),

    Asset( "IMAGE", "bigportraits/geralt.tex" ),
    Asset( "ATLAS", "bigportraits/geralt.xml" ),
	
	Asset( "IMAGE", "images/map_icons/geralt.tex" ),
	Asset( "ATLAS", "images/map_icons/geralt.xml" ),
	
	Asset( "IMAGE", "images/recipe_tab/tab_geralt.tex" ),
	Asset( "ATLAS", "images/recipe_tab/tab_geralt.xml" ),
	
	--No crash now, huh?
	Asset("ATLAS", "images/inventoryimages/geralt_sword.xml"),
    Asset("IMAGE", "images/inventoryimages/geralt_sword.tex"),
	Asset("ATLAS", "images/inventoryimages/geralt_wsword.xml"),
    Asset("IMAGE", "images/inventoryimages/geralt_wsword.tex"),	
}

local require = GLOBAL.require
-- New foodtype
GLOBAL.FOODTYPE.POTION = "药水"
-- The character select screen lines
STRINGS.CHARACTER_TITLES.geralt = "巫师"
STRINGS.CHARACTER_NAMES.geralt = "杰洛特"
STRINGS.CHARACTER_DESCRIPTIONS.geralt = "*剑者\n*怪物猎人\n*和人类的不同"
STRINGS.CHARACTER_QUOTES.geralt = "\"我正在找一份工作，不是自由\""

-- Custom speech strings
STRINGS.CHARACTERS.GERALT = require "speech_geralt"
 
STRINGS.NAMES.GERALT_SWORD = "铁剑"
STRINGS.RECIPE_DESC.GERALT_SWORD = "干的漂亮，它很锋利"
STRINGS.CHARACTERS.GERALT.DESCRIBE.GERALT_SWORD = "就像羽毛一样"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.GERALT_SWORD= "我希望不要伤到我自己"

STRINGS.NAMES.GERALT_WSWORD = "银剑"
STRINGS.RECIPE_DESC.GERALT_WSWORD = "更多的银子，更少的怪物"
STRINGS.CHARACTERS.GERALT.DESCRIBE.GERALT_WSWORD = "怪物不喜欢被触摸"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.GERALT_WSWORD= "银子... 我想怪物是不会喜欢的"

STRINGS.NAMES.SILVER_INGR = "银子"
STRINGS.RECIPE_DESC.SILVER_INGR = "像燧石但会发光"
STRINGS.CHARACTERS.GERALT.DESCRIBE.SILVER_INGR = "我可以用它造剑抵抗怪物"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SILVER_INGR= "我也许能用这玩意儿抵抗怪物"
 
STRINGS.NAMES.GERALT_CATPOT = "猫药水"
STRINGS.RECIPE_DESC.GERALT_CATPOT = "给那些想要得到猫的视力的人"
STRINGS.CHARACTERS.GERALT.DESCRIBE.GERALT_CATPOT = "巫师在黑夜狩猎时经常使用这东西"	

STRINGS.NAMES.GERALT_SWALLOWPOT = "燕子药水"
STRINGS.RECIPE_DESC.GERALT_SWALLOWPOT = "燕子,预示着春天。带来生命" 
STRINGS.CHARACTERS.GERALT.DESCRIBE.GERALT_SWALLOWPOT = "能让我东山再起"	

STRINGS.NAMES.GERALT_THUNDBPOT = "迅雷药水"
STRINGS.RECIPE_DESC.GERALT_THUNDBPOT = "似乎包含上帝之力"
STRINGS.CHARACTERS.GERALT.DESCRIBE.GERALT_THUNDBPOT = "Mmm... 我的力量将变得难以置信"

STRINGS.NAMES.GERALT_BLIZZPOT = "暴雪药水"
STRINGS.RECIPE_DESC.GERALT_BLIZZPOT = "让世界等我一会"
STRINGS.CHARACTERS.GERALT.DESCRIBE.GERALT_BLIZZPOT = "Wow. 时间静止"

STRINGS.NAMES.GERALT_WILLOWPOT = "柳树药水"
STRINGS.RECIPE_DESC.GERALT_WILLOWPOT = "止痛药"
STRINGS.CHARACTERS.GERALT.DESCRIBE.GERALT_WILLOWPOT = "谢天谢地，我再也不会感到疼痛了"
 
AddMinimapAtlas("images/map_icons/geralt.xml")
AddModCharacter("geralt", "MALE")

GLOBAL.GERALT_SWORD_DAMAGE = GetModConfigData("geralt_sword_damage")
GLOBAL.GERALT_WSWORD_DAMAGE = GetModConfigData("geralt_wsword_damage")
GLOBAL.GERALT_SWALLOWPOT_REGENRATE = GetModConfigData("geralt_swallowpot_regenrate")
GLOBAL.GERALT_SWALLOWPOT_HUNGERRATE = GetModConfigData("geralt_swallowpot_hungerrate")
GLOBAL.GERALT_THUNDBPOT_MULT = GetModConfigData("geralt_thundbpot_mult")
GLOBAL.GERALT_THUNDBPOT_HUNGERRATE = GetModConfigData("geralt_thundbpot_hungerrate")
GLOBAL.GERALT_BLIZZPOT_SPEED = GetModConfigData("geralt_blizzpot_speed")
GLOBAL.GERALT_WILLOWPOT_HUNGERRATE = GetModConfigData("geralt_willowpot_hungerrate")

-- The character's name as appears in-game 
STRINGS.NAMES.GERALT = "杰洛特"
-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.GERALT = 
{
	GENERIC = "It's Geralt!",
	ATTACKER = "That Geralt looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Geralt, friend of ghosts.",
	GHOST = "Geralt could use a heart.",
}

--Craft
RECIPETABS['GERALT_TAB'] = {str = "GERALT_TAB", sort=1000, icon = "tab_geralt.tex", icon_atlas = "images/recipe_tab/tab_geralt.xml"}
STRINGS.TABS.GERALT_TAB="巫师"	

local silver_ingr_recipe = AddRecipe("silver_ingr", {Ingredient("flint", 1), Ingredient("goldnugget", 1), Ingredient("charcoal", 1)}, RECIPETABS.GERALT_TAB, TECH.NONE , nil , nil, nil, nil, "witcher" , "images/inventoryimages/silver_ingr.xml")	
local geralt_sword_recipe = AddRecipe("geralt_sword", {Ingredient("boards", 2), Ingredient("pigskin", 1), Ingredient("flint", 4)}, RECIPETABS.GERALT_TAB, TECH.NONE, nil, nil, nil, nil, "witcher", "images/inventoryimages/geralt_sword.xml")
local silver = Ingredient( "silver_ingr", 3)
silver.atlas = "images/inventoryimages/silver_ingr.xml"	
local geralt_wsword_recipe = AddRecipe("geralt_wsword", {Ingredient("boards", 2), Ingredient("pigskin", 1), silver}, RECIPETABS.GERALT_TAB, TECH.NONE, nil, nil, nil, nil, "witcher", "images/inventoryimages/geralt_wsword.xml")
local geralt_catpot_recipe = AddRecipe("geralt_catpot", { Ingredient("nightmarefuel", 1), Ingredient("blue_cap", 2), Ingredient("feather_crow", 1)}, RECIPETABS.GERALT_TAB, TECH.NONE, nil, nil, nil, nil, "witcher", "images/inventoryimages/geralt_catpot.xml")
local geralt_swallowpot_recipe = AddRecipe("geralt_swallowpot", { Ingredient("butterflywings", 2), Ingredient("spidergland", 2), Ingredient("honey", 2)}, RECIPETABS.GERALT_TAB, TECH.NONE, nil, nil, nil, nil, "witcher", "images/inventoryimages/geralt_swallowpot.xml")
local geralt_thundbpot_recipe = AddRecipe("geralt_thundbpot", { Ingredient("nightmarefuel", 3), Ingredient("houndstooth", 4), Ingredient("glommerfuel", 1)}, RECIPETABS.GERALT_TAB, TECH.NONE, nil, nil, nil, nil, "witcher", "images/inventoryimages/geralt_thundbpot.xml")
local geralt_blizzpot_recipe = AddRecipe("geralt_blizzpot", { Ingredient("coontail", 1), Ingredient("houndstooth", 1), Ingredient("feather_robin", 1)}, RECIPETABS.GERALT_TAB, TECH.NONE, nil, nil, nil, nil, "witcher", "images/inventoryimages/geralt_blizzpot.xml")
local geralt_willowpot_recipe = AddRecipe("geralt_willowpot", { Ingredient("red_cap_cooked", 2), Ingredient("nightmarefuel", 1), Ingredient("mosquitosack", 1)}, RECIPETABS.GERALT_TAB, TECH.NONE, nil, nil, nil, nil, "witcher", "images/inventoryimages/geralt_willowpot.xml")

--------------------------------------------------------------------+++++++++++++++++++++++++++
AddStategraphPostInit("wilson",function(stateself) 	
	local eventfn=stateself.events["attacked"].fn
    local customhandlerfn=
    function(inst, data)
	if (inst.prefab == "geralt" and not (inst.willowpotresttime)) then inst.willowpotresttime = -1 end
		if not inst.components.health:IsDead() then
			if data.attacker and data.attacker:HasTag("insect") then
                local is_idle = inst.sg:HasStateTag("idle")
                if not is_idle then
                    -- avoid stunlock when attacked by bees/mosquitos
                    -- don't go to full hit state, just play sounds
					
					---------------------------------{
					if not (inst.willowpotresttime) then 
						inst.SoundEmitter:PlaySound("dontstarve/wilson/hit") 
					elseif (inst.prefab == "geralt" and inst.willowpotresttime) then
						if not (inst.willowpotresttime > 0) then
							inst.SoundEmitter:PlaySound("dontstarve/wilson/hit") 
						end
					end
					---------------------------------}
                    
                    if inst.prefab ~= "wes" then
                        local sound_name = inst.soundsname or inst.prefab
                        local path = inst.talker_path_override or "dontstarve/characters/"
                        local sound_event = path..sound_name.."/hurt"
                        ---------------------------------{
						if not (inst.willowpotresttime) then 
							inst.SoundEmitter:PlaySound(inst.hurtsoundoverride or sound_event)
						elseif (inst.prefab == "geralt" and inst.willowpotresttime) then
							if not (inst.willowpotresttime > 0) then
								inst.SoundEmitter:PlaySound(inst.hurtsoundoverride or sound_event)
							end
						end
						---------------------------------}
                    end
                    return
                end
			end
            if inst.sg:HasStateTag("shell") then
				---------------------------------{
                if not (inst.willowpotresttime) then 
					inst.sg:GoToState("shell_hit")
				elseif (inst.prefab == "geralt" and inst.willowpotresttime) then
					if not (inst.willowpotresttime > 0) then	
						inst.sg:GoToState("shell_hit")
					end
				end	
				---------------------------------}	
            else
                if data.stimuli and data.stimuli == "electric" and not inst.components.inventory:IsInsulated() then
                    ---------------------------------{
					if not (inst.willowpotresttime) then 
						inst.sg:GoToState("electrocute")
					elseif (inst.prefab == "geralt" and inst.willowpotresttime) then
						if not (inst.willowpotresttime > 0) then
							inst.sg:GoToState("electrocute")
						end
					end
					---------------------------------}
                else
					---------------------------------
                    if not (inst.willowpotresttime) then 
						inst.sg:GoToState("hit")
					elseif (inst.prefab == "geralt" and inst.willowpotresttime) then
						if not (inst.willowpotresttime > 0) then
							inst.sg:GoToState("hit")
						end			
					end
					---------------------------------
                end
            end
		end
	end
	stateself.events["attacked"].fn=customhandlerfn
end)
--------------------------------------------------------------------+++++++++++++++++++++++++++



