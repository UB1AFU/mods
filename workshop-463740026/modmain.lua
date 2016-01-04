PrefabFiles = {
	"personal_chester_eyebone",
	"personal_chester",
}


local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- Custom items
STRINGS.NAMES.PERSONAL_CHESTER = "切斯特箱子"
STRINGS.NAMES.PERSONAL_CHESTER_EYEBONE = "切斯特骨眼)"

local ownership = GetModConfigData("ownership")

-- An eyebone is given every time player is spawned/loaded. It's not saved
local function GiveEyebone(inst)
	local eyebone = GLOBAL.SpawnPrefab("personal_chester_eyebone")
	if eyebone then
		eyebone.owner = inst
		inst.eyebone = eyebone
		inst.components.inventory.ignoresound = true
		inst.components.inventory:GiveItem(eyebone)
		inst.components.inventory.ignoresound = false
		eyebone.components.named:SetName(inst.name.."'s Eye Bone")
		eyebone.ownership = ownership
	return eyebone
	end
end
local function GetSpawnPoint(pt)
	local theta = math.random() * 2 * GLOBAL.PI
	local radius = 4
	local offset = GLOBAL.FindWalkableOffset(pt, theta, radius, 12, true)
	return offset ~= nil and (pt + offset) or nil
end
local function PersonalChester(inst)
	if not GLOBAL.TheWorld.ismastersim or inst:HasTag("specialchesterowner") then
		return
	end

	local OnDespawn_prev = inst.OnDespawn
	local OnDespawn_new = function(inst)
		-- Remove chester
		if inst.chester then
			-- Don't allow chester to despawn with irreplaceable items
			inst.chester.components.container:DropEverythingWithTag("irreplaceable")
			
			-- We need time to save before despawning.
			inst.chester:DoTaskInTime(0.1, function(inst)
				if inst and inst:IsValid() then
					inst:Remove()
				end
			end)
			
		end
		
		if inst.eyebone then
			-- Eyebone drops from whatever its in
			local owner = inst.eyebone.components.inventoryitem.owner
			if owner then
				-- Remember if eyebone is held
				if owner == inst or (owner.components.inventoryitem and owner.components.inventoryitem.owner == inst) then
					inst.eyebone.isheld = true
				else
					inst.eyebone.isheld = false
				end
				if owner.components.container then
					owner.components.container:DropItem(inst.eyebone)
				elseif owner.components.inventory then
					owner.components.inventory:DropItem(inst.eyebone)
				end
			end
			-- Remove eyebone
			inst.eyebone:DoTaskInTime(0.1, function(inst)
				if inst and inst:IsValid() then
					inst:Remove()
				end
			end)
		else
			print("Error: Player has no linked eyebone!")
		end
		if OnDespawn_prev then
			return OnDespawn_prev(inst)
		end
	end
	inst.OnDespawn = OnDespawn_new
	
	local OnSave_prev = inst.OnSave
	local OnSave_new = function(inst, data)
		local references = OnSave_prev(inst, data)
		if inst.chester then
			-- Save chester
			local refs = {}
			if not references then
				references = {}
			end
			data.chester, refs = inst.chester:GetSaveRecord()
			if refs then
				for k,v in pairs(refs) do
					table.insert(references, v)
				end 
			end				
		end
		if inst.eyebone then
			-- Save eyebone
			local refs = {}
			if not references then
				references = {}
			end
			data.eyebone, refs = inst.eyebone:GetSaveRecord()
			if refs then
				for k,v in pairs(refs) do
					table.insert(references, v)
				end 
			end
			-- Remember if was holding eyebone
			if inst.eyebone.isheld then
				data.holdingeyebone = true
			else
				data.holdingeyebone = false
			end
		end
		return references
	end
    inst.OnSave = OnSave_new
	
	local OnLoad_prev = inst.OnLoad
	local OnLoad_new = function(inst, data, newents)
		if data.chester ~= nil then
			-- Load chester
			inst.chester = GLOBAL.SpawnSaveRecord(data.chester, newents)
		else
			--print("Warning: No chester was loaded from save file!")
		end
		
		if data.eyebone ~= nil then
			-- Load chester
			inst.eyebone = GLOBAL.SpawnSaveRecord(data.eyebone, newents)
			
			-- Look for eyebone at spawn point and re-equip
			inst:DoTaskInTime(0, function(inst)
				if data.holdingeyebone or (inst.eyebone and inst:IsNear(inst.eyebone,4)) then
					--inst.components.inventory:GiveItem(inst.eyebone)
					inst:ReturnEyebone()
				end
			end)
		else
			print("Warning: No eyebone was loaded from save file!")
		end
		
		-- Create new eyebone if none loaded
		if not inst.eyebone then
			GiveEyebone(inst)
		end
		
		inst.eyebone.owner = inst
		inst.eyebone.ownership = ownership
		
		if OnLoad_prev then
			return OnLoad_prev(inst, data, newents)
		end
	end
    inst.OnLoad = OnLoad_new
	
	local OnNewSpawn_prev = inst.OnNewSpawn
	local OnNewSpawn_new = function(inst)
		-- Give new eyebone. Let chester spawn naturally.
		GiveEyebone(inst)
		if OnNewSpawn_prev then
			return OnNewSpawn_prev(inst)
		end
	end
    inst.OnNewSpawn = OnNewSpawn_new
	
	if GLOBAL.TheNet:GetServerGameMode() == "wilderness" then
		local function ondeath(inst, data)
			-- Kill player's chester in wilderness mode :(
			if inst.chester then
				inst.chester.components.health:Kill()
			end
			if inst.eyebone then
				inst.eyebone:Remove()
			end
		end
		inst:ListenForEvent("death", ondeath)
	end
	
	-- Debug function to return eyebone
	inst.ReturnEyebone = function()
		if inst.eyebone and inst.eyebone:IsValid() then
			if inst.eyebone.components.inventoryitem.owner ~= inst then
				inst.components.inventory:GiveItem(inst.eyebone)
			end
		else
			GiveEyebone(inst)
		end
		if inst.chester and not inst:IsNear(inst.chester, 20) then
			local pt = inst:GetPosition()
			local spawn_pt = GetSpawnPoint(pt)
			if spawn_pt ~= nil then
				inst.chester.Physics:Teleport(spawn_pt:Get())
				inst.chester:FacePoint(pt:Get())
			end
		end
	end
end

GLOBAL.c_returneyebone = function(inst)
	if not inst then
		inst = GLOBAL.ThePlayer or GLOBAL.AllPlayers[1]
	end
	if not inst or not inst.ReturnEyebone then 
		print("Error: Cannot return eyebone")
		return 
	end
	inst:ReturnEyebone()
end

AddPlayerPostInit(PersonalChester)