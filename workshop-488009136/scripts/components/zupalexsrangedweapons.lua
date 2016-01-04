--Update inventoryitem_replica constructor if any more properties are added

local function onattackrange(self, attackrange)
    if self.inst.replica.inventoryitem ~= nil then
        self.inst.replica.inventoryitem:SetAttackRange(attackrange)
    end
end

local Zupalexsrangedweapons = Class(function(self, inst)
    self.inst = inst
	self.arrowbasedamage = 0
	self.owner = nil
	self.allowedprojectiles ={}
	self.cooldowntime = nil
	self.fueledby = nil
	self.targx = nil
	self.targy = nil
	self.targz = nil
	
	self.lastattacktime = nil
	
	self.onarmedfn = nil
	
    --Monkey uses these
    self.modes = nil
    self.variedmodefn = nil

    self.inst:AddTag("zupalexsrangedweapons")
end,
nil,
{
    attackrange = onattackrange,
})
	
function Zupalexsrangedweapons:OnRemoveFromEntity()
    if self.inst.replica.inventoryitem ~= nil then
        self.inst.replica.inventoryitem:SetAttackRange(-1)
    end
end

function Zupalexsrangedweapons:SetOnArmedFn(onarmedfn)
	self.onarmedfn = onarmedfn
end

function Zupalexsrangedweapons:OnArmed(armer, projtouse)
	if self.onarmedfn then
		self.onarmedfn(self.inst, armer, projtouse)
	end
end

function Zupalexsrangedweapons:SetTargetPosition(x, y, z)
	self.targx = x
	self.targy = y
	self.targz = z	
end

function Zupalexsrangedweapons:GetTargetPosition()
	return self.targx, self.targy, self.targz
end

function Zupalexsrangedweapons:GetArrowBaseDamage()
	if self.inst.prefab == "arrow" then
		return TUNING.BOWDMG
	elseif self.inst.prefab == "goldarrow" then
		return TUNING.BOWDMG*TUNING.GOLDARROWDMGMOD
	elseif self.inst.prefab == "moonstonearrow" then
		return TUNING.BOWDMG*TUNING.MOONSTONEARROWDMGMOD
	elseif self.inst.prefab == "firearrow" then
		return TUNING.BOWDMG*(TUNING.FIREARROWDMGMOD/2.0)
	elseif self.inst.prefab == "icearrow" then
		return TUNING.BOWDMG*TUNING.ICEARROWDMGMOD
	elseif self.inst.prefab == "thunderarrow" or self.inst.prefab == "dischargedthunderarrow" then
		return TUNING.BOWDMG*TUNING.THUNDERARROWDMGMOD
	elseif self.inst.prefab == "bolt" then
		return TUNING.BOWDMG*TUNING.CROSSBOWDMGMOD
	elseif self.inst.prefab == "poisonbolt" then
		return TUNING.BOWDMG*TUNING.CROSSBOWDMGMOD*0.15
	elseif self.inst.prefab == "explosivebolt" then
		return 10
	elseif self.inst.prefab == "shadowarrow" then
		return TUNING.BOWDMG*TUNING.MAGICBOWDMGMOD
	elseif self.inst.prefab == "lightarrow" then
		return TUNING.BOWDMG*TUNING.MAGICBOWDMGMOD
	elseif self.inst.prefab == "healingarrow" then
		return 0
	elseif self.inst.prefab == "musket_bullet" then
		return TUNING.BOWDMG*TUNING.MUSKETDMGMOD
	end
end

function Zupalexsrangedweapons:SetAllowedProjectiles(projlist)
	self.allowedprojectiles = projlist
end

function Zupalexsrangedweapons:AddAllowedProjectiles(projname)
	table.insert(self.allowedprojectiles, projname)
end

function Zupalexsrangedweapons:GetBasicAmmo()
	if self.inst:HasTag("arrow") then
		if self.inst:HasTag("golden") then
			return string.lower("goldarrow")
		elseif self.inst:HasTag("moonstone") then
			return string.lower("moonstonearrow")
		elseif self.inst:HasTag("electric") then
			return string.lower("dischargedthunderarrow")
		else
			return string.lower("arrow")
		end
	elseif self.inst:HasTag("bolt") then
		if self.inst:HasTag("poison") then
			return string.lower("poisonbolt")
		else
			return string.lower("bolt")
		end
	end
end

function Zupalexsrangedweapons:SetCooldownTime(cdtime)
	self.cooldowntime = cdtime
end

function Zupalexsrangedweapons:GetCooldownTime()
	return self.cooldowntime
end

function Zupalexsrangedweapons:GetMissChance()
	if self.inst:HasTag("arrow") then
		return TUNING.BOWMISSCHANCESMALL, TUNING.BOWMISSCHANCEBIG
	elseif self.inst:HasTag("bolt") then
		return TUNING.BOWMISSCHANCESMALL*TUNING.CROSSBOWACCMOD, TUNING.BOWMISSCHANCEBIG*TUNING.CROSSBOWACCMOD
	elseif self.inst:HasTag("bullet") then
		return TUNING.BOWMISSCHANCESMALL*TUNING.MUSKETACCMOD, TUNING.BOWMISSCHANCEBIG*TUNING.MUSKETACCMOD
	end
end

function Zupalexsrangedweapons:GetRecChance(hit)
	local RecChance

	if hit then
		RecChance = TUNING.HITREC
	else
		RecChance = TUNING.MISSREC
	end

	if self.inst:HasTag("arrow") then
		if self.inst:HasTag("golden") then
			return (RecChance*TUNING.GOLDARROWRECCHANCEMOD)
		elseif self.inst:HasTag("moonstone") then
			return 0.995
		else
			return RecChance
		end
	elseif self.inst:HasTag("bolt") then
		return RecChance
	end
end

function Zupalexsrangedweapons:SetFueledBy(itemprefab)
	self.fueledby = itemprefab
end

function Zupalexsrangedweapons:OnSave()

end

function Zupalexsrangedweapons:OnLoad(data)

end

return Zupalexsrangedweapons