local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH
local Action = GLOBAL.Action
local ActionHandler = GLOBAL.ActionHandler
local ACTIONS = GLOBAL.ACTIONS

STRINGS.NAMES.MECH_HAY_ITEM = "嘿， 门"
STRINGS.RECIPE_DESC.MECH_HAY_ITEM = "嘿， 门."

STRINGS.NAMES.MECH_WOOD_ITEM = "木门"
STRINGS.RECIPE_DESC.MECH_WOOD_ITEM = "木门."

STRINGS.NAMES.MECH_STONE_ITEM = "石门"
STRINGS.RECIPE_DESC.MECH_STONE_ITEM = "石门."

STRINGS.NAMES.MECH_RUINS_ITEM = "铥矿门"
STRINGS.RECIPE_DESC.MECH_RUINS_ITEM = "铥矿门."

STRINGS.NAMES.MECH_MOONROCK_ITEM = "月岩门"
STRINGS.RECIPE_DESC.MECH_MOONROCK_ITEM = "月岩门."

STRINGS.NAMES.MECH_HAY = "嘿， 通忘自由的门紧锁着"
STRINGS.NAMES.MECH_WOOD = "木门"
STRINGS.NAMES.MECH_STONE = "石门"
STRINGS.NAMES.MECH_RUINS = "铥矿门"
STRINGS.NAMES.MECH_MOONROCK = "月岩门"

STRINGS.NAMES.LOCKED_MECH_STONE_ITEM = "被锁上的石门"
STRINGS.RECIPE_DESC.LOCKED_MECH_STONE_ITEM = "被锁上的石门."

STRINGS.NAMES.LOCKED_MECH_RUINS_ITEM = "被锁上的铥矿门"
STRINGS.RECIPE_DESC.LOCKED_MECH_RUINS_ITEM = "被锁上的铥矿门."

STRINGS.NAMES.LOCKED_MECH_MOONROCK_ITEM = "被锁上的月岩门"
STRINGS.RECIPE_DESC.LOCKED_MECH_MOONROCK_ITEM = "被锁上的月岩门."

STRINGS.NAMES.LOCKED_MECH_STONE = "被锁上的石门"
STRINGS.NAMES.LOCKED_MECH_RUINS = "被锁上的铥矿门"
STRINGS.NAMES.LOCKED_MECH_MOONROCK = "被锁上的月岩门"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.MECH_HAY_ITEM = "完美的力学实践."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MECH_HAY = "看起来并不怎么安全."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MECH_WOOD_ITEM = "木桩!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MECH_WOOD = "会移动的木桩!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MECH_STONE_ITEM = "进出十分方便."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MECH_STONE = "一个并不隐秘的通道."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MECH_RUINS_ITEM = "比它看起来更紧凑."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MECH_RUINS = "我想直到这个东西可以帮我解决什么问题."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MECH_MOONROCK_ITEM = "奇怪。现在感觉不那么重."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MECH_MOONROCK = "如果这都不能把他们挡在外面，别的东西更做不到了."

STRINGS.CHARACTERS.WILLOW.DESCRIBE.MECH_HAY_ITEM = "你在浪费燃料."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.MECH_HAY = "这个门很容易燃烧!"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.MECH_WOOD_ITEM = "安全和令人兴奋的燃料."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.MECH_WOOD = "放在火焰上会更好看."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.MECH_STONE_ITEM = "我不能烧掉它，现在该怎么办?"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.MECH_STONE = "它不能燃烧，还在它还有点用."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.MECH_RUINS_ITEM = "现在要把这些东西放在哪儿?"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.MECH_RUINS = "这东西好像是金子做的，燃烧的金子，对么?"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.MECH_MOONROCK_ITEM = "啊哈，闪亮又沉重!"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.MECH_MOONROCK = "看起来有点冷清."

STRINGS.CHARACTERS.WENDY.DESCRIBE.MECH_HAY = "当死神想要向我索命时，它就能打开这扇门."
STRINGS.CHARACTERS.WENDY.DESCRIBE.MECH_HAY_ITEM = "我应该保护一无所有的我."
STRINGS.CHARACTERS.WENDY.DESCRIBE.MECH_WOOD = "想要用这扇门保护我， 然而并没有卵用."
STRINGS.CHARACTERS.WENDY.DESCRIBE.MECH_WOOD_ITEM = "现在， 树木知道什么是恐惧了."
STRINGS.CHARACTERS.WENDY.DESCRIBE.MECH_STONE = "通往我恐惧的大门."
STRINGS.CHARACTERS.WENDY.DESCRIBE.MECH_STONE_ITEM = "一个邪恶的门口的主要组件."
STRINGS.CHARACTERS.WENDY.DESCRIBE.MECH_RUINS_ITEM = "也只能拖延一下罢了."
STRINGS.CHARACTERS.WENDY.DESCRIBE.MECH_RUINS = "用上古的石材建造的墙."
STRINGS.CHARACTERS.WENDY.DESCRIBE.MECH_MOONROCK_ITEM = "有了它， 我就能把自己关起来了."
STRINGS.CHARACTERS.WENDY.DESCRIBE.MECH_MOONROCK = "这种力量也不是永恒."

STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MECH_HAY_ITEM = "门都是用植物做的么."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MECH_HAY = "脆弱的草门."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MECH_WOOD_ITEM = "是有生命的木头."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MECH_WOOD = "是木头做的门."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MECH_STONE_ITEM = "Wolfgang 把石头变成了门!"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MECH_STONE = "多么强大的门, 就像 Wolfgang 一样."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MECH_RUINS_ITEM = "像 Wolfgang 一样硬!"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MECH_RUINS = "强大又好看."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MECH_MOONROCK_ITEM = "带有 Wolfgang 的墙!"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MECH_MOONROCK = "比 Wolfgang 还要强大!"

STRINGS.CHARACTERS.WX78.DESCRIBE.MECH_HAY_ITEM = "一个简单的通道机制."
STRINGS.CHARACTERS.WX78.DESCRIBE.MECH_HAY = "通道安全性：低"
STRINGS.CHARACTERS.WX78.DESCRIBE.MECH_WOOD_ITEM = "强化入口通道机制."
STRINGS.CHARACTERS.WX78.DESCRIBE.MECH_WOOD = "通道安全性：一般"
STRINGS.CHARACTERS.WX78.DESCRIBE.MECH_STONE_ITEM = "一个可以接受的的通道机制. 我会使用它"
STRINGS.CHARACTERS.WX78.DESCRIBE.MECH_STONE = "通道安全性：一般偏上."
STRINGS.CHARACTERS.WX78.DESCRIBE.MECH_RUINS_ITEM = "再次强化的通道机制."
STRINGS.CHARACTERS.WX78.DESCRIBE.MECH_RUINS = "通道安全性：超出预期."
STRINGS.CHARACTERS.WX78.DESCRIBE.MECH_MOONROCK_ITEM = "钢筋魂泥土强化，要好好利用"
STRINGS.CHARACTERS.WX78.DESCRIBE.MECH_MOONROCK = "通道安全性：最优."

STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.MECH_HAY_ITEM = "我想我不得不这么做."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.MECH_HAY = "这些门不会损坏自身，真是个奇迹."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.MECH_WOOD_ITEM = "这真是个完美的主意."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.MECH_WOOD = "虽然和常见的门不太一样，但是已经很接近了."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.MECH_STONE_ITEM = "显然， 我能尽量让墙容纳更多的门."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.MECH_STONE = "拜访者在外头， 我在里头."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.MECH_RUINS_ITEM = "好东西， 我不是一个优柔寡断的女人."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.MECH_RUINS = "这些人似乎对使用稳固结构的建筑材料颇有见解."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.MECH_MOONROCK = "太空材料一定是最好的建筑材料."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.MECH_MOONROCK_ITEM = "新时代的建筑材料."

STRINGS.CHARACTERS.WAXWELL.DESCRIBE.MECH_HAY_ITEM = "放在哪儿呢?"
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.MECH_HAY = "不是做门的材料的最好的选择."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.MECH_WOOD_ITEM = "我听说，好的门造就好的邻居."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.MECH_WOOD = "这应该能把闲杂人等挡在外面."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.MECH_STONE_ITEM = "这项工作应该完成了."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.MECH_STONE = "滚远点!"
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.MECH_RUINS_ITEM = "我真的不知道是谁做了这个奇怪的材料."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.MECH_RUINS = "有点花哨,但可以用."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.MECH_MOONROCK_ITEM = "要放到哪儿呢?"
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.MECH_MOONROCK = "我早就该想到这点了."

STRINGS.CHARACTERS.WOODIE.DESCRIBE.MECH_HAY_ITEM = "看到它，我的眼睛都湿润了."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.MECH_HAY = "我可以打喷嚏这像什么,嗯?"
STRINGS.CHARACTERS.WOODIE.DESCRIBE.MECH_WOOD_ITEM = "就像做一个小屋子."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.MECH_WOOD = "不禁觉得我浪费了呢."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.MECH_STONE_ITEM = "我喜欢这样的门， 嗯?"
STRINGS.CHARACTERS.WOODIE.DESCRIBE.MECH_STONE = "比 Lucy's 地下室还冷. 也比它强大."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.MECH_RUINS_ITEM = "我想我应该要做点什么."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.MECH_RUINS = "太豪华了, 嗯?"
STRINGS.CHARACTERS.WOODIE.DESCRIBE.MECH_MOONROCK_ITEM = "让我想起了一些我不想提的事情, 嗯?..."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.MECH_MOONROCK = "看起来有点奇怪."

STRINGS.CHARACTERS.WEBBER.DESCRIBE.MECH_HAY_ITEM = "这玩意并不能把我们挡在外面!"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.MECH_HAY = "我希望以后没人烧毁这个脆弱的东西."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.MECH_WOOD_ITEM = "我可以好好地做一个堡垒."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.MECH_WOOD = "让我在里面，让其他人都留在外面."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.MECH_STONE_ITEM = "完工了！关键是放在哪儿!"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.MECH_STONE = "啊哈！让我看看他们是怎么穿过去的！"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.MECH_RUINS_ITEM = "实际上， 并不重."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.MECH_RUINS = "我的王后一定很喜欢这个闪闪发光的玩意儿."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.MECH_MOONROCK_ITEM = "太亮了, 我的映像伤害了我."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.MECH_MOONROCK = "我可以感受到这个东西散发的寒气."

STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.MECH_HAY_ITEM = "真可怜！毫无防御力的家伙!"
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.MECH_HAY = "为微薄的森林生物建造的门!"
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.MECH_WOOD_ITEM = "一块坚固的堡垒!"
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.MECH_WOOD = "我说：芝麻开门!"
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.MECH_STONE_ITEM = "城堡是我的表象!"
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.MECH_STONE = "没错！确实是一个强大的门!"
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.MECH_RUINS_ITEM = "看呐！古老的基石!"
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.MECH_RUINS = "强大的上古城墙!"
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.MECH_MOONROCK_ITEM = "从广寒宫掉下来的碎片!"
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.MECH_MOONROCK = "瞧! 外星人的门"

local CLOSE = Action(3)
CLOSE.str = "Close"
CLOSE.id = "CLOSE"
CLOSE.fn = function(act)
	local tar = act.target
    if tar and tar.components.wallgates and tar.components.wallgates:IsOpen() then
		tar.components.wallgates:CloseWall(tar)
		return true
    end
end

AddAction(CLOSE)

AddStategraphActionHandler("wilson", ActionHandler(CLOSE, "give"))

AddStategraphActionHandler("wilson_client", ActionHandler(CLOSE, "give"))

local OPEN = Action(3)
OPEN.str = "Open"
OPEN.id = "OPEN"
OPEN.fn = function(act)
	local tar = act.target
    if tar and tar.components.wallgates and not tar.components.wallgates:IsOpen() then
        tar.components.wallgates:OpenWall(tar)
        return true
    end
end

AddAction(OPEN)

AddStategraphActionHandler("wilson", ActionHandler(OPEN, "give"))

AddStategraphActionHandler("wilson_client", ActionHandler(OPEN, "give"))

AddComponentAction("SCENE", "wallgates", function(inst, doer, actions, right)
    if inst and not inst:HasTag("broken") then
			if right and inst:HasTag("opened") then
				table.insert(actions, GLOBAL.ACTIONS.CLOSE)
			elseif right and not inst:HasTag("opened") then
				table.insert(actions, GLOBAL.ACTIONS.OPEN)
			end
	end
end)

local UNLOCK = Action(3)
UNLOCK.str = "Unlock"
UNLOCK.id = "UNLOCK"
UNLOCK.fn = function(act)
	local tar = act.target
    if tar and tar.components.lockedwallgates and not tar.components.lockedwallgates:IsOpen() then
		tar.components.lockedwallgates:OpenWall(tar)
		return true
    end
end

AddAction(UNLOCK)

AddStategraphActionHandler("wilson", ActionHandler(UNLOCK, "give"))

AddStategraphActionHandler("wilson_client", ActionHandler(UNLOCK, "give"))

local LOCK = Action(3)
LOCK.str = "Lock"
LOCK.id = "LOCK"
LOCK.fn = function(act)
	local tar = act.target
    if tar and tar.components.lockedwallgates and tar.components.lockedwallgates:IsOpen() then
        tar.components.lockedwallgates:CloseWall(tar)
        return true
    end
end

AddAction(LOCK)

AddStategraphActionHandler("wilson", ActionHandler(LOCK, "give"))

AddStategraphActionHandler("wilson_client", ActionHandler(LOCK, "give"))

AddComponentAction("SCENE", "lockedwallgates", function(inst, doer, actions, right)
	local tag = doer.userid
	if inst and inst:HasTag(tag) then
		if inst and not inst:HasTag("broken") then
			if right and not inst:HasTag("opened") then
				table.insert(actions, GLOBAL.ACTIONS.UNLOCK)
			elseif right and inst:HasTag("opened") then
				table.insert(actions, GLOBAL.ACTIONS.LOCK)
			end
		end
	end
end)

if GetModConfigData("Wall Gates Version") == "recolored" then
	PrefabFiles = 
	{
	"mech.lua",
	"locked_mech.lua"
	}
	
	Assets = 
	{
	Asset("ATLAS", "images/inventoryimages/mech_hay_item.xml"),
	Asset("ATLAS", "images/inventoryimages/mech_wood_item.xml"),
	Asset("ATLAS", "images/inventoryimages/mech_stone_item.xml"),
	Asset("ATLAS", "images/inventoryimages/mech_ruins_item.xml"),
	Asset("ATLAS", "images/inventoryimages/mech_moonrock_item.xml"),
	Asset("ATLAS", "images/inventoryimages/locked_mech_stone_item.xml"),
	Asset("ATLAS", "images/inventoryimages/locked_mech_ruins_item.xml"),
	Asset("ATLAS", "images/inventoryimages/locked_mech_moonrock_item.xml"),
	}
	
	if GetModConfigData("Wall Gates Recipe") == "gears" then
		AddRecipe("mech_hay_item", {Ingredient("wall_hay_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mech_hay_item.xml", "mech_hay_item.tex")
		AddRecipe("mech_stone_item", {Ingredient("wall_stone_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mech_stone_item.xml", "mech_stone_item.tex")
		AddRecipe("mech_wood_item", {Ingredient("wall_wood_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mech_wood_item.xml", "mech_wood_item.tex")
		AddRecipe("mech_ruins_item", {Ingredient("wall_ruins_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.ANCIENT, TECH.ANCIENT_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mech_ruins_item.xml", "mech_ruins_item.tex")
		AddRecipe("mech_moonrock_item", {Ingredient("wall_moonrock_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mech_moonrock_item.xml", "mech_moonrock_item.tex")
	
		AddRecipe("locked_mech_moonrock_item", {Ingredient("wall_moonrock_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/locked_mech_moonrock_item.xml", "locked_mech_moonrock_item.tex")
		AddRecipe("locked_mech_stone_item", {Ingredient("wall_stone_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/locked_mech_stone_item.xml", "locked_mech_stone_item.tex")
		AddRecipe("locked_mech_ruins_item", {Ingredient("wall_ruins_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.ANCIENT, TECH.ANCIENT_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/locked_mech_ruins_item.xml", "locked_mech_ruins_item.tex")	
	elseif GetModConfigData("Wall Gates Recipe") == "transistor" then
		AddRecipe("mech_hay_item", {Ingredient("wall_hay_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mech_hay_item.xml", "mech_hay_item.tex")
		AddRecipe("mech_stone_item", {Ingredient("wall_stone_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mech_stone_item.xml", "mech_stone_item.tex")
		AddRecipe("mech_wood_item", {Ingredient("wall_wood_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mech_wood_item.xml", "mech_wood_item.tex")
		AddRecipe("mech_ruins_item", {Ingredient("wall_ruins_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.ANCIENT, TECH.ANCIENT_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mech_ruins_item.xml", "mech_ruins_item.tex")
		AddRecipe("mech_moonrock_item", {Ingredient("wall_moonrock_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mech_moonrock_item.xml", "mech_moonrock_item.tex")
	
		AddRecipe("locked_mech_moonrock_item", {Ingredient("wall_moonrock_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/locked_mech_moonrock_item.xml", "locked_mech_moonrock_item.tex")
		AddRecipe("locked_mech_stone_item", {Ingredient("wall_stone_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/locked_mech_stone_item.xml", "locked_mech_stone_item.tex")
		AddRecipe("locked_mech_ruins_item", {Ingredient("wall_ruins_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.ANCIENT, TECH.ANCIENT_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/locked_mech_ruins_item.xml", "locked_mech_ruins_item.tex")	
	elseif GetModConfigData("Wall Gates Recipe") == "gold" then
		AddRecipe("mech_hay_item", {Ingredient("wall_hay_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mech_hay_item.xml", "mech_hay_item.tex")
		AddRecipe("mech_stone_item", {Ingredient("wall_stone_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mech_stone_item.xml", "mech_stone_item.tex")
		AddRecipe("mech_wood_item", {Ingredient("wall_wood_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mech_wood_item.xml", "mech_wood_item.tex")
		AddRecipe("mech_ruins_item", {Ingredient("wall_ruins_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.ANCIENT, TECH.ANCIENT_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mech_ruins_item.xml", "mech_ruins_item.tex")
		AddRecipe("mech_moonrock_item", {Ingredient("wall_moonrock_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/mech_moonrock_item.xml", "mech_moonrock_item.tex")
	
		AddRecipe("locked_mech_moonrock_item", {Ingredient("wall_moonrock_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/locked_mech_moonrock_item.xml", "locked_mech_moonrock_item.tex")
		AddRecipe("locked_mech_stone_item", {Ingredient("wall_stone_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/locked_mech_stone_item.xml", "locked_mech_stone_item.tex")
		AddRecipe("locked_mech_ruins_item", {Ingredient("wall_ruins_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.ANCIENT, TECH.ANCIENT_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/locked_mech_ruins_item.xml", "locked_mech_ruins_item.tex")	
	end	
end

if GetModConfigData("Wall Gates Version") == "normal" then
	PrefabFiles = 
	{
	"normal_mech.lua",
	"normal_locked_mech.lua"
	}
	
	Assets = 
	{
	Asset("ATLAS", "images/inventoryimages/normal/mech_hay_item.xml"),
	Asset("ATLAS", "images/inventoryimages/normal/mech_wood_item.xml"),
	Asset("ATLAS", "images/inventoryimages/normal/mech_stone_item.xml"),
	Asset("ATLAS", "images/inventoryimages/normal/mech_ruins_item.xml"),
	Asset("ATLAS", "images/inventoryimages/normal/mech_moonrock_item.xml"),
	Asset("ATLAS", "images/inventoryimages/normal/locked_mech_stone_item.xml"),
	Asset("ATLAS", "images/inventoryimages/normal/locked_mech_ruins_item.xml"),
	Asset("ATLAS", "images/inventoryimages/normal/locked_mech_moonrock_item.xml"),
	}
	
	function HighlightPostInit(self)
		self.Highlight = function(self,r,g,b)
			self.highlit = true
			if self.inst:IsValid() and self.inst:HasTag("player") or GLOBAL.CanEntitySeeTarget(GLOBAL.ThePlayer, self.inst) then
				local m = .2
				if self.inst:HasTag("wallgate") or self.inst:HasTag("wallgateitem") then
					self.highlight_add_colour_red = 0.3
					self.highlight_add_colour_green = 0.3
					self.highlight_add_colour_blue = 0
				elseif self.inst:HasTag("lockedwallgate") or self.inst:HasTag("lockedwallgateitem") then
					self.highlight_add_colour_red = 0.0
					self.highlight_add_colour_green = 0.3
					self.highlight_add_colour_blue = 0.3
				else
					self.highlight_add_colour_red = r or m
					self.highlight_add_colour_green = g or m
					self.highlight_add_colour_blue = b or m
				end
			end
			self:ApplyColour()    
		end
	end	
	
	AddComponentPostInit("highlight", HighlightPostInit)
	
	if GetModConfigData("Wall Gates Recipe") == "gears" then
		AddRecipe("mech_hay_item", {Ingredient("wall_hay_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/mech_hay_item.xml", "mech_hay_item.tex")
		AddRecipe("mech_stone_item", {Ingredient("wall_stone_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/mech_stone_item.xml", "mech_stone_item.tex")
		AddRecipe("mech_wood_item", {Ingredient("wall_wood_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/mech_wood_item.xml", "mech_wood_item.tex")
		AddRecipe("mech_ruins_item", {Ingredient("wall_ruins_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.ANCIENT, TECH.ANCIENT_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/mech_ruins_item.xml", "mech_ruins_item.tex")
		AddRecipe("mech_moonrock_item", {Ingredient("wall_moonrock_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/mech_moonrock_item.xml", "mech_moonrock_item.tex")
	
		AddRecipe("locked_mech_moonrock_item", {Ingredient("wall_moonrock_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/locked_mech_moonrock_item.xml", "locked_mech_moonrock_item.tex")
		AddRecipe("locked_mech_stone_item", {Ingredient("wall_stone_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/locked_mech_stone_item.xml", "locked_mech_stone_item.tex")
		AddRecipe("locked_mech_ruins_item", {Ingredient("wall_ruins_item", 1), Ingredient("goldnugget", 2),Ingredient("gears", 1)}, RECIPETABS.ANCIENT, TECH.ANCIENT_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/locked_mech_ruins_item.xml", "locked_mech_ruins_item.tex")	
	elseif GetModConfigData("Wall Gates Recipe") == "transistor" then
		AddRecipe("mech_hay_item", {Ingredient("wall_hay_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/mech_hay_item.xml", "mech_hay_item.tex")
		AddRecipe("mech_stone_item", {Ingredient("wall_stone_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/mech_stone_item.xml", "mech_stone_item.tex")
		AddRecipe("mech_wood_item", {Ingredient("wall_wood_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/mech_wood_item.xml", "mech_wood_item.tex")
		AddRecipe("mech_ruins_item", {Ingredient("wall_ruins_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.ANCIENT, TECH.ANCIENT_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/mech_ruins_item.xml", "mech_ruins_item.tex")
		AddRecipe("mech_moonrock_item", {Ingredient("wall_moonrock_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/mech_moonrock_item.xml", "mech_moonrock_item.tex")
	
		AddRecipe("locked_mech_moonrock_item", {Ingredient("wall_moonrock_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/locked_mech_moonrock_item.xml", "locked_mech_moonrock_item.tex")
		AddRecipe("locked_mech_stone_item", {Ingredient("wall_stone_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/locked_mech_stone_item.xml", "locked_mech_stone_item.tex")
		AddRecipe("locked_mech_ruins_item", {Ingredient("wall_ruins_item", 1), Ingredient("goldnugget", 2),Ingredient("transistor", 1)}, RECIPETABS.ANCIENT, TECH.ANCIENT_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/locked_mech_ruins_item.xml", "locked_mech_ruins_item.tex")	
	elseif GetModConfigData("Wall Gates Recipe") == "gold" then
		AddRecipe("mech_hay_item", {Ingredient("wall_hay_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/mech_hay_item.xml", "mech_hay_item.tex")
		AddRecipe("mech_stone_item", {Ingredient("wall_stone_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/mech_stone_item.xml", "mech_stone_item.tex")
		AddRecipe("mech_wood_item", {Ingredient("wall_wood_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/mech_wood_item.xml", "mech_wood_item.tex")
		AddRecipe("mech_ruins_item", {Ingredient("wall_ruins_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.ANCIENT, TECH.ANCIENT_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/mech_ruins_item.xml", "mech_ruins_item.tex")
		AddRecipe("mech_moonrock_item", {Ingredient("wall_moonrock_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/mech_moonrock_item.xml", "mech_moonrock_item.tex")
	
		AddRecipe("locked_mech_moonrock_item", {Ingredient("wall_moonrock_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/locked_mech_moonrock_item.xml", "locked_mech_moonrock_item.tex")
		AddRecipe("locked_mech_stone_item", {Ingredient("wall_stone_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/locked_mech_stone_item.xml", "locked_mech_stone_item.tex")
		AddRecipe("locked_mech_ruins_item", {Ingredient("wall_ruins_item", 1), Ingredient("goldnugget", 2)}, RECIPETABS.ANCIENT, TECH.ANCIENT_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/normal/locked_mech_ruins_item.xml", "locked_mech_ruins_item.tex")	
	end
end

