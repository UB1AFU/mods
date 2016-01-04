PrefabFiles = {
    "bow",
	"quiver",
	"sparkles",
	"zupalexsingredients",
}

Assets = {
    Asset( "ANIM", "anim/bow_attack.zip" ),
    Asset( "ANIM", "anim/swap_mloader.zip" ),
	
	Asset("SOUNDPACKAGE", "sound/bow_shoot.fev"),
    Asset("SOUND", "sound/bow_shoot_bank00.fsb"),
	
	Asset("ATLAS", "images/tabimages/archery_tab.xml"),
    Asset("IMAGE", "images/tabimages/archery_tab.tex"),
	
	Asset("ATLAS", "images/tabimages/quiver_slot.xml"),
    Asset("IMAGE", "images/tabimages/quiver_slot.tex"),
	
	Asset("ATLAS", "images/required/mnzironore.xml"),
	Asset("IMAGE", "images/required/mnzironore.tex"),
}

local require = GLOBAL.require

----------------------------------CROSS MOD CHECKS-----------------------------------------------

local IsSentriesModEnabled = false
local IsMiningMachineEnabled = false

if GLOBAL.TheNet:GetIsClient() then
	local ListOfServerMods = GLOBAL.TheNet:GetServerModNames()
	for k, v in pairs(ListOfServerMods) do
		if v == "workshop-488009136" or v == "Sentries Mod WIP" or v == "Sentries Mod Candidate" then
			IsSentriesModEnabled = true
		end
		if v == "workshop-516523980" or v == "Mining Machine WIP" or v == "Mining Machine Candidate" then
			IsMiningMachineEnabled = true
		end
	end
end

if GLOBAL.KnownModIndex then
	if GLOBAL.KnownModIndex:IsModEnabled("workshop-508739792") or GLOBAL.KnownModIndex:IsModEnabled("Sentries Mod WIP") or GLOBAL.KnownModIndex:IsModEnabled("Sentries Mod Candidate") then
		IsSentriesModEnabled = true
	end
	if GLOBAL.KnownModIndex:IsModEnabled("workshop-516523980") or GLOBAL.KnownModIndex:IsModEnabled("Mining Machine WIP") or GLOBAL.KnownModIndex:IsModEnabled("Mining Machine Candidate") then
		IsMiningMachineEnabled = true
	end
end

if IsSentriesModEnabled then
	print("----> Sentries Mod Is Enabled!")
end
if IsMiningMachineEnabled then
	print("----> Mining Machine Is Enabled!")
end

-------------------------------------------------------------------------------------------

local STRINGS = GLOBAL.STRINGS
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local GIngredient = GLOBAL.Ingredient
local TECH = GLOBAL.TECH

local FRAMES = GLOBAL.FRAMES
local ACTIONS = GLOBAL.ACTIONS
local State = GLOBAL.State
local EventHandler = GLOBAL.EventHandler
local ActionHandler = GLOBAL.ActionHandler
local TimeEvent = GLOBAL.TimeEvent
local EQUIPSLOTS = GLOBAL.EQUIPSLOTS

local BOWREQTWIGS = GetModConfigData("BowTwigs_req")
local BOWREQSILK = GetModConfigData("BowSilk_req")
local BOWTECHLEVEL = GetModConfigData("BowTechLevel")

local CROSSBOWREQBOARDS = GetModConfigData("CrossbowBoards_req")
local CROSSBOWREQSILK = GetModConfigData("CrossbowSilk_req")
local CROSSBOWREQHAMMER = GetModConfigData("CrossbowHammer_req")
local CROSSBOWTECHLEVEL = GetModConfigData("CrossbowTechLevel")

local MUSKETREQBOARDS = GetModConfigData("MusketBoards_req")
local MUSKETREQGOLD = GetModConfigData("MusketGold_req")
local MUSKETREQIRON = GetModConfigData("MusketIron_req")
local MUSKETREQFLINT = GetModConfigData("MusketFlint_req")
local MUSKETTECHLEVEL = GetModConfigData("MusketTechLevel")

local MAGICBOWREQLIVINGLOG = GetModConfigData("MagicBowLivingLog_req")
local MAGICBOWREQGEM = GetModConfigData("MagicBowPurpleGem_req")
local MAGICBOWREQGLOMMER = GetModConfigData("MagicBowGlommerFlower_req")
local MAGICBOWTECHLEVEL = GetModConfigData("MagicBowTechLevel")

local QUIVERREQPIGSKIN = GetModConfigData("QuiverPigskin_req")
local QUIVERREQROPE = GetModConfigData("QuiverRope_req")
local QUIVERTECHLEVEL = GetModConfigData("QuiverTechLevel")

local PROJSHAFTTYPE = GetModConfigData("ProjShaftType")

local ARROWHEADTYPE = GetModConfigData("ArrowHeadType")
local ARROWREQHEAD = GetModConfigData("ArrowHead_req")
local ARROWREQLOG = GetModConfigData("ArrowLog_req")
local ARROWREQFEATHER = GetModConfigData("ArrowFeather_req")
local ARROWCRAFTNUM = GetModConfigData("ArrowCraftAmount")
local ARROWTECHLEVEL = GetModConfigData("ArrowTechLevel")

local GOLDARROWREQHEAD = GetModConfigData("GoldArrowHead_req")
local GOLDARROWREQLOG = GetModConfigData("GoldArrowLog_req")
local GOLDARROWREQFEATHER = GetModConfigData("GoldArrowFeather_req")
local GOLDARROWCRAFTNUM = GetModConfigData("GoldArrowCraftAmount")
local GOLDARROWTECHLEVEL = GetModConfigData("GoldArrowTechLevel")

local MOONSTONEARROWREQHEAD = GetModConfigData("MoonstoneArrowHead_req")
local MOONSTONEARROWREQLOG = GetModConfigData("MoonstoneArrowLog_req")
local MOONSTONEARROWREQFEATHER = GetModConfigData("MoonstoneArrowFeather_req")
local MOONSTONEARROWCRAFTNUM = GetModConfigData("MoonstoneArrowCraftAmount")
local MOONSTONEARROWTECHLEVEL = GetModConfigData("MoonstoneArrowTechLevel")

local FIREARROWHEADTYPE = GetModConfigData("FireArrowHeadType")
local FIREARROWREQHEAD = GetModConfigData("FireArrowHead_req")
local FIREARROWREQGRASS = GetModConfigData("FireArrowGrass_req")
local FIREARROWREQLOG = GetModConfigData("FireArrowLog_req")
local FIREARROWREQFEATHER = GetModConfigData("FireArrowFeather_req")
local FIREARROWCRAFTNUM = GetModConfigData("FireArrowCraftAmount")
local FIREARROWTECHLEVEL = GetModConfigData("FireArrowTechLevel")

local ICEARROWHEADTYPE = GetModConfigData("IceArrowHeadType")
local ICEARROWREQHEAD = GetModConfigData("IceArrowHead_req")
local ICEARROWREQLOG = GetModConfigData("IceArrowLog_req")
local ICEARROWREQFEATHER = GetModConfigData("IceArrowFeather_req")
local ICEARROWCRAFTNUM = GetModConfigData("IceArrowCraftAmount")
local ICEARROWTECHLEVEL = GetModConfigData("IceArrowTechLevel")

local THUNDERARROWHEADTYPE = GetModConfigData("ThunderArrowHeadType")
local THUNDERARROWREQHEAD = GetModConfigData("ThunderArrowHead_req")
local THUNDERARROWREQLOG = GetModConfigData("ThunderArrowLog_req")
local THUNDERARROWREQFEATHER = GetModConfigData("ThunderArrowFeather_req")
local THUNDERARROWCRAFTNUM = GetModConfigData("ThunderArrowCraftAmount")
local THUNDERARROWTECHLEVEL = GetModConfigData("ThunderArrowTechLevel")

local BOLTHEADTYPE = GetModConfigData("BoltHeadType")
local BOLTREQHEAD = GetModConfigData("BoltHead_req")
local BOLTREQLOG = GetModConfigData("BoltLog_req")
local BOLTREQFEATHER = GetModConfigData("BoltFeather_req")
local BOLTCRAFTNUM = GetModConfigData("BoltCraftAmount")
local BOLTTECHLEVEL = GetModConfigData("BoltTechLevel")

local POISONBOLTHEADTYPE = GetModConfigData("PoisonBoltHeadType")
local POISONBOLTREQHEAD = GetModConfigData("PoisonBoltHead_req")
local POISONBOLTREQLOG = GetModConfigData("PoisonBoltLog_req")
local POISONBOLTREQREDCAP = GetModConfigData("PoisonBoltRedCap_req")
local POISONBOLTREQFEATHER = GetModConfigData("PoisonBoltFeather_req")
local POISONBOLTCRAFTNUM = GetModConfigData("PoisonBoltCraftAmount")
local POISONBOLTTECHLEVEL = GetModConfigData("PoisonBoltTechLevel")

local EXPLOSIVEBOLTHEADTYPE = GetModConfigData("ExplosiveBoltHeadType")
local EXPLOSIVEBOLTREQHEAD = GetModConfigData("ExplosiveBoltHead_req")
local EXPLOSIVEBOLTREQLOG = GetModConfigData("ExplosiveBoltLog_req")
local EXPLOSIVEBOLTREQFEATHER = GetModConfigData("ExplosiveBoltFeather_req")
local EXPLOSIVEBOLTREQMOSQUITO = GetModConfigData("ExplosiveBoltMosquitoSack_req")
local EXPLOSIVEBOLTCRAFTNUM = GetModConfigData("ExplosiveBoltCraftAmount")
local EXPLOSIVEBOLTTECHLEVEL = GetModConfigData("ExplosiveBoltTechLevel")

local MUSKETBULLETTYPE = GetModConfigData("MusketBulletType")
local MUSKETBULLETREQHEAD = GetModConfigData("MusketBulletHead_req")
local MUSKETBULLETREQGP = GetModConfigData("MusketBulletGP_req")
local MUSKETBULLETCRAFTNUM = GetModConfigData("MusketBulletCraftAmount")

GLOBAL.TUNING.BOWUSES = GetModConfigData("BowUses")
GLOBAL.TUNING.BOWDMG = GetModConfigData("BowDmg")
GLOBAL.TUNING.BOWRANGE = GetModConfigData("BowRange")

GLOBAL.TUNING.COLLISIONSAREON = GetModConfigData("ActivateCollisions")

GLOBAL.TUNING.CROSSBOWDMGMOD = GetModConfigData("CrossbowDmgMod")
GLOBAL.TUNING.CROSSBOWRANGEMOD = GetModConfigData("CrossbowRangeMod")
GLOBAL.TUNING.CROSSBOWACCMOD = GetModConfigData("CrossbowAccMod")

GLOBAL.TUNING.MAGICBOWDMGMOD = GetModConfigData("MagicBowDmgMod")

GLOBAL.TUNING.MUSKETDMGMOD = GetModConfigData("MusketDmgMod")
GLOBAL.TUNING.MUSKETRANGEMOD = GetModConfigData("MusketRangeMod")
GLOBAL.TUNING.MUSKETACCMOD = GetModConfigData("MusketAccMod")

GLOBAL.TUNING.GOLDARROWDMGMOD = GetModConfigData("GoldArrowDmgMod")
GLOBAL.TUNING.MOONSTONEARROWDMGMOD = GetModConfigData("MoonstoneArrowDmgMod")

GLOBAL.TUNING.FIREARROWDMGMOD = GetModConfigData("FireArrowDmgMod")
GLOBAL.TUNING.ICEARROWDMGMOD = GetModConfigData("IceArrowDmgMod")
GLOBAL.TUNING.THUNDERARROWDMGMOD = GetModConfigData("ThunderArrowDmgMod")

GLOBAL.TUNING.LRCHARGENUM = GetModConfigData("LightningRodChargesNum")

GLOBAL.TUNING.POISONBOLTDMGMOD = GetModConfigData("PoisonBoltDmgMod")
GLOBAL.TUNING.POISONBOLTDURATION = GetModConfigData("PoisonBoltDuration")

GLOBAL.TUNING.EXPLOSIVEBOLTRAD = GetModConfigData("ExplosiveBoltRadius")
GLOBAL.TUNING.EXPLOSIVEBOLTDMG = GetModConfigData("ExplosiveBoltExpDmg")

GLOBAL.TUNING.HITREC = GetModConfigData("ArrowHitRecovery")
GLOBAL.TUNING.MISSREC = GetModConfigData("ArrowMissRecovery")
GLOBAL.TUNING.GOLDARROWRECCHANCEMOD = GetModConfigData("GoldArrowRecoveryMod")

GLOBAL.TUNING.BOWMISSCHANCESMALL = GetModConfigData("BowMissChanceSmall")
GLOBAL.TUNING.BOWMISSCHANCEBIG = GetModConfigData("BowMissChanceBig")

GLOBAL.TUNING.HITCHANCEBUGS = GetModConfigData("HitChanceBugs")
GLOBAL.TUNING.HITCHANCEFLYINGBIRDS = GetModConfigData("HitChanceTakeOff")

GLOBAL.TUNING.CRITCHANCEPVE = GetModConfigData("CritPvE")
GLOBAL.TUNING.CRITDMGMODPVE = GetModConfigData("CritDmgModPvE")
GLOBAL.TUNING.CRITCHANCEPVP = GetModConfigData("CritPvP")
GLOBAL.TUNING.CRITDMGMODPVP = GetModConfigData("CritDmgModPvP")

local ADE = GetModConfigData("AccuracyDrugEffect")
GLOBAL.TUNING.VITAMINRACCMOD = 1
GLOBAL.TUNING.VITAMINRRECMOD = 1

if ADE == "small" then
GLOBAL.TUNING.VITAMINRACCMOD = 0.7
GLOBAL.TUNING.VITAMINRRECMOD = 0.15
elseif ADE == "medium" then
GLOBAL.TUNING.VITAMINRACCMOD = 0.4
GLOBAL.TUNING.VITAMINRRECMOD = 0.35
elseif ADE == "strong" then
GLOBAL.TUNING.VITAMINRACCMOD = 0.15
GLOBAL.TUNING.VITAMINRRECMOD = 0.6
elseif ADE == "robinhood" then
GLOBAL.TUNING.VITAMINRACCMOD = 0
GLOBAL.TUNING.VITAMINRRECMOD = 1
end 


GLOBAL.INVINFO = {}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function ReturnTechLevel(modcfg)
	if modcfg == "NONE" then
		return TECH.NONE
	elseif modcfg == "SCIENCE_ONE" then
		return TECH.SCIENCE_ONE
	elseif modcfg == "SCIENCE_TWO" then
		return TECH.SCIENCE_TWO		
	elseif modcfg == "MAGIC_TWO" then
		return TECH.MAGIC_TWO			
	elseif modcfg == "MAGIC_THREE" then
		return TECH.MAGIC_THREE			
	end
end

local archerytab = AddRecipeTab("Archery", 6, "images/tabimages/archery_tab.xml", "archery_tab.tex", nil)

local QUIVERrecipeIngredients = {}

QUIVERrecipeIngredients[#QUIVERrecipeIngredients + 1]= GIngredient("pigskin", QUIVERREQPIGSKIN);
QUIVERrecipeIngredients[#QUIVERrecipeIngredients + 1] = GIngredient("rope", QUIVERREQROPE);

AddRecipe("quiver", QUIVERrecipeIngredients , archerytab, ReturnTechLevel(QUIVERTECHLEVEL), nil, nil, nil, 1, nil, "images/inventoryimages/quiver.xml", "quiver.tex")

local BOWrecipeIngredients = {}

BOWrecipeIngredients[#BOWrecipeIngredients + 1]= GIngredient("twigs", BOWREQTWIGS);
BOWrecipeIngredients[#BOWrecipeIngredients + 1] = GIngredient("silk", BOWREQSILK);

AddRecipe("bow", BOWrecipeIngredients , archerytab, ReturnTechLevel(BOWTECHLEVEL), nil, nil, nil, 1, nil, "images/inventoryimages/bow.xml", "bow.tex")

local ARROWrecipeIngredients = {}

ARROWrecipeIngredients[#ARROWrecipeIngredients + 1]= GIngredient(ARROWHEADTYPE, ARROWREQHEAD);
ARROWrecipeIngredients[#ARROWrecipeIngredients + 1] = GIngredient(PROJSHAFTTYPE, ARROWREQLOG);
if ARROWREQFEATHER > 0 then
	ARROWrecipeIngredients[#ARROWrecipeIngredients + 1] = GIngredient("feather_crow", ARROWREQFEATHER);
end

AddRecipe("arrow", ARROWrecipeIngredients , archerytab, ReturnTechLevel(ARROWTECHLEVEL), nil, nil, nil, ARROWCRAFTNUM, nil, "images/inventoryimages/arrow.xml", "arrow.tex")

local GOLDARROWrecipeIngredients = {}

GOLDARROWrecipeIngredients[#GOLDARROWrecipeIngredients + 1]= GIngredient("goldnugget", GOLDARROWREQHEAD);
GOLDARROWrecipeIngredients[#GOLDARROWrecipeIngredients + 1] = GIngredient(PROJSHAFTTYPE, GOLDARROWREQLOG);
if GOLDARROWREQFEATHER > 0 then
	GOLDARROWrecipeIngredients[#GOLDARROWrecipeIngredients + 1] = GIngredient("feather_crow", GOLDARROWREQFEATHER);
end

AddRecipe("goldarrow", GOLDARROWrecipeIngredients , archerytab, ReturnTechLevel(GOLDARROWTECHLEVEL), nil, nil, nil, GOLDARROWCRAFTNUM, nil, "images/inventoryimages/goldarrow.xml", "goldarrow.tex")

local MOONSTONEARROWrecipeIngredients = {}

MOONSTONEARROWrecipeIngredients[#MOONSTONEARROWrecipeIngredients + 1]= GIngredient("moonrocknugget", MOONSTONEARROWREQHEAD);
MOONSTONEARROWrecipeIngredients[#MOONSTONEARROWrecipeIngredients + 1] = GIngredient(PROJSHAFTTYPE, MOONSTONEARROWREQLOG);
if MOONSTONEARROWREQFEATHER > 0 then
	MOONSTONEARROWrecipeIngredients[#MOONSTONEARROWrecipeIngredients + 1] = GIngredient("feather_crow", MOONSTONEARROWREQFEATHER);
end

AddRecipe("moonstonearrow", MOONSTONEARROWrecipeIngredients , archerytab, ReturnTechLevel(MOONSTONEARROWTECHLEVEL), nil, nil, nil, MOONSTONEARROWCRAFTNUM, nil, "images/inventoryimages/moonstonearrow.xml", "moonstonearrow.tex")

local FIREARROWrecipeIngredients = {}

FIREARROWrecipeIngredients[#FIREARROWrecipeIngredients + 1] = GIngredient(PROJSHAFTTYPE, FIREARROWREQLOG);
FIREARROWrecipeIngredients[#FIREARROWrecipeIngredients + 1]= GIngredient(FIREARROWHEADTYPE, FIREARROWREQHEAD);
if FIREARROWREQFEATHER > 0 then
	FIREARROWrecipeIngredients[#FIREARROWrecipeIngredients + 1] = GIngredient("feather_robin", FIREARROWREQFEATHER);
end
if FIREARROWREQGRASS > 0 then
	FIREARROWrecipeIngredients[#FIREARROWrecipeIngredients + 1] = GIngredient("cutgrass", FIREARROWREQGRASS);
end

AddRecipe("firearrow", FIREARROWrecipeIngredients , archerytab, ReturnTechLevel(FIREARROWTECHLEVEL), nil, nil, nil, FIREARROWCRAFTNUM, nil, "images/inventoryimages/firearrow.xml", "firearrow.tex")

local ICEARROWrecipeIngredients = {}

ICEARROWrecipeIngredients[#ICEARROWrecipeIngredients + 1] = GIngredient(PROJSHAFTTYPE, ICEARROWREQLOG);
ICEARROWrecipeIngredients[#ICEARROWrecipeIngredients + 1]= GIngredient(ICEARROWHEADTYPE, ICEARROWREQHEAD);
if ICEARROWREQFEATHER > 0 then
	ICEARROWrecipeIngredients[#ICEARROWrecipeIngredients + 1] = GIngredient("feather_robin_winter", ICEARROWREQFEATHER);
end

AddRecipe("icearrow", ICEARROWrecipeIngredients , archerytab, ReturnTechLevel(ICEARROWTECHLEVEL), nil, nil, nil, ICEARROWCRAFTNUM, nil, "images/inventoryimages/icearrow.xml", "icearrow.tex")

local THUNDERARROWrecipeIngredients = {}

THUNDERARROWrecipeIngredients[#THUNDERARROWrecipeIngredients + 1] = GIngredient(PROJSHAFTTYPE, THUNDERARROWREQLOG);
THUNDERARROWrecipeIngredients[#THUNDERARROWrecipeIngredients + 1]= GIngredient(THUNDERARROWHEADTYPE, THUNDERARROWREQHEAD);
if THUNDERARROWREQFEATHER > 0 then
	THUNDERARROWrecipeIngredients[#THUNDERARROWrecipeIngredients + 1] = GIngredient("feather_robin_winter", THUNDERARROWREQFEATHER);
end

AddRecipe("thunderarrow", THUNDERARROWrecipeIngredients , archerytab, ReturnTechLevel(THUNDERARROWTECHLEVEL), nil, nil, nil, THUNDERARROWCRAFTNUM, nil, "images/inventoryimages/thunderarrow.xml", "thunderarrow.tex")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local CROSSBOWrecipeIngredients = {}

CROSSBOWrecipeIngredients[#CROSSBOWrecipeIngredients + 1]= GIngredient("boards", CROSSBOWREQBOARDS);
CROSSBOWrecipeIngredients[#CROSSBOWrecipeIngredients + 1] = GIngredient("silk", CROSSBOWREQSILK);
if CROSSBOWREQHAMMER > 0 then
	CROSSBOWrecipeIngredients[#CROSSBOWrecipeIngredients + 1] = GIngredient("hammer", CROSSBOWREQHAMMER);
end

AddRecipe("crossbow", CROSSBOWrecipeIngredients , archerytab, ReturnTechLevel(CROSSBOWTECHLEVEL), nil, nil, nil, 1, nil, "images/inventoryimages/crossbow.xml", "crossbow.tex")

local BOLTrecipeIngredients = {}

BOLTrecipeIngredients[#BOLTrecipeIngredients + 1]= GIngredient(PROJSHAFTTYPE, BOLTREQLOG);
if BOLTREQFEATHER > 0 then
	BOLTrecipeIngredients[#BOLTrecipeIngredients + 1] = GIngredient("feather_crow", BOLTREQFEATHER);
end
BOLTrecipeIngredients[#BOLTrecipeIngredients + 1] = GIngredient(BOLTHEADTYPE, BOLTREQHEAD);

AddRecipe("bolt", BOLTrecipeIngredients , archerytab, ReturnTechLevel(BOLTTECHLEVEL), nil, nil, nil, BOLTCRAFTNUM, nil, "images/inventoryimages/bolt.xml", "bolt.tex")

local POISONBOLTrecipeIngredients = {}

POISONBOLTrecipeIngredients[#POISONBOLTrecipeIngredients + 1]= GIngredient(PROJSHAFTTYPE, POISONBOLTREQLOG);
if POISONBOLTREQFEATHER > 0 then
	POISONBOLTrecipeIngredients[#POISONBOLTrecipeIngredients + 1] = GIngredient("feather_crow", POISONBOLTREQFEATHER);
end
POISONBOLTrecipeIngredients[#POISONBOLTrecipeIngredients + 1] = GIngredient(POISONBOLTHEADTYPE, POISONBOLTREQHEAD);
POISONBOLTrecipeIngredients[#POISONBOLTrecipeIngredients + 1] = GIngredient("red_cap", POISONBOLTREQREDCAP);

AddRecipe("poisonbolt", POISONBOLTrecipeIngredients , archerytab, ReturnTechLevel(POISONBOLTTECHLEVEL), nil, nil, nil, POISONBOLTCRAFTNUM, nil, "images/inventoryimages/poisonbolt.xml", "poisonbolt.tex")

local EXPLOSIVEBOLTrecipeIngredients = {}

EXPLOSIVEBOLTrecipeIngredients[#EXPLOSIVEBOLTrecipeIngredients + 1]= GIngredient(PROJSHAFTTYPE, EXPLOSIVEBOLTREQLOG);
if EXPLOSIVEBOLTREQFEATHER > 0 then
	EXPLOSIVEBOLTrecipeIngredients[#EXPLOSIVEBOLTrecipeIngredients + 1] = GIngredient("feather_crow", EXPLOSIVEBOLTREQFEATHER);
end
if EXPLOSIVEBOLTREQMOSQUITO > 0 then
	EXPLOSIVEBOLTrecipeIngredients[#EXPLOSIVEBOLTrecipeIngredients + 1] = GIngredient("mosquitosack", EXPLOSIVEBOLTREQMOSQUITO);
end
EXPLOSIVEBOLTrecipeIngredients[#BOLTrecipeIngredients + 1] = GIngredient(EXPLOSIVEBOLTHEADTYPE, EXPLOSIVEBOLTREQHEAD);

AddRecipe("explosivebolt", EXPLOSIVEBOLTrecipeIngredients , archerytab, ReturnTechLevel(EXPLOSIVEBOLTTECHLEVEL), nil, nil, nil, EXPLOSIVEBOLTCRAFTNUM, nil, "images/inventoryimages/explosivebolt.xml", "explosivebolt.tex")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local MAGICBOWrecipeIngredients = {}

MAGICBOWrecipeIngredients[#MAGICBOWrecipeIngredients + 1] = GIngredient("livinglog", MAGICBOWREQLIVINGLOG);
MAGICBOWrecipeIngredients[#MAGICBOWrecipeIngredients + 1] = GIngredient("purplegem", MAGICBOWREQGEM);
if MAGICBOWREQGLOMMER then
	MAGICBOWrecipeIngredients[#MAGICBOWrecipeIngredients + 1] = GIngredient("glommerflower", 1);
end

AddRecipe("magicbow", MAGICBOWrecipeIngredients , archerytab, ReturnTechLevel(MAGICBOWTECHLEVEL), nil, nil, nil, 1, nil, "images/inventoryimages/magicbow.xml", "magicbow.tex")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local MUSKETrecipeIngredients = {}

MUSKETrecipeIngredients[#MUSKETrecipeIngredients + 1] = GIngredient("boards", MUSKETREQBOARDS);
MUSKETrecipeIngredients[#MUSKETrecipeIngredients + 1] = GIngredient("flint", MUSKETREQFLINT);
if MUSKETREQGOLD > 0 then
	MUSKETrecipeIngredients[#MUSKETrecipeIngredients + 1] = GIngredient("goldnugget", MUSKETREQGOLD);
end
if MUSKETREQIRON > 0 then
	if IsMiningMachineEnabled then
		MUSKETrecipeIngredients[#MUSKETrecipeIngredients + 1] = GIngredient("mnzironore", MUSKETREQIRON, "images/required/mnzironore.xml");
	elseif MUSKETREQGOLD == 0 then
		MUSKETrecipeIngredients[#MUSKETrecipeIngredients + 1] = GIngredient("goldnugget", MUSKETREQIRON);
	end
end

AddRecipe("musket", MUSKETrecipeIngredients , archerytab, ReturnTechLevel(MUSKETTECHLEVEL), nil, nil, nil, 1, nil, "images/inventoryimages/musket.xml", "musket.tex")

local MUSKETBULLETrecipeIngredients = {}

if MUSKETBULLETTYPE == "rocks" then
	MUSKETBULLETrecipeIngredients[#MUSKETBULLETrecipeIngredients + 1] = GIngredient("rocks", MUSKETBULLETREQHEAD);
elseif MUSKETBULLETTYPE == "mnzironore" then
	if IsMiningMachineEnabled then
		MUSKETBULLETrecipeIngredients[#MUSKETBULLETrecipeIngredients + 1] = GIngredient("mnzironore", MUSKETBULLETREQHEAD, "images/required/mnzironore.xml");
	else
		MUSKETBULLETrecipeIngredients[#MUSKETBULLETrecipeIngredients + 1] = GIngredient("rocks", MUSKETBULLETREQHEAD);
	end
end

MUSKETBULLETrecipeIngredients[#MUSKETBULLETrecipeIngredients + 1] = GIngredient("gunpowder", MUSKETBULLETREQGP);

AddRecipe("musket_bullet", MUSKETBULLETrecipeIngredients , archerytab, ReturnTechLevel(MUSKETTECHLEVEL), nil, nil, nil, MUSKETBULLETCRAFTNUM, nil, "images/inventoryimages/musket_bullet.xml", "musket_bullet.tex")

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local FIREFLIESBALLrecipeIngredients = {}

FIREFLIESBALLrecipeIngredients[#FIREFLIESBALLrecipeIngredients + 1] = GIngredient("fireflies", 1);
FIREFLIESBALLrecipeIngredients[#FIREFLIESBALLrecipeIngredients + 1] = GIngredient("honey", 3);

AddRecipe("z_firefliesball", FIREFLIESBALLrecipeIngredients , archerytab, ReturnTechLevel(MAGICBOWTECHLEVEL), nil, nil, nil, 1, nil, "images/inventoryimages/z_firefliesball.xml", "z_firefliesball.tex")

local BLUEGOOPrecipeIngredients = {}

BLUEGOOPrecipeIngredients[#BLUEGOOPrecipeIngredients + 1] = GIngredient("spidergland", 1);
BLUEGOOPrecipeIngredients[#BLUEGOOPrecipeIngredients + 1] = GIngredient("blue_cap", 1);

AddRecipe("z_bluegoop", BLUEGOOPrecipeIngredients , archerytab, ReturnTechLevel(MAGICBOWTECHLEVEL), nil, nil, nil, 1, nil, "images/inventoryimages/z_bluegoop.xml", "z_bluegoop.tex")

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

STRINGS.NAMES.BOW = "木弓"
STRINGS.RECIPE_DESC.BOW = "很有用，如果你会瞄准."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BOW = "我曾经是个优秀的弓箭手... 知道我膝盖受了一箭."

STRINGS.NAMES.QUIVER = "箭袋"
STRINGS.RECIPE_DESC.QUIVER = "存储你的弓箭!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.QUIVER = "有了箭袋，我看起来像个弓箭手了."

STRINGS.NAMES.ARROW = "箭"
STRINGS.RECIPE_DESC.ARROW = "不要把它扔了."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ARROW = "最好使用弓..."

STRINGS.NAMES.GOLDARROW = "金箭"
STRINGS.RECIPE_DESC.GOLDARROW = "狩猎风格."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.GOLDARROW = "我相信我能找到一种更好的使用方法..."

STRINGS.NAMES.MOONSTONEARROW = "月岩箭"
STRINGS.RECIPE_DESC.MOONSTONEARROW = "昂贵但是有效."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MOONSTONEARROW = "锋利! 发光！"

STRINGS.NAMES.FIREARROW = "烈焰箭"
STRINGS.RECIPE_DESC.FIREARROW = "最好小心使用."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.FIREARROW = "我应该避免在营地使用它..."

STRINGS.NAMES.ICEARROW = "寒冰箭"
STRINGS.RECIPE_DESC.ICEARROW = "stay cool."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEARROW = "我应该把它放在冰箱里吗?"

STRINGS.NAMES.THUNDERARROW = "雷霆箭"
STRINGS.RECIPE_DESC.THUNDERARROW = "暴风雨即将来临."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.THUNDERARROW = "The red wire on the plus..."

STRINGS.NAMES.DISCHARGEDTHUNDERARROW = "未充电的雷霆箭"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DISCHARGEDTHUNDERARROW = "毫无生机."

STRINGS.NAMES.CROSSBOW = "弩"
STRINGS.RECIPE_DESC.CROSSBOW = "沉重而有力."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CROSSBOW = "这个东西比我大."

STRINGS.NAMES.BOLT = "弩箭"
STRINGS.RECIPE_DESC.BOLT = "不是一个牙签."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BOLT = "这么小的弹药！这么大的武器..."

STRINGS.NAMES.POISONBOLT = "剧毒弩箭"
STRINGS.RECIPE_DESC.POISONBOLT = "摸了砒霜，吓死爸爸了."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.POISONBOLT = "它有那么丑吗?"

STRINGS.NAMES.EXPLOSIVEBOLT = "爆炸弩箭"
STRINGS.RECIPE_DESC.EXPLOSIVEBOLT = "Do not use point blank."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.EXPLOSIVEBOLT = "这真的是个好主意么?"

STRINGS.NAMES.MAGICBOW = "魔法弩箭"
STRINGS.RECIPE_DESC.MAGICBOW = "就像在童话的尾巴上."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MAGICBOW = "我想要一个会放屁的彩虹独角兽."

STRINGS.NAMES.MUSKET = "毛瑟枪"
STRINGS.RECIPE_DESC.MUSKET = "警告你，它的声音很大."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSKET = "我是第五个火枪手吗?"

STRINGS.NAMES.MUSKET_BULLET = "毛瑟枪子弹"
STRINGS.RECIPE_DESC.MUSKET_BULLET = "亲爱的，我们去狩猎吧."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSKET_BULLET = "它看起来像弹珠"

STRINGS.NAMES.Z_FIREFLIESBALL = "萤火虫球"
STRINGS.RECIPE_DESC.Z_FIREFLIESBALL = "不要吃"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.Z_FIREFLIESBALL = "这可能是有用的东西。不要问我是什么."

STRINGS.NAMES.Z_BLUEGOOP = "蓝色的黏糊糊的东西"
STRINGS.RECIPE_DESC.Z_BLUEGOOP = "不要用来射你的敌人."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.Z_BLUEGOOP = "看起来真恶心."

-------------------------------------QUIVER EXTRA EQUIP SLOT-------------------------------------------------------------------------------------------------------------------------------------------------

GLOBAL.EQUIPSLOTS.QUIVER = "quiver"

AddGlobalClassPostConstruct("widgets/inventorybar", "Inv", function(self, owner)													
															self.bg:SetScale(1.15+0.05,1,1)
															self.bgcover:SetScale(1.15+0.05,1,1)
					
															self:AddEquipSlot(GLOBAL.EQUIPSLOTS.QUIVER, "images/tabimages/quiver_slot.xml", "quiver_slot.tex",99)
														end
)

-------------------------------------NEW ACTIONS--------------------------------------------------------------------------------------

local global_facing

local global_havearrow			 
local global_targetisok          
local global_targetislimbo       
local global_havequiver          
local global_projtypeok          
local global_xbowisarmed         
local global_finishedarming   
local global_hasbullet   
local global_conditions_fulfilled

local global_isbowmagic
local global_magicweaponhasfuel

local global_weapname

local allowedprojbow = { "arrow", "goldarrow", "moonstonearrow", "firearrow", "icearrow", "thunderarrow", "dischargedthunderarrow" }
local allowedprojcrossbow = { "bolt", "poisonbolt", "explosivebolt" }

local function ClearUseArrowTags(inst)
	inst:RemoveTag("use_arrow")
	inst:RemoveTag("use_firearrow")
end

local CHANGEARROWTYPE = GLOBAL.Action(5,		-- priority
								nil,	-- instant (set to not instant)
								true,	-- right mouse button
								nil,		-- distance check
								nil,	-- ghost valid (set to not ghost valid)
								nil,	-- ghost exclusive
								nil,	-- can force action
								nil)	-- Range check function
CHANGEARROWTYPE.str = "Change the ammo type to use"
CHANGEARROWTYPE.id = "CHANGEARROWTYPE"
CHANGEARROWTYPE.fn = function(act)
--	print("I entered the  ACTION CHANGEARROWTYPE!")

	local quiver = act.doer.replica.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
	local useditem = act.invobject
	local inventory = act.doer.components.inventory
					
--	print("Used object is : ", useditem.prefab)
	
	if useditem ~= nil and quiver.replica.container ~= nil and quiver:HasTag("zupalexsrangedweapons") then
--		print("I have a quiver and a used item")
		local slotitem = quiver.replica.container:GetItemInSlot(1)
			if useditem ~= slotitem then
				if slotitem == nil and
				quiver.replica.container:CanTakeItemInSlot(useditem, 1) and
				(quiver.replica.container:AcceptsStacks() or
				useditem.components.stackable == nil or
				not useditem.components.stackable:IsStack()) 
				then
--					print("there is nothing in the quiver and I put new arrows")
					local newactivearrow = GLOBAL.SpawnPrefab(string.lower(useditem.prefab))
					newactivearrow.components.stackable:SetStackSize(useditem.components.stackable.stacksize)
					quiver.components.container:GiveItem(newactivearrow, 1)
					useditem:Remove()
			elseif useditem ~= nil and
				slotitem ~= nil and
				quiver.replica.container:CanTakeItemInSlot(useditem, 1) and
				slotitem.prefab == useditem.prefab and
				slotitem.components.stackable ~= nil and
				quiver.replica.container:AcceptsStacks() 
				then	
--					print("there is something in the quiver and i add to the existing stack")
					local currentactivestack = useditem.components.stackable.stacksize
					local currentstackinquiver = slotitem.components.stackable.stacksize
					local stackoverflow = currentactivestack - slotitem.components.stackable:RoomLeft()
					
--					print("inv stack = ", currentactivestack, "     /     quiver stack = ", currentstackinquiver, "     /     overflow = ", stackoverflow)
					
					if stackoverflow <= 0 then
						slotitem.components.stackable:SetStackSize(currentactivestack + currentstackinquiver)
						useditem:Remove()
					else
						slotitem.components.stackable:SetStackSize(slotitem.components.stackable.maxsize)
						useditem.components.stackable:SetStackSize(stackoverflow)
--						print("quiver stack old = ", currentstackinquiver, "     /     quiver stack new = ", slotitem.components.stackable.stacksize, "     /     leftover = ", useditem.components.stackable.stacksize)
					end
			elseif useditem ~= nil and
				slotitem ~= nil and
				quiver.replica.container:CanTakeItemInSlot(useditem, slot) and
				not (slotitem.prefab == useditem.prefab and
					slotitem.components.stackable ~= nil and
					quiver.replica.container:AcceptsStacks()) and
				not (useditem.components.stackable ~= nil and
					useditem.components.stackable:IsStack() and
					not quiver.replica.container:AcceptsStacks()) 
				then
--					print("there is something in the quiver and i swap the two stacks")
					
					local newactivearrow = GLOBAL.SpawnPrefab(useditem.prefab)
					newactivearrow.components.stackable:SetStackSize(useditem.components.stackable.stacksize)
					
					local previnquiver = GLOBAL.SpawnPrefab(slotitem.prefab)
					previnquiver.components.stackable:SetStackSize(slotitem.components.stackable.stacksize)							
							
					slotitem:Remove()
					useditem:Remove()
					quiver.components.container:GiveItem(newactivearrow, 1)	
					inventory:GiveItem(previnquiver)
			end
		end
	end
	
	return true
end

AddAction(CHANGEARROWTYPE)

local ARMCROSSBOW = GLOBAL.Action(	5,		-- priority
									nil,	-- instant (set to not instant)
									true,	-- right mouse button
									nil,	-- distance check
									nil,	-- ghost valid (set to not ghost valid)
									nil,	-- ghost exclusive
									nil,	-- can force action
									nil)	-- Range check function
ARMCROSSBOW.strfn = function(act)
	if act.invobject:HasTag("crossbow") then
		return "XBOW"
	elseif act.invobject:HasTag("musket") or act.invobject:HasTag("bullet") then
		return "MUSKET"
	end
end
ARMCROSSBOW.id = "ARMCROSSBOW"
ARMCROSSBOW.fn = function(act)
--	print("I entered the  ACTION ARMCROSSBOW!")
	local invobj = act.invobject
	local target = act.target
	local inventory = act.doer.components.inventory
	
	if invobj.components.zupalexsrangedweapons ~= nil and 
		(invobj:HasTag("crossbow") or 
		(invobj:HasTag("musket") and inventory and (inventory:Has("musket_bullet", 1) or inventory:Has("musket_silverbullet", 1)))) then
			if not invobj:HasTag("readytoshoot") then
				invobj.components.zupalexsrangedweapons:OnArmed(act.doer)
			end
	end
	
	if target and invobj and invobj.components.zupalexsrangedweapons and target.components.zupalexsrangedweapons and invobj:HasTag("bullet") and target:HasTag("musket") then
		if not target:HasTag("readytoshoot") then
			target.components.zupalexsrangedweapons:OnArmed(act.doer, invobj.prefab)
		end
	end

	return true
end

AddAction(ARMCROSSBOW)

local TRANSFERCHARGETOPROJECTILE = GLOBAL.Action(	6,		-- priority
													nil,	-- instant (set to not instant)
													nil,	-- right mouse button
													nil,	-- distance check
													nil,	-- ghost valid (set to not ghost valid)
													nil,	-- ghost exclusive
													nil,	-- can force action
													nil)	-- Range check function
TRANSFERCHARGETOPROJECTILE.str = "给一个弹药充电"
TRANSFERCHARGETOPROJECTILE.id = "TRANSFERCHARGETOPROJECTILE"
TRANSFERCHARGETOPROJECTILE.fn = function(act)
	local target = act.target
	local useditem = act.invobject
	local inventory = act.doer.components.inventory
	
	if target.chargeleft then
		if target.zchargeleft == nil then
			target.zchargeleft = GLOBAL.TUNING.LRCHARGENUM
		end
		
		target.zchargeleft = target.zchargeleft - 1

		if target.zchargeleft <= 0 then
			target.AnimState:ClearBloomEffectHandle()
			target.charged = false
			target.chargeleft = nil
			target.zchargeleft = nil
			target.Light:Enable(false)
			if target.zaptask then
				target.zaptask:Cancel()
				target.zaptask = nil
			end
			if target:HasTag("z_ischarged") then
				target:RemoveTag("z_ischarged")
			end
		end
	end
		
	local currentstack = useditem.components.stackable.stacksize
	
	local newproj = GLOBAL.SpawnPrefab("thunderarrow")
	
	if currentstack > 1 then
		useditem.components.stackable:SetStackSize(currentstack - 1)
	else
		useditem:Remove()
	end
	
	inventory:GiveItem(newproj)
	
	return true
end

AddAction(TRANSFERCHARGETOPROJECTILE)

------------------------------------------------------STATEGRAPHES--------------------------------------------------------------

local bow_attack = State({
    name = "bow",
    tags = { "attack", "notalking", "abouttoattack", "autopredict" },

    onenter = function(inst)
        local buffaction = inst:GetBufferedAction()
--		print("buffaction in host SG : ", buffaction)
        local target = (buffaction ~= nil and buffaction.target) or inst.fatarget or nil
		local equip = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		local wornhat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
		local quiver = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
		local projinquiver = nil
		
		inst.components.combat:SetTarget(target)
		inst.components.locomotor:Stop()
	
		global_isbowmagic = false	
		global_magicweaponhasfuel = false
		
		if equip:HasTag("magic") then
			global_isbowmagic = true
			
			if equip:HasTag("hasfuel") then
				global_magicweaponhasfuel = true
			end
		end
		
		global_havequiver = false
		global_havearrow = false	
		global_projtypeok = false

--		local cooldown = inst.components.combat.min_attack_period + .5 * FRAMES
		local cooldown = 60 * FRAMES
		
--		print("I am in the state and the quiver is : ", quiver)

		if not global_isbowmagic then
			if quiver ~= nil and quiver.replica.container ~= nil then
				global_havequiver = true
				projinquiver = quiver.replica.container:GetItemInSlot(1)
			end
			
			if projinquiver ~= nil then
				global_havearrow = true
				for k, v in pairs(allowedprojbow) do
	--				print("Projectile in quiver (state) : ", projinquiver.prefab, "   / found : ", v)
					if projinquiver.prefab == v then
	--					print("found a matching projectile in state")
						global_projtypeok = true
						break
					end
				end
			end
		end
		
--		print("target in host SG : ", target)
		if target ~= nil and not (target:HasTag("wall") or target:HasTag("butterfly")) then
			global_targetisok = true
		else
			global_targetisok = false
		end

		global_conditions_fulfilled = false
		if ((global_havequiver and global_havearrow and global_projtypeok) or (global_isbowmagic and global_magicweaponhasfuel)) and global_targetisok then
			global_conditions_fulfilled = true
		end
		
--		print("Conditions status is : ", global_havequiver, "   ", global_havearrow, "   ", global_targetisok, "   ", global_projtypeok, "   => ", global_conditions_fulfilled)
		
		if not global_conditions_fulfilled then
			inst.AnimState:PlayAnimation("idle", true)
		end
		
--		print("have arrow : ", global_havearrow, "   /   target is ok : ", global_targetisok)			
		
	    if equip ~= nil and equip.components.zupalexsrangedweapons ~= nil and global_conditions_fulfilled then
			inst.components.combat:StartAttack()
		
--			print("And I found the BOW on the host!")
			inst.AnimState:PlayAnimation("bow_attack")

			inst.xoffsetBS = -70
			inst.yoffsetBS = 90
			inst.zoffsetBS = 0
			
			if inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_UP then
				inst.zoffsetBS = -0.1
				if wornhat ~= nil then
--					print("hat and face up")
					inst.AnimState:Hide("timeline_0")
				else
--					print("no hat and face up")
					inst.AnimState:Hide("timeline_15")
				end
			elseif inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_DOWN then
				inst.xoffsetBS = -65
				inst.yoffsetBS = 85
				if wornhat ~= nil then
--					print("hat and face down")
					inst.AnimState:Hide("timeline_3")
				else
--				print("no hat and face down")
				inst.AnimState:Hide("timeline_16")
				end
			else
				if wornhat ~= nil then
--					print("hat and face side")
					inst.AnimState:Hide("timeline_3")
				else
--				print("no hat and face side")
				inst.AnimState:Hide("timeline_16")
				end
			end
        end

		inst.sg:SetTimeout(cooldown)
		
        if target ~= nil and target:IsValid() then
            inst:FacePoint(target.Transform:GetWorldPosition())
            inst.sg.statemem.attacktarget = target
        end
    end,

    timeline =
    {		
		TimeEvent(0 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										if global_isbowmagic then
											inst.beamstring = GLOBAL.SpawnPrefab("beamstring")
											inst.beamstring.Transform:SetPosition(inst:GetPosition():Get())
											inst.beamstring:SetFollowTarget(inst, "swap_beamstring", inst.xoffsetBS, inst.yoffsetBS, inst.zoffsetBS)
											inst.beamstring.AnimState:PlayAnimation("drawandshoot")
											inst.beamstring.AnimState:SetLayer(GLOBAL.LAYER_WORLD)
--											inst.beamstring.AnimState:SetSortOrder(0)
	
											inst.SoundEmitter:PlaySound("bow_shoot/magicbow_shoot/buzz", "buzz")
										else
											inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_draw")
										end
									else
										inst.sg:RemoveStateTag("abouttoattack")
										inst:ClearBufferedAction()
									end
								end),	
	
		TimeEvent(8 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										if global_isbowmagic then
											inst.SoundEmitter:PlaySound("bow_shoot/magicbow_shoot/shot")
										else
											inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_shoot")
										end
									end
								end),	
	
		TimeEvent(14 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										inst:PerformBufferedAction()
										inst.sg:RemoveStateTag("abouttoattack")
									end
								end),
							
		TimeEvent(15 * FRAMES, function(inst)
									if not global_conditions_fulfilled then
										inst.AnimState:PlayAnimation("idle")
									elseif global_isbowmagic then
										inst.SoundEmitter:KillSound("buzz")
									end
								end),							
    },

    ontimeout = function(inst)
        inst.sg:RemoveStateTag("attack")
        inst.sg:AddStateTag("idle")
		inst.fatarget = nil
    end,

    events =
    {
        EventHandler("equip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("animqueueover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },

    onexit = function(inst)
--		print("I exit the SG of the host NOW")
		inst.fatarget = nil
        inst.components.combat:SetTarget(nil)
        if inst.sg:HasStateTag("abouttoattack") then
            inst.components.combat:CancelAttack()
        end
		
		if global_isbowmagic and inst.beamstring ~= nil then
			inst.beamstring:Remove()
		end
		
		
		if inst.components.talker then
			if not global_isbowmagic then
				if not global_havequiver then
					local noquiver_message = "我需要一个箭袋!"
					inst.components.talker:Say(noquiver_message)
				elseif not global_havearrow then
					local noammo_message = "我的箭袋空了!"
					inst.components.talker:Say(noammo_message)
				elseif not global_projtypeok then
					local badammo_message = "我当前的武器并不能使用它..."
					inst.components.talker:Say(badammo_message)
				elseif global_targetislimbo then
					local targetinlimbo_message = "已经太晚了..."
					inst.components.talker:Say(targetinlimbo_message)
				elseif not global_targetisok then
					local fail_message = "没有潜在的目标."
					inst.components.talker:Say(fail_message)
				end
			else
				if not global_magicweaponhasfuel then
					local nomagicfuel_message = "看起来像从刚果汁里跑出来一样."
					inst.components.talker:Say(nomagicfuel_message)
				end
			end
		end
		
		inst.AnimState:Show("timeline_0")
		inst.AnimState:Show("timeline_3")
		inst.AnimState:Show("timeline_15")
		inst.AnimState:Show("timeline_16")
    end,		
})

AddStategraphState("wilson", bow_attack)


local crossbow_attack = State({
    name = "crossbow",
    tags = { "attack", "notalking", "abouttoattack", "autopredict" },

    onenter = function(inst)
        local buffaction = inst:GetBufferedAction()
        local target = (buffaction ~= nil and buffaction.target) or inst.fatarget or nil
		local equip = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		local wornhat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
		local quiver = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
		local projinquiver = nil
		
		global_weapname = equip.prefab
		
		inst.components.combat:SetTarget(target)
		inst.components.locomotor:Stop()
		
		local ArrowsInInv = false
		
--		local cooldown = inst.components.combat.min_attack_period + .5 * FRAMES
		local cooldown = 50 * FRAMES
		
--		print("I am in the state and the quiver is : ", quiver)
		
		if quiver ~= nil and quiver.replica.container ~= nil then
			global_havequiver = true
			projinquiver = quiver.replica.container:GetItemInSlot(1)
		else
			global_havequiver = false
		end
		
		global_projtypeok = false
		if projinquiver ~= nil then
			global_havearrow = true
			for k, v in pairs(allowedprojcrossbow) do
--				print("Projectile in quiver (state) : ", projinquiver.prefab, "   / found : ", v)
				if projinquiver.prefab == v then
--					print("found a matching projectile in state")
					global_projtypeok = true
					break
				end
			end		
		else
			global_havearrow = false
		end
		
		if equip:HasTag("zupalexsrangedweapons") and (equip:HasTag("crossbow") or equip:HasTag("musket")) and equip:HasTag("readytoshoot") then
			global_xbowisarmed = true
		else
			global_xbowisarmed = false
		end
		
		if target ~= nil and not (target:HasTag("wall") or target:HasTag("butterfly")) then
			global_targetisok = true
		else
			global_targetisok = false
		end		
	
		if equip:HasTag("musket") then
			global_havequiver = true
			global_havearrow = true
			global_projtypeok = true
		end
	
		global_conditions_fulfilled = false	
		if global_havequiver and global_havearrow and global_targetisok and global_projtypeok and global_xbowisarmed then
			global_conditions_fulfilled = true
		end
		
--		print("Conditions status is : ", global_havequiver, "   ", global_havearrow, "   ", global_targetisok, "   ", global_projtypeok, "   => ", global_conditions_fulfilled)
		
		if not global_conditions_fulfilled then
			inst.AnimState:PlayAnimation("idle", true)
		end
			
--		print("have arrow : ", global_havearrow, "   /   target is ok : ", global_targetisok)			
			
	    if equip ~= nil and global_conditions_fulfilled then
			inst.components.combat:StartAttack()
		
--			print("And I found the BOW on the host!")
			inst.AnimState:PlayAnimation("crossbow_attack")

			if wornhat ~= nil then
				if inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_UP then
--					print("hat and face up")
					inst.AnimState:Hide("timeline_0")
				elseif inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_DOWN then
--					print("hat and face down")
					inst.AnimState:Hide("timeline_3")
				else
--					print("hat and face side")
					inst.AnimState:Hide("timeline_3")
				end
			else
				if inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_UP then
--					print("no hat and face up")
					inst.AnimState:Hide("timeline_15")
				elseif inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_DOWN then
--					print("no hat and face down")
					inst.AnimState:Hide("timeline_16")
				else
--					print("no hat and face side")
					inst.AnimState:Hide("timeline_16")
				end
			end
        end

		inst.sg:SetTimeout(cooldown)
		
        if target ~= nil and target:IsValid() then
            inst:FacePoint(target.Transform:GetWorldPosition())
            inst.sg.statemem.attacktarget = target
        end
    end,

    timeline =
    {	
		TimeEvent(0 * FRAMES, function(inst)
									if not global_conditions_fulfilled then
										inst.sg:RemoveStateTag("abouttoattack")
										inst:ClearBufferedAction()
									end
								end),
	
		TimeEvent(15 * FRAMES, function(inst)
									if not global_conditions_fulfilled then
										inst.AnimState:PlayAnimation("idle")
									end
								end),
	
		TimeEvent(18 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										if global_weapname == "crossbow" then
											inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_shoot", nil, nil, true)
										elseif global_weapname == "musket" then
											inst.SoundEmitter:PlaySound("bow_shoot/musket/shot", nil, nil, true)
										end
									end
								end),	
	
		TimeEvent(23 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										inst.sg:RemoveStateTag("abouttoattack")
										inst:PerformBufferedAction()
									end
								end),
    },

    ontimeout = function(inst)
        inst.sg:RemoveStateTag("attack")
        inst.sg:AddStateTag("idle")
		inst.fatarget = nil
    end,

    events =
    {
        EventHandler("equip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("animqueueover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },

    onexit = function(inst)
--		print("I exit the SG of the host NOW")
		inst.fatarget = nil
        inst.components.combat:SetTarget(nil)
        if inst.sg:HasStateTag("abouttoattack") then
            inst.components.combat:CancelAttack()
        end
		
		if inst.components.talker then
			if not global_havequiver then
				local noquiver_message = "我需要一个箭袋!"
				inst.components.talker:Say(noquiver_message)
			elseif not global_havearrow then
				local noammo_message = "我的箭袋空了!"
				inst.components.talker:Say(noammo_message)
			elseif not global_projtypeok then
				local badammo_message = "我当前的武器并不能使用这东西..."
				inst.components.talker:Say(badammo_message)
			elseif not global_xbowisarmed then
				local xbownotarmed_message = "如果我不拉开它， 我就射不远......"
				inst.components.talker:Say(xbownotarmed_message)
			elseif global_targetislimbo then
				local targetinlimbo_message = "现在已经太晚了..."
				inst.components.talker:Say(targetinlimbo_message)
			elseif not global_targetisok then
				local fail_message = "没有潜在的目标."
				inst.components.talker:Say(fail_message)
			end
		end
		
		inst.AnimState:Show("timeline_0")
		inst.AnimState:Show("timeline_3")
		inst.AnimState:Show("timeline_15")
		inst.AnimState:Show("timeline_16")
    end,		
})

AddStategraphState("wilson", crossbow_attack)

local crossbow_arm = State({
    name = "crossbow_arm",
    tags = { "doing", "busy" },

    onenter = function(inst)
		local equip = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		local wornhat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
		
		global_weapname = equip.prefab
		global_hasbullet = (inst.components.inventory and inst.components.inventory:Has("musket_bullet", 1 ) or inst.components.inventory:Has("musket_silverbullet", 1)) or equip:HasTag("crossbow")
		
		inst.components.locomotor:Stop()
		inst.sg.statemem.action = inst.bufferedaction
		
		global_finishedarming = false
		
		local cooldown = 130 * FRAMES
			
		if equip:HasTag("zupalexsrangedweapons") and (equip:HasTag("crossbow") or equip:HasTag("musket")) and not equip:HasTag("readytoshoot") then
			global_xbowisarmed = false
		else
			global_xbowisarmed = true
		end
			
		global_conditions_fulfilled = false	
		if not global_xbowisarmed and global_hasbullet then
			global_conditions_fulfilled = true
		end
		
--		print("Conditions status is : ", global_havequiver, "   ", global_havearrow, "   ", global_targetisok, "   ", global_projtypeok, "   => ", global_conditions_fulfilled)
		
		local playerposx, playerposy, playerposz = inst.Transform:GetWorldPosition()
		inst:ForceFacePoint(playerposx, playerposy-50, playerposz)
		
		if not global_conditions_fulfilled then
			inst.AnimState:PlayAnimation("idle", true)
		else	
			if global_weapname == "crossbow" then
				inst.AnimState:PlayAnimation("crossbow_arm")
			elseif global_weapname == "musket" then
				inst.AnimState:PlayAnimation("musket_reload")	
				inst.AnimState:OverrideSymbol("swap_mloader", "swap_mloader", "swap_mloader")
			end

			if wornhat ~= nil then
				inst.AnimState:Hide("timeline_3")
			else
				inst.AnimState:Hide("timeline_16")
			end
        end
		
		inst.sg:SetTimeout(cooldown)
    end,

    timeline =
    {	
		TimeEvent(0 * FRAMES, function(inst)
									if not global_conditions_fulfilled then
										inst:ClearBufferedAction()
									end
								end),
	
		TimeEvent(15 * FRAMES, function(inst)
									inst.sg:RemoveStateTag("busy")
									if not global_conditions_fulfilled then
										inst.AnimState:PlayAnimation("idle")
									end
								end),
	
		TimeEvent(31 * FRAMES, function(inst)
									if global_conditions_fulfilled and global_weapname == "crossbow" then
										inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_draw", nil, nil, true)
										inst.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow_armed")
									end
								end),	
	
		TimeEvent(62 * FRAMES, function(inst)
									if global_conditions_fulfilled and global_weapname == "crossbow" then
										inst:PerformBufferedAction()
										global_finishedarming = true
									end
								end),

		TimeEvent(63 * FRAMES, function(inst)
									if global_conditions_fulfilled and global_weapname == "musket" then
										inst.SoundEmitter:PlaySound("bow_shoot/musket/reload", nil, nil, true)
									end
								end),	
								
		TimeEvent(103 * FRAMES, function(inst)
									if global_conditions_fulfilled and global_weapname == "musket" then
										inst:PerformBufferedAction()
										global_finishedarming = true
									end
								end),
    },

    ontimeout = function(inst)
		inst.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow")
		owner.AnimState:ClearOverrideSymbol("swap_mloader")
        inst.sg:GoToState("idle", true)
    end,

    events =
    {
        EventHandler("equip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("animqueueover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },

    onexit = function(inst)
		inst.AnimState:ClearOverrideSymbol("swap_mloader")
		if inst.bufferedaction == inst.sg.statemem.action then
            inst:ClearBufferedAction()
        end
        inst.sg.statemem.action = nil
	
		if global_weapname == "crossbow" and not global_finishedarming and not global_xbowisarmed then
			inst.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow")
		end
	
		if inst.components.talker then
			if not global_hasbullet then
				local nobullet_message = "我没用任何东西能放进去了..."
				inst.components.talker:Say(nobullet_message)	
			elseif global_xbowisarmed and global_weapname == "crossbow" then
				local alreadyarmed_message = "如果我放继续放东西进去，它就会破裂..."
				inst.components.talker:Say(alreadyarmed_message)
			elseif global_xbowisarmed and global_weapname == "musket" then
				local alreadyarmed_message = "把他们堆起来也许不是个好主意..."
				inst.components.talker:Say(alreadyarmed_message)
			end
		end
		
		inst.AnimState:Show("timeline_0")
		inst.AnimState:Show("timeline_3")
		inst.AnimState:Show("timeline_15")
		inst.AnimState:Show("timeline_16")
    end,		
})

AddStategraphState("wilson", crossbow_arm)

local bow_attack_client = State({
        name = "bow",
        tags = { "attack", "notalking", "abouttoattack", "autopredict" },

    onenter = function(inst)
        local buffaction = inst:GetBufferedAction()
        local target = buffaction ~= nil and buffaction.target or nil
		local equip = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		local wornhat = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
		local quiver = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
		local projinquiver = nil
		
        inst.components.locomotor:Stop()
		
--		print("I am in the StateGraph for the client !")

		global_isbowmagic = false	
		global_magicweaponhasfuel = false
		
		if equip:HasTag("magic") then
			global_isbowmagic = true
			
			if equip:HasTag("hasfuel") then
				global_magicweaponhasfuel = true
			end
		end
		
		global_havequiver = false
		global_havearrow = false	
		global_projtypeok = false

--		local cooldown = inst.components.combat.min_attack_period + .5 * FRAMES
		local cooldown = 60 * FRAMES
		
--		print("I am in the state and the quiver is : ", quiver)

		if not global_isbowmagic then
			if quiver ~= nil and quiver.replica.container ~= nil then
				global_havequiver = true
				projinquiver = quiver.replica.container:GetItemInSlot(1)
			end
			
			if projinquiver ~= nil then
				global_havearrow = true
				for k, v in pairs(allowedprojbow) do
	--				print("Projectile in quiver (state) : ", projinquiver.prefab, "   / found : ", v)
					if projinquiver.prefab == v then
	--					print("found a matching projectile in state")
						global_projtypeok = true
						break
					end
				end
			end
		end
		
		if target ~= nil and not (target:HasTag("wall") or target:HasTag("butterfly")) then
			global_targetisok = true
		else
			global_targetisok = false
		end

		global_conditions_fulfilled = false
		if ((global_havequiver and global_havearrow and global_projtypeok) or (global_isbowmagic and global_magicweaponhasfuel)) and global_targetisok then
			global_conditions_fulfilled = true
		end
		
--		print("Conditions status is : ", global_havequiver, "   ", global_havearrow, "   ", global_targetisok, "   ", global_projtypeok, "   => ", global_conditions_fulfilled)
		
		if not global_conditions_fulfilled then
			inst.AnimState:PlayAnimation("idle", true)
		end
		
	    if equip ~= nil and equip:HasTag("bow") and global_conditions_fulfilled then
		    inst.replica.combat:StartAttack()
		
--			inst.AnimState:PlayAnimation("bow_attack")
			
			inst.xoffsetBS = -70
			inst.yoffsetBS = 90
			inst.zoffsetBS = 0
			
			if inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_UP then
				inst.zoffsetBS = -0.1
				if wornhat ~= nil then
--					print("hat and face up")
					inst.AnimState:Hide("timeline_0")
				else
--					print("no hat and face up")
					inst.AnimState:Hide("timeline_15")
				end
			elseif inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_DOWN then
				inst.xoffsetBS = -65
				inst.yoffsetBS = 85
				if wornhat ~= nil then
--					print("hat and face down")
					inst.AnimState:Hide("timeline_3")
				else
--				print("no hat and face down")
				inst.AnimState:Hide("timeline_16")
				end
			else
				if wornhat ~= nil then
--					print("hat and face side")
					inst.AnimState:Hide("timeline_3")
				else
--				print("no hat and face side")
				inst.AnimState:Hide("timeline_16")
				end
			end
        end

		inst.sg:SetTimeout(cooldown) 

		if buffaction ~= nil then
			inst:PerformPreviewBufferedAction()
		end
		
        if target ~= nil and target:IsValid() then
            inst:FacePoint(target.Transform:GetWorldPosition())
            inst.sg.statemem.attacktarget = target
        end
    end,

    timeline =
    {
		TimeEvent(0 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										if global_isbowmagic then
											inst.SoundEmitter:PlaySound("bow_shoot/magicbow_shoot/buzz", "buzz", nil, true)
										else
											inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_draw")
										end
									else
										inst.sg:RemoveStateTag("abouttoattack")
										inst:ClearBufferedAction()
									end
							end),	

		TimeEvent(2 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										inst.AnimState:PlayAnimation("bow_attack")
									end
							end),
							
		TimeEvent(8 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										if global_isbowmagic then
											inst.SoundEmitter:PlaySound("bow_shoot/magicbow_shoot/shot", nil, nil, true)
										else
										inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_shoot", nil, nil, true)
										end
									end
							end),	
							
		TimeEvent(14 * FRAMES, function(inst)
								if global_conditions_fulfilled then
									inst:ClearBufferedAction()
									inst.sg:RemoveStateTag("abouttoattack")
								end
							end),
							
		TimeEvent(15 * FRAMES, function(inst)
									if not global_conditions_fulfilled then
										inst.AnimState:PlayAnimation("idle")
									elseif global_isbowmagic then
										inst.SoundEmitter:KillSound("buzz")
									end
								end),
    },

    ontimeout = function(inst)
        inst.sg:RemoveStateTag("attack")
        inst.sg:AddStateTag("idle")
    end,

    events =
    {
        EventHandler("equip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("animqueueover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },

    onexit = function(inst)
        if inst.sg:HasStateTag("abouttoattack") then
            inst.replica.combat:CancelAttack()
        end
		
		if inst.components.talker then
			if not global_isbowmagic then
				if not global_havequiver then
					local noquiver_message = "我需要一个箭袋!"
					inst.components.talker:Say(noquiver_message)
				elseif not global_havearrow then
					local noammo_message = "我的箭袋空了!"
					inst.components.talker:Say(noammo_message)
				elseif not global_projtypeok then
					local badammo_message = "我当前的武器并不能使用这东西..."
					inst.components.talker:Say(badammo_message)
				elseif global_targetislimbo then
					local targetinlimbo_message = "现在已经太晚了..."
					inst.components.talker:Say(targetinlimbo_message)
				elseif not global_targetisok then
					local fail_message = "没有潜在目标."
					inst.components.talker:Say(fail_message)
				end
			else
				if not global_magicweaponhasfuel then
					local nomagicfuel_message = "就像刚从果汁里出来一样..."
					inst.components.talker:Say(nomagicfuel_message)
				end
			end
		end
		
		inst.AnimState:Show("timeline_0")
		inst.AnimState:Show("timeline_3")
		inst.AnimState:Show("timeline_15")
		inst.AnimState:Show("timeline_16")
    end,		
})

AddStategraphState("wilson_client", bow_attack_client)

local crossbow_attack_client = State({
        name = "crossbow",
        tags = { "attack", "notalking", "abouttoattack", "autopredict" },

    onenter = function(inst)
        local buffaction = inst:GetBufferedAction()
        local target = buffaction ~= nil and buffaction.target or nil
		local equip = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		local wornhat = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
		local quiver = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
		local projinquiver = nil
		
		global_weapname = equip.prefab
		
        inst.components.locomotor:Stop()
        local cooldown = 50 * FRAMES
		
--		print("I am in the StateGraph for the client !")
		
		local ArrowsInInv
		
		if quiver ~= nil and quiver.replica.container ~= nil then
			global_havequiver = true
			projinquiver = quiver.replica.container:GetItemInSlot(1)
		else
			global_havequiver = false
		end
		
		global_projtypeok = false
		if projinquiver ~= nil then
			global_havearrow = true
			for k, v in pairs(allowedprojcrossbow) do
				if projinquiver.prefab == v then
					global_projtypeok = true
					break
				end
			end
		else
			global_havearrow = false
		end
		
		if equip:HasTag("zupalexsrangedweapons") and (equip:HasTag("crossbow") or equip:HasTag("musket")) and equip:HasTag("readytoshoot") then
			global_xbowisarmed = true
		else
			global_xbowisarmed = false
		end
		
		if target ~= nil and not (target:HasTag("wall") or target:HasTag("butterfly")) then
			global_targetisok = true
		else
			global_targetisok = false
		end
		
		if equip:HasTag("musket") then
			global_havequiver = true
			global_havearrow = true
			global_projtypeok = true
		end
		
		global_conditions_fulfilled = false	
		if global_havequiver and global_havearrow and global_targetisok and global_projtypeok and global_xbowisarmed then
			global_conditions_fulfilled = true
		end
		
--		print("Conditions status is : ", global_havequiver, "   ", global_havearrow, "   ", global_targetisok, "   ", global_projtypeok, "   => ", global_conditions_fulfilled)
		
		if not global_conditions_fulfilled then
			inst.AnimState:PlayAnimation("idle", true)
		end
		
	    if equip ~= nil and global_conditions_fulfilled then
		    inst.replica.combat:StartAttack()
		
			inst.AnimState:PlayAnimation("crossbow_attack")
			
			if wornhat ~= nil then
				if inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_UP then
--					print("hat and face up")
					inst.AnimState:Hide("timeline_0")
				elseif inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_DOWN then
--					print("hat and face down")
					inst.AnimState:Hide("timeline_3")
				else
--					print("hat and face side")
					inst.AnimState:Hide("timeline_3")
				end
			else
				if inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_UP then
--					print("no hat and face up")
					inst.AnimState:Hide("timeline_15")
				elseif inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_DOWN then
--					print("no hat and face down")
					inst.AnimState:Hide("timeline_16")
				else
--					print("no hat and face side")
					inst.AnimState:Hide("timeline_16")
				end
			end
        end

		inst.sg:SetTimeout(cooldown) 

        if target ~= nil and target:IsValid() then
            inst:FacePoint(target.Transform:GetWorldPosition())
            inst.sg.statemem.attacktarget = target
        end
		
		if buffaction ~= nil then
			inst:PerformPreviewBufferedAction()
		end
    end,

    timeline =
    {
		TimeEvent(0 * FRAMES, function(inst)
									if not global_conditions_fulfilled then
										inst.sg:RemoveStateTag("abouttoattack")
										inst:ClearBufferedAction()
									end
								end),
	
		TimeEvent(15 * FRAMES, function(inst)
									if not global_conditions_fulfilled then
										inst.AnimState:PlayAnimation("idle")
									end
								end),
	
		TimeEvent(18 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										if global_weapname == "crossbow" then
											inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_shoot", nil, nil, true)
										elseif global_weapname == "musket" then
											inst.SoundEmitter:PlaySound("bow_shoot/musket/shot", nil, nil, true)
										end
									end
								end),	
	
		TimeEvent(23 * FRAMES, function(inst)
									if global_conditions_fulfilled then
									inst:ClearBufferedAction()
									inst.sg:RemoveStateTag("abouttoattack")
									end
								end),
    },

    ontimeout = function(inst)
        inst.sg:RemoveStateTag("attack")
        inst.sg:AddStateTag("idle")
    end,

    events =
    {
        EventHandler("equip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("animqueueover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },

    onexit = function(inst)
        if inst.sg:HasStateTag("abouttoattack") then
            inst.replica.combat:CancelAttack()
        end
		
		if inst.components.talker then
			if not global_havequiver then
				local noquiver_message = "我需要一个箭袋!"
				inst.components.talker:Say(noquiver_message)
			elseif not global_havearrow then
				local noammo_message = "我的箭袋空了!"
				inst.components.talker:Say(noammo_message)
			elseif not global_projtypeok then
				local badammo_message = "我当前的武器并不能使用这东西..."
				inst.components.talker:Say(badammo_message)
			elseif not global_xbowisarmed then
				local xbownotarmed_message = "如果我不拉开它， 我就射不远..."
				inst.components.talker:Say(xbownotarmed_message)
			elseif global_targetislimbo then
				local targetinlimbo_message = "已经太晚了..."
				inst.components.talker:Say(targetinlimbo_message)
			elseif not global_targetisok then
				local fail_message = "没有潜在目标."
				inst.components.talker:Say(fail_message)
			end
		end
		
		inst.AnimState:Show("timeline_0")
		inst.AnimState:Show("timeline_3")
		inst.AnimState:Show("timeline_15")
		inst.AnimState:Show("timeline_16")
    end,		
})

AddStategraphState("wilson_client", crossbow_attack_client)

local crossbow_arm_client = State({
    name = "crossbow_arm",
    tags = { "doing", "busy" },

    onenter = function(inst)
		local equip = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		local wornhat = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
		
		global_weapname = equip.prefab
		
		global_hasbullet = (inst.replica.inventory and inst.replica.inventory:Has("musket_bullet", 1 ) or inst.replica.inventory:Has("musket_silverbullet", 1)) or equip:HasTag("crossbow")
		
		inst.components.locomotor:Stop()
		inst.sg.statemem.action = inst.bufferedaction
		
		local cooldown = 130 * FRAMES
			
		global_finishedarming = false
			
		if equip:HasTag("zupalexsrangedweapons") and (equip:HasTag("crossbow") or equip:HasTag("musket")) and not equip:HasTag("readytoshoot") then
			global_xbowisarmed = false
		else
			global_xbowisarmed = true
		end
			
		global_conditions_fulfilled = false	
		if not global_xbowisarmed and global_hasbullet then
			global_conditions_fulfilled = true
		end
		
--		print("Conditions status is : ", global_havequiver, "   ", global_havearrow, "   ", global_targetisok, "   ", global_projtypeok, "   => ", global_conditions_fulfilled)
		
		local playerposx, playerposy, playerposz = inst.Transform:GetWorldPosition()
		inst:ForceFacePoint(playerposx, playerposy-50, playerposz)
		
		if not global_conditions_fulfilled then
			inst.AnimState:PlayAnimation("idle", true)
		else	
			if global_weapname == "crossbow" then
				inst.AnimState:PlayAnimation("crossbow_arm")
			elseif global_weapname == "musket" then
				inst.AnimState:PlayAnimation("musket_reload")
			end

			if wornhat ~= nil then
				inst.AnimState:Hide("timeline_3")
			else
				inst.AnimState:Hide("timeline_16")
			end
        end

		inst.sg:SetTimeout(cooldown)
		
		inst:PerformPreviewBufferedAction()
    end,

    timeline =
    {		
		TimeEvent(15 * FRAMES, function(inst)
									inst.sg:RemoveStateTag("busy")
									if not global_conditions_fulfilled then
										inst.AnimState:PlayAnimation("idle")
									end
								end),
	
		TimeEvent(31 * FRAMES, function(inst)
									if global_conditions_fulfilled and global_weapname == "crossbow" then
										inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_draw", nil, nil, true)
										inst.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow_armed")
									end
								end),	
	
		TimeEvent(62 * FRAMES, function(inst)
									if global_conditions_fulfilled and global_weapname == "crossbow" then
										inst.sg:RemoveStateTag("busy")
										global_finishedarming = true
									end
								end),
								
		TimeEvent(63 * FRAMES, function(inst)
									if global_conditions_fulfilled and global_weapname == "musket" then
										inst.SoundEmitter:PlaySound("bow_shoot/musket/reload", nil, nil, true)
									end
								end),
								
		TimeEvent(103 * FRAMES, function(inst)
									if global_conditions_fulfilled and global_weapname == "musket" then
										inst.sg:RemoveStateTag("busy")
										global_finishedarming = true
									end
								end),
    },

    ontimeout = function(inst)
        inst:ClearBufferedAction()
		if global_weapnae == "crossbow" then
			inst.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow")
		end
        inst.sg:GoToState("idle", true)
    end,

    events =
    {
        EventHandler("equip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("animqueueover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },

    onexit = function(inst)	
		local equip = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	
		if inst.components.talker then
			if not global_hasbullet then
				local nobullet_message = "我没有东西能放进去了..."
				inst.components.talker:Say(alreadyarmed_message)				
			elseif global_xbowisarmed and global_weapname == "crossbow" then
				local alreadyarmed_message = "如果我再放东西进去，它会裂开的..."
				inst.components.talker:Say(alreadyarmed_message)
			elseif global_xbowisarmed and global_weapname == "musket" then
				local alreadyarmed_message = "把它们堆起来真不是个好主意..."
				inst.components.talker:Say(alreadyarmed_message)
			end
		end
		
		if global_weapname == "crossbow" and not global_finishedarming and not global_xbowisarmed then
			inst.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow")
		end
		
		inst.AnimState:Show("timeline_0")
		inst.AnimState:Show("timeline_3")
		inst.AnimState:Show("timeline_15")
		inst.AnimState:Show("timeline_16")
    end,		
})

AddStategraphState("wilson_client", crossbow_arm_client)

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.CHANGEARROWTYPE, "doshortaction"))

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.TRANSFERCHARGETOPROJECTILE, "dolongaction"))

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.ARMCROSSBOW, function(inst, action)
																			local weapon = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
																			return ((weapon:HasTag("crossbow") or weapon:HasTag("musket")) and "crossbow_arm")
																		end
													)
)

AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.CHANGEARROWTYPE, "doshortaction"))

AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.TRANSFERCHARGETOPROJECTILE, "dolongaction"))

AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.ARMCROSSBOW, function(inst, action)
																					local weapon = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
																					return ((weapon:HasTag("crossbow") or weapon:HasTag("musket")) and "crossbow_arm")
																				end
															)
)

local function bow_attack_useitem(inst, doer, target, actions, right)
	if inst:HasTag("zupalexsrangedweapons") and inst:HasTag("electric") and inst:HasTag("discharged") and 
			target.prefab == "lightning_rod" 
			then
				if not GLOBAL.TheNet:GetIsClient()  and target.chargeleft then
					table.insert(actions, TRANSFERCHARGETOPROJECTILE)	
				elseif GLOBAL.TheNet:GetIsClient() then
					SendModRPCToServer(MOD_RPC["Archery Mod"]["RequestLightningRodChargeNum"], target, LRchargeleft)
					if target:HasTag("z_ischarged") then
						table.insert(actions, TRANSFERCHARGETOPROJECTILE)
					end
				end
	elseif inst:HasTag("bullet") and target:HasTag("musket") then
		table.insert(actions, ARMCROSSBOW)
	end
end


local function bow_attack_inventory(inst, doer, actions, right)
	local quiver = doer.replica.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
	local equiphand = doer.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	
	if inst.replica.inventoryitem ~= nil then
--		local iteminquiver = quiver.replica.container:GetItemInSlot(1)
		if quiver ~= nil and
			inst:HasTag("zupalexsrangedweapons") and (inst:HasTag("arrow") or inst:HasTag("bolt")) and
			quiver:HasTag("zupalexsrangedweapons") and quiver.replica.container~= nil
			then
				table.insert(actions, CHANGEARROWTYPE)
		elseif inst:HasTag("zupalexsrangedweapons") and (inst:HasTag("crossbow") or inst:HasTag("musket")) and inst == equiphand then
			table.insert(actions, ARMCROSSBOW)
		end
	end
end       

AddComponentAction("USEITEM", "zupalexsrangedweapons", bow_attack_useitem)
AddComponentAction("INVENTORY", "zupalexsrangedweapons", bow_attack_inventory)

GLOBAL.STRINGS.ACTIONS["ARMCROSSBOW"] = {
	XBOW = "拉开弩",
	MUSKET = "装弹",
}

if GLOBAL.FUELTYPE["ZUPALEX"] == nil then
	GLOBAL.FUELTYPE["ZUPALEX"] = "ZUPALEX"
end

AddModRPCHandler("Archery Mod", "RequestLightningRodChargeNum", function(player, inst)
																	if inst.chargeleft and not inst:HasTag("z_ischarged") then
																		inst:AddTag("z_ischarged")
																	end
																end
)

local function InvBarPostConstruct(self, owner)
	owner:DoTaskInTime(1, function()
							GLOBAL.INVINFO["ITEMSLOTSNUM"] = self.owner.replica.inventory:GetNumSlots()
							GLOBAL.INVINFO["EQUIPSLOTINFO"] = self.equipslotinfo
							GLOBAL.INVINFO["EQUIP"] = self.equip
							GLOBAL.INVINFO["INV"] = self.inv
						end
					)
end

AddClassPostConstruct("widgets/inventorybar", InvBarPostConstruct)

local function EquipSlotPostConstruct(self, equipslot, atlas, bgim, owner)
	GLOBAL.INVINFO["EQUIPSLOT_"..equipslot] = self
end

AddClassPostConstruct("widgets/equipslot", EquipSlotPostConstruct)

--------------------------------------------WILSON SG ACTIONHANDLER FOR ATTACK OVERRIDE---------------------------------------------------------------------------

local SGWils = require "stategraphs/SGwilson"
local OriginalDestStateATTACK

for k1, v1 in pairs(SGWils.actionhandlers) do
	if SGWils.actionhandlers[k1]["action"]["id"] == "ATTACK" then	
		OriginalDestStateATTACK = SGWils.actionhandlers[k1]["deststate"]
	end
end

local function NewDestStateATTACK(inst, action)
	inst.sg.mem.localchainattack = not action.forced or nil
	local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) or nil
	
	if weapon and weapon:HasTag("zupalexsrangedweapons") and not inst.components.health:IsDead() and not inst.sg:HasStateTag("attack") and inst.components.combat ~= nil then
			return (weapon:HasTag("bow") and "bow") 
				or ((weapon:HasTag("crossbow") or weapon:HasTag("musket")) and "crossbow")
	else
		return OriginalDestStateATTACK(inst, action)
	end
end

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.ATTACK, NewDestStateATTACK))
GLOBAL.package.loaded["stategraphs/SGwilson"] = nil 

--------------------------------------------WILSON_CLIENT SG ACTIONHANDLER FOR ATTACK OVERRIDE---------------------------------------------------------------------------

local SGWilsClient = require "stategraphs/SGwilson_client"
local OriginalClientDestStateATTACK

for k1, v1 in pairs(SGWilsClient.actionhandlers) do
	if SGWilsClient.actionhandlers[k1]["action"]["id"] == "ATTACK" then
		
		OriginalClientDestStateATTACK = SGWilsClient.actionhandlers[k1]["deststate"]
	end
end

local function NewClientDestStateATTACK(inst, action)
	local weapon = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) or nil
	if weapon and weapon:HasTag("zupalexsrangedweapons") and not inst.sg:HasStateTag("attack") and inst.replica.combat then
		if inst.replica.combat then
			return (weapon:HasTag("bow") and "bow") 
				or ((weapon:HasTag("crossbow") or weapon:HasTag("musket")) and "crossbow")
		end
	else
		return OriginalClientDestStateATTACK(inst, action)
	end
end

AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.ATTACK, NewClientDestStateATTACK))
GLOBAL.package.loaded["stategraphs/SGwilson_client"] = nil 

local CAtest = require "componentactions"

print(CAtest)