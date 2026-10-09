---@meta _
---@class Core.Spells
---@field GetOverrides fun(self: Core.Spells, spellIdentifier: string|number): number[]
---@field GetBaseSpell fun(self: Core.Spells, spellIdentifier: string|number): number|nil
---@field GetInfo fun(self: Core.Spells, spellIdentifier: string|number): Core.SpellInfo|nil
Core.Spells = Core.Spells or {}

---@class Core.SpellInfo: SpellInfo
---@field IsHelpful fun(self: Core.SpellInfo): boolean
---@field IsHarmful fun(self: Core.SpellInfo): boolean
Core.SpellInfo = Core.SpellInfo or {}
Core.SpellInfo.__index = Core.SpellInfo

---@return boolean
function Core.SpellInfo:IsHelpful()
	return Core.Spells:IsHelpful(self.spellID)
end

---@return boolean
function Core.SpellInfo:IsHarmful()
	return Core.Spells:IsHarmful(self.spellID)
end

local function ExtendSpellInfo(info)
	if type(info) == "table" then
		setmetatable(info, Core.SpellInfo)
	end
	return info
end

local spellcache = setmetatable({}, {
	__index = function(cache, spellIdentifier)
		if not (C_Spell and C_Spell.GetSpellInfo) then
			return
		end

		local ok, info = pcall(C_Spell.GetSpellInfo, spellIdentifier)
		if ok and info then
			info = ExtendSpellInfo(info)
			cache[spellIdentifier] = info
			return info
		end
	end,
})

---@param spellIdentifier string|number
---@return Core.SpellInfo|nil
function Core.Spells:GetInfo(spellIdentifier)
	return spellcache[spellIdentifier]
end


---@param spellIdentifier string|number
---@return number[]
function Core.Spells:GetOverrides(spellIdentifier)
	local overrides = {}
	local seen = {}
	local auraOverride
	if spellIdentifier then
		auraOverride = Core.Spells.AuraOverrides
			and Core.Spells.AuraOverrides[spellIdentifier]
	end

	if auraOverride then
		table.insert(overrides, auraOverride)
		seen[auraOverride] = true
	end

	if spellIdentifier and C_Spell and C_Spell.GetOverrideSpell then
		local ok, overrideID = pcall(C_Spell.GetOverrideSpell, spellIdentifier)
		if ok and overrideID and overrideID > 0 and overrideID ~= spellIdentifier and not seen[overrideID] then
			table.insert(overrides, overrideID)
		end
	end

	return overrides
end

---@param spellIdentifier string|number
---@return number|nil
function Core.Spells:GetBaseSpell(spellIdentifier)
	if not spellIdentifier then return end

	for baseSpellID, auraSpellID in pairs(Core.Spells.AuraOverrides or {}) do
		if auraSpellID == spellIdentifier then
			return baseSpellID
		end
	end

	if C_Spell and C_Spell.GetBaseSpell then
		local ok, baseSpellID = pcall(C_Spell.GetBaseSpell, spellIdentifier)
		if ok and baseSpellID and baseSpellID > 0 and baseSpellID ~= spellIdentifier then
			return baseSpellID
		end
	end
end

--- func desc
---@param spellIdentifier string|number spellID or spellName
---@return boolean
function Core.Spells:IsHelpful(spellIdentifier)
    if C_Spell and C_Spell.IsSpellHelpful then
        local ok, result = pcall(C_Spell.IsSpellHelpful, spellIdentifier)
        if ok then return result end
    end

    return false
end


--- func desc
---@param spellIdentifier string|number spellID or spellName
---@return boolean
function Core.Spells:IsHarmful(spellIdentifier)
    if C_Spell and C_Spell.IsSpellHarmful then
        local ok, result = pcall(C_Spell.IsSpellHarmful, spellIdentifier)
        if ok then return result end
    end

    return false
end
