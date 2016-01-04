local function mark(self, marked)
    if marked then
        self.inst:AddTag("marked")
    else
        self.inst:RemoveTag("marked")
    end
end

local Wormhole_Marks = Class(function(self, inst)
    self.inst = inst
	self.marked = false
	self.wormhole_number = nil
end,
nil,
{
    marked = mark,
})

function Wormhole_Marks:Mark()
	self:GetNumber()
	if self.wormhole_number <= 22 then 
		self.marked = true
		self.inst.MiniMapEntity:SetDrawOverFogOfWar(true)
		self.inst.MiniMapEntity:SetIcon("mark_"..self.wormhole_number..".tex")
		local gamemode = TheNet:GetServerGameMode()
		if gamemode == "wilderness" then
			self.inst:DoTaskInTime(0, function() self.inst.MiniMapEntity:SetDrawOverFogOfWar(false) end)
		end		
	end
end

function Wormhole_Marks:MarkExit()
	self:GetNumber()
	if self.wormhole_number <= 22 then 
		self.marked = true
		self.inst.MiniMapEntity:SetDrawOverFogOfWar(true)
		self.inst.MiniMapEntity:SetIcon("mark_"..self.wormhole_number..".tex")
		local gamemode = TheNet:GetServerGameMode()
		if gamemode == "wilderness" then
			self.inst:DoTaskInTime(0, function() self.inst.MiniMapEntity:SetDrawOverFogOfWar(false) end)
		end
		TheWorld.components.wormhole_counter:Set()
	end
end

function Wormhole_Marks:GetNumber()
	self.wormhole_number = TheWorld.components.wormhole_counter:Get()
end

function Wormhole_Marks:CheckMark()
	return self.marked
end

function Wormhole_Marks:OnSave()
	local data = {}
	data.marked = self.marked
	data.wormhole_number = self.wormhole_number
	return data
end

function Wormhole_Marks:OnLoad(data)
	if data then
		self.marked = data.marked
		self.wormhole_number = data.wormhole_number
		if self.marked and self.wormhole_number then
			self.inst.MiniMapEntity:SetDrawOverFogOfWar(true)
			self.inst.MiniMapEntity:SetIcon("mark_"..self.wormhole_number..".tex")
			local gamemode = TheNet:GetServerGameMode()
			if gamemode == "wilderness" then
				self.inst:DoTaskInTime(0, function() self.inst.MiniMapEntity:SetDrawOverFogOfWar(false) end)
			end
		end
	else
		self.marked = false
		self.wormhole_number = 0
	end
end

return Wormhole_Marks