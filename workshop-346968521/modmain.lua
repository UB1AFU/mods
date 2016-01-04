        PrefabFiles = {
	"wilson_house",
}

        Assets = 
{
	
	Asset("ATLAS", "images/inventoryimages/wilson_house.xml"),
        Asset( "IMAGE", "minimap/wilson_house.tex" ),
        Asset( "ATLAS", "minimap/wilson_house.xml" ),	
}
        AddMinimapAtlas("minimap/wilson_house.xml")

        STRINGS = GLOBAL.STRINGS
        RECIPETABS = GLOBAL.RECIPETABS
        Recipe = GLOBAL.Recipe
        Ingredient = GLOBAL.Ingredient
        TECH = GLOBAL.TECH





        GLOBAL.STRINGS.NAMES.WILSON_HOUSE = "威尔逊的小屋"
        STRINGS.RECIPE_DESC.WILSON_HOUSE = "啊哈， 多么美妙的家!"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.WILSON_HOUSE = "多么美妙的一堆泥啊"





        local wilson_house = GLOBAL.Recipe("wilson_house",
        { 
                Ingredient("twigs", 10), 
                Ingredient("cutgrass", 10),         
                Ingredient("turf_forest", 5) 
        },                     
        RECIPETABS.TOWN, TECH.NONE, "wilson_house_placer" ) 
        wilson_house.atlas = "images/inventoryimages/wilson_house.xml"



        TUNING.HOUSE_TICK_PERIOD = 2

