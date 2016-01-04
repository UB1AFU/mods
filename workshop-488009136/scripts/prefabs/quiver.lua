local assets=
{
    Asset("ANIM", "anim/bow.zip"),
    Asset("ANIM", "anim/swap_quiver.zip"),
	 

    Asset("ATLAS", "images/inventoryimages/quiver.xml"),
    Asset("IMAGE", "images/inventoryimages/quiver.tex"),
	
	Asset("ANIM", "anim/ui_quiver_1x1.zip"),
}
prefabs = {
}

-------------------------------------------------------------QUIVER --------------------------------------------------------

local containers = require "containers"
local prev_widgetsetup=containers.widgetsetup
 
local function mywidgetsetup(container, prefab, data)
    local t = data or params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
    end
end

local quiverwidgetparams =
	{
		widget =
		{
			slotpos = {Vector3(0, -5, 0)},
			animbank = "ui_quiver_1x1",
			animbuild = "ui_quiver_1x1",
			pos = Vector3(0, 0, 0),
--			pos = Vector3(-140, -280, 0),
		},
		issidewidget = false,
		type = "quiver",
	}

function quiverwidgetparams.itemtestfn(container, item, slot)
		if item:HasTag("zupalexsrangedweapons") and (item:HasTag("arrow") or item:HasTag("bolt")) then 
			return true
		else
			return false
		end
end

local function OpenQuiver(self, doer)
	if self.opener == nil and doer ~= nil then	
		self.inst:StartUpdatingComponent(self)

		local inventory = doer.components.inventory
		if inventory ~= nil then
			for k, v in pairs(inventory.opencontainers) do
				if k.prefab == self.inst.prefab or k.components.container.type == self.type then
					k.components.container:Close()
				end
			end

			inventory.opencontainers[self.inst] = true
		end

		self.opener = doer

		if doer.HUD ~= nil then
			local playercontainers = doer.HUD.controls.containers
			local quiverwidget = nil
					
			local hudscaleadjust = Profile:GetHUDSize()*2
			local qs_pos = INVINFO.EQUIPSLOT_quiver:GetWorldPosition()
		
			doer.HUD:OpenContainer(self.inst, self:IsSideWidget())
			TheFocalPoint.SoundEmitter:PlaySound("dontstarve/wilson/backpack_open", "open")
			
			if playercontainers then
				for k, v in pairs(playercontainers) do
					if v.container == self.inst then
						quiverwidget = v
					end
				end
			end
			
			if quiverwidget ~= nil then
				if quiverwidget.QuiverHasAnchor == nil then
					quiverwidget.QuiverHasAnchor = true
					
					quiverwidget:SetVAnchor(ANCHOR_BOTTOM)
					quiverwidget:SetHAnchor(ANCHOR_LEFT)
				end
				
				quiverwidget:UpdatePosition(qs_pos.x, (qs_pos.y+60+hudscaleadjust))			
			end
		end
		
		self.inst:PushEvent("onopen", { doer = doer })

		if self.onopenfn ~= nil then
			self.onopenfn(self.inst)
		end
	end
end

local function OpenQuiverClient(self, doer)
    if self.inst.components.container ~= nil then
        if self.opentask ~= nil then
            self.opentask:Cancel()
            self.opentask = nil
        end
        self.inst.components.container:Open(doer)
    elseif self.classified ~= nil and
        self.opentask == nil and
        doer ~= nil and
        doer == ThePlayer then
        if doer.HUD == nil then
            self._isopen = false
        elseif not self._isopen then
            doer.HUD:OpenContainer(self.inst, self:IsSideWidget())
            TheFocalPoint.SoundEmitter:PlaySound("dontstarve/wilson/backpack_open", "open")
			
			local playercontainers = doer.HUD.controls.containers
			local quiverwidget = nil
				
			local hudscaleadjust = Profile:GetHUDSize()*2
			local qs_pos = INVINFO.EQUIPSLOT_quiver:GetWorldPosition()
			
			-- print("hudscale : ", hudscaleadjust)
			-- print("qs_pos : ", qs_pos.x, "  /  ", qs_pos.y)
			
			if playercontainers then
				for k, v in pairs(playercontainers) do
					if v.container == self.inst then
						quiverwidget = v
					end
				end
			end
			
			if quiverwidget ~= nil then
				if quiverwidget.QuiverHasAnchor == nil then
					quiverwidget.QuiverHasAnchor = true
					
					quiverwidget:SetVAnchor(ANCHOR_BOTTOM)
					quiverwidget:SetHAnchor(ANCHOR_LEFT)
				end
				
				quiverwidget:UpdatePosition(qs_pos.x, (qs_pos.y+60+hudscaleadjust))			
			end
			
            self._isopen = true
        end
    end
end

local function OnEquipQuiver(inst, owner)
	owner.AnimState:OverrideSymbol("swap_body", "swap_quiver", "backpack")
	
	owner.AnimState:OverrideSymbol("swap_body", "swap_quiver", "swap_body")
	
	if inst.components.container ~= nil then
        inst:DoTaskInTime(1, function() 
								inst.components.container:Open(owner) 
								inst._widgetupdate:set(true)
							end
						)
    end
	
	local equiphand = owner.components.inventory and owner.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)

	if equiphand == nil or not equiphand:HasTag("zupalexsrangedweapons") or not equiphand:HasTag("usequiverproj") then
		return
	end
	
	local projinquiver = inst.components.container:GetItemInSlot(1)
	if projinquiver == nil or not projinquiver:HasTag("zupalexsrangedweapons") then
		return
	end
	
	equiphand.components.weapon:SetProjectile(projinquiver.prefab)	
end
 
local function OnUnequipQuiver(inst, owner)
	inst._widgetupdate:set(false)

    owner.AnimState:ClearOverrideSymbol("swap_body")
	if inst.components.container ~= nil then
        inst.components.container:Close(owner)
    end
end

local function OnWidgetUpdate(inst)
    if inst._widgetupdate:value() ~= inst._clientwidgetupdate then
        inst._clientwidgetupdate = inst._widgetupdate:value()
		containers.widgetsetup = mywidgetsetup
        inst.replica.container:WidgetSetup(inst.prefab, quiverwidgetparams)
		containers.widgetsetup = prev_widgetsetup
		inst.replica.container.Open = OpenQuiverClient
    end
end

local function OnQuiverGetItem(inst, data)
	inst:DoTaskInTime(FRAMES, function()
								local owner = inst.components.inventoryitem and inst.components.inventoryitem.owner
								if owner == nil then
									OnQuiverGetItem(inst, data)
									return
								end
								
								local equiphand = owner.components.inventory and owner.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
								if equiphand == nil or not equiphand:HasTag("zupalexsrangedweapons") or not equiphand:HasTag("usequiverproj") or not data.item:HasTag("zupalexsrangedweapons") then
									return
								end
								
								equiphand.components.weapon:SetProjectile(data.item.prefab)																
							end
	)
end

local function quiverfn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
     
    anim:SetBank("quiver")
    anim:SetBuild("swap_quiver")
    anim:PlayAnimation("anim")
 
	inst:AddTag("quiver") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	
	inst._widgetupdate = net_bool(inst.GUID, "_widgetupdate", "onwidgetupdate")
	
 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then	
		inst._clientwidgetupdate = false
		inst:ListenForEvent("onwidgetupdate", OnWidgetUpdate)
        return inst
    end
----------------------------------------------------------------
	
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.cangoincontainer = false
    inst.components.inventoryitem.imagename = "quiver"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/quiver.xml"
	
	inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.QUIVER
	inst.components.equippable:SetOnEquip( OnEquipQuiver )
	inst.components.equippable:SetOnUnequip( OnUnequipQuiver )
	
	inst:AddComponent("container")
	containers.widgetsetup = mywidgetsetup
    inst.components.container:WidgetSetup(inst.prefab, quiverwidgetparams)
	containers.widgetsetup = prev_widgetsetup
	inst.components.container.Open = OpenQuiver
	
	inst:AddComponent("zupalexsrangedweapons")
	
	inst:ListenForEvent("itemget", OnQuiverGetItem)

    MakeHauntableLaunch(inst)

	return inst
end


return  Prefab("common/inventory/quiver", quiverfn, assets, prefabs)