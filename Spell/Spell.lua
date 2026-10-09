---@meta _
---@class Core.Spell
---@field GetOverrides fun(self: Core.Spell, spellIdentifier: string|number): number[]
---@field GetBaseSpell fun(self: Core.Spell, spellIdentifier: string|number): number|nil
---@field GetInfo fun(self: Core.Spell, spellIdentifier: string|number): SpellInfo|nil
Core.Spell = Core.Spell or {}

local spellcache = setmetatable({}, {
	__index = function(cache, spellIdentifier)
		if not (C_Spell and C_Spell.GetSpellInfo) then
			return
		end

		local ok, info = pcall(C_Spell.GetSpellInfo, spellIdentifier)
		if ok and info then
			cache[spellIdentifier] = info
			return info
		end
	end,
})

---@param spellIdentifier string|number
---@return SpellInfo|nil
function Core.Spell:GetInfo(spellIdentifier)
	return spellcache[spellIdentifier]
end


---@param spellIdentifier string|number
---@return number[]
function Core.Spell:GetOverrides(spellIdentifier)
	local overrides = {}
	local seen = {}
	local auraOverride
	if spellIdentifier then
		auraOverride = Core.Spell.AuraOverrides
			and Core.Spell.AuraOverrides[spellIdentifier]
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
function Core.Spell:GetBaseSpell(spellIdentifier)
	if not spellIdentifier then return end

	for baseSpellID, auraSpellID in pairs(Core.Spell.AuraOverrides or {}) do
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
