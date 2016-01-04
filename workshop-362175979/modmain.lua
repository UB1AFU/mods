Assets = 
{
	Asset("ATLAS", "images/mark_1.xml"),
	Asset("ATLAS", "images/mark_2.xml"),
	Asset("ATLAS", "images/mark_3.xml"),
	Asset("ATLAS", "images/mark_4.xml"),
	Asset("ATLAS", "images/mark_5.xml"),
	Asset("ATLAS", "images/mark_6.xml"),
	Asset("ATLAS", "images/mark_7.xml"),
	Asset("ATLAS", "images/mark_8.xml"),
	Asset("ATLAS", "images/mark_9.xml"),
	Asset("ATLAS", "images/mark_10.xml"),
	Asset("ATLAS", "images/mark_11.xml"),
	Asset("ATLAS", "images/mark_12.xml"),
	Asset("ATLAS", "images/mark_13.xml"),
	Asset("ATLAS", "images/mark_14.xml"),
	Asset("ATLAS", "images/mark_15.xml"),
	Asset("ATLAS", "images/mark_16.xml"),
	Asset("ATLAS", "images/mark_17.xml"),
	Asset("ATLAS", "images/mark_18.xml"),
	Asset("ATLAS", "images/mark_19.xml"),
	Asset("ATLAS", "images/mark_20.xml"),
	Asset("ATLAS", "images/mark_21.xml"),
	Asset("ATLAS", "images/mark_22.xml"),
}

AddMinimapAtlas("images/mark_1.xml")
AddMinimapAtlas("images/mark_2.xml")
AddMinimapAtlas("images/mark_3.xml")
AddMinimapAtlas("images/mark_4.xml")
AddMinimapAtlas("images/mark_5.xml")
AddMinimapAtlas("images/mark_6.xml")
AddMinimapAtlas("images/mark_7.xml")
AddMinimapAtlas("images/mark_8.xml")
AddMinimapAtlas("images/mark_9.xml")
AddMinimapAtlas("images/mark_10.xml")
AddMinimapAtlas("images/mark_11.xml")
AddMinimapAtlas("images/mark_12.xml")
AddMinimapAtlas("images/mark_13.xml")
AddMinimapAtlas("images/mark_14.xml")
AddMinimapAtlas("images/mark_15.xml")
AddMinimapAtlas("images/mark_16.xml")
AddMinimapAtlas("images/mark_17.xml")
AddMinimapAtlas("images/mark_18.xml")
AddMinimapAtlas("images/mark_19.xml")
AddMinimapAtlas("images/mark_20.xml")
AddMinimapAtlas("images/mark_21.xml")
AddMinimapAtlas("images/mark_22.xml")

local Action = GLOBAL.Action
local ActionHandler = GLOBAL.ActionHandler
local ACTIONS = GLOBAL.ACTIONS

local MARK = Action(3)
MARK.str = "Mark"
MARK.id = "MARK"
MARK.fn = function(act)
	local tar = act.target
    if tar and tar.components.teleporter and tar.components.wormhole_marks then
		if not tar.components.wormhole_marks:CheckMark() then
			tar.components.wormhole_marks:Mark()
			local other = tar.components.teleporter.targetTeleporter
			other.components.wormhole_marks:MarkExit()
			return true
		end
    end
end

AddAction(MARK)

AddStategraphActionHandler("wilson", ActionHandler(MARK, "give"))

AddStategraphActionHandler("wilson_client", ActionHandler(MARK, "give"))

AddComponentAction("SCENE", "wormhole_marks", function(inst, doer, actions, right)
    if inst and right and not inst:HasTag("marked") then
				table.insert(actions, GLOBAL.ACTIONS.MARK)
	end
end)

function WormholePrefabPostInit(inst)
	if not inst.components.wormhole_marks then
		inst:AddComponent("wormhole_marks")
	end
end

AddPrefabPostInit("wormhole", WormholePrefabPostInit)

function ForestPrefabPostInit(inst)
	inst:AddComponent("wormhole_counter")
end

if GLOBAL.TheNet:GetIsServer() then
	AddPrefabPostInit("forest", ForestPrefabPostInit)
end