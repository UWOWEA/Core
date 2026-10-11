---@meta _

--- Explicit SpellInfo proxies for C_Spell APIs that accept a spell identifier.

---@return any, any, any, any
local function CallSpellAPI(methodName, spellID, ...)
    local method = C_Spell and C_Spell[methodName]
    if type(method) ~= "function" then
        return
    end

    return method(spellID, ...)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.CancelSpellByID)
---@param self Core.SpellInfo
function Core.SpellInfo:CancelSpellByID()
    return CallSpellAPI("CancelSpellByID", self.spellID)
end

---Returns true if the spell exists, regardless of whether the player has learned it
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.DoesSpellExist)
---@return boolean spellExists
---@param self Core.SpellInfo
function Core.SpellInfo:DoesSpellExist()
    return CallSpellAPI("DoesSpellExist", self.spellID)
end

---Used in conjunction with SpellRangeCheckUpdate to inform the UI when a spell goes in or out of range with the current target.
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.EnableSpellRangeCheck)
---@param enable boolean
---@param self Core.SpellInfo
function Core.SpellInfo:EnableSpellRangeCheck(enable)
    return CallSpellAPI("EnableSpellRangeCheck", self.spellID, enable)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetAuraStatChanges)
---@return number healthChange
---@return PowerTypeChange[] powerTypeChanges
---@param self Core.SpellInfo
function Core.SpellInfo:GetAuraStatChanges()
    return CallSpellAPI("GetAuraStatChanges", self.spellID)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetDeadlyDebuffInfo)
---@return DeadlyDebuffInfo deadlyDebuffInfo
---@param self Core.SpellInfo
function Core.SpellInfo:GetDeadlyDebuffInfo()
    return CallSpellAPI("GetDeadlyDebuffInfo", self.spellID)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetItemModifiedAppearancesApplied)
---@return number[] itemModifiedAppearanceIDs
---@param self Core.SpellInfo
function Core.SpellInfo:GetItemModifiedAppearancesApplied()
    return CallSpellAPI("GetItemModifiedAppearancesApplied", self.spellID)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetMawPowerBorderAtlasBySpellID)
---@return textureAtlas rarityBorderAtlas
---@param self Core.SpellInfo
function Core.SpellInfo:GetMawPowerBorderAtlasBySpellID()
    return CallSpellAPI("GetMawPowerBorderAtlasBySpellID", self.spellID)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetMawPowerLinkBySpellID)
---@return string link
---@param self Core.SpellInfo
function Core.SpellInfo:GetMawPowerLinkBySpellID()
    return CallSpellAPI("GetMawPowerLinkBySpellID", self.spellID)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetOverrideSpell)
---@param spec? number Default = 0
---@param onlyKnown? boolean Default = true
---@param ignoreOverrideSpellID? number Default = 0
---@return number overrideSpellID
---@param self Core.SpellInfo
function Core.SpellInfo:GetOverrideSpell(spec, onlyKnown, ignoreOverrideSpellID)
    return Core.Spells:GetOverrideSpell(self.spellID, spec, onlyKnown, ignoreOverrideSpellID)
end

---Returns nil if spell is not found
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellAutoCast)
---@return boolean autoCastAllowed
---@return boolean autoCastEnabled
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellAutoCast()
    return CallSpellAPI("GetSpellAutoCast", self.spellID)
end

---Returns number of times a spell can be cast, typically based on availability of things like required reagent items; Returns 0 if spell is not found
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellCastCount)
---@return number castCount
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellCastCount()
    return CallSpellAPI("GetSpellCastCount", self.spellID)
end

---Returns a duration object describing the active recharge time for a spell.
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellChargeDuration)
---@return LuaDurationObject duration
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellChargeDuration()
    return CallSpellAPI("GetSpellChargeDuration", self.spellID)
end

---Returns a table of info about the charges of a charge-accumulating spell; May return nil if spell is not found or is not charge-based
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellCharges)
---@return SpellChargeInfo chargeInfo
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellCharges()
    return CallSpellAPI("GetSpellCharges", self.spellID)
end

---Returns nil if spell is not found
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellCooldown)
---@return SpellCooldownInfo spellCooldownInfo
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellCooldown()
    return CallSpellAPI("GetSpellCooldown", self.spellID)
end

---Returns a duration object describing the active cooldown duration for a spell.
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellCooldownDuration)
---@return LuaDurationObject duration
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellCooldownDuration()
    return CallSpellAPI("GetSpellCooldownDuration", self.spellID)
end

---Returns nil if spell is not found
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellDescription)
---@return string description
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellDescription()
    return CallSpellAPI("GetSpellDescription", self.spellID)
end

---Depending on the spell, return a string that is either the use count or number of charges. If value is beyond the display count parameter, returns the replacementString (defaults to '*').
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellDisplayCount)
---@param maxDisplayCount? number Default = 9999
---@param replacementString? string Default = *
---@return string displayCount
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellDisplayCount(maxDisplayCount, replacementString)
    return CallSpellAPI("GetSpellDisplayCount", self.spellID, maxDisplayCount, replacementString)
end

---Meant primarily for getting a spell id from a spell name or link; Returns nothing if spell does not exist
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellIDForSpellIdentifier)
---@return number spellID
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellIDForSpellIdentifier()
    return CallSpellAPI("GetSpellIDForSpellIdentifier", self.spellID)
end

---Returns nil if spell is not found
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellInfo)
---@return SpellInfo spellInfo
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellInfo()
    return CallSpellAPI("GetSpellInfo", self.spellID)
end

---Returns the level the spell is learned at; May return a different value if the player is currently Level Linked with another player
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellLevelLearned)
---@return number levelLearned
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellLevelLearned()
    return CallSpellAPI("GetSpellLevelLearned", self.spellID)
end

---Returns nil if spell is not found
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellLink)
---@param glyphID? number
---@return string spellLink
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellLink(glyphID)
    return CallSpellAPI("GetSpellLink", self.spellID, glyphID)
end

---Returns nil if spell is not found
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellLossOfControlCooldown)
---@return number startTime
---@return number duration
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellLossOfControlCooldown()
    return CallSpellAPI("GetSpellLossOfControlCooldown", self.spellID)
end

---Returns a duration object describing the active loss of control cooldown duration for a spell.
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellLossOfControlCooldownDuration)
---@return LuaDurationObject duration
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellLossOfControlCooldownDuration()
    return CallSpellAPI("GetSpellLossOfControlCooldownDuration", self.spellID)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellMaxCumulativeAuraApplications)
---@return number cumulativeAura
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellMaxCumulativeAuraApplications()
    return CallSpellAPI("GetSpellMaxCumulativeAuraApplications", self.spellID)
end

---Returns nil if spell is not found
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellName)
---@return string name
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellName()
    return CallSpellAPI("GetSpellName", self.spellID)
end

---Returns a table containing one or more SpellPowerCostInfos, one for each power type this spell costs; May return nil if spell is not found or has no resource costs
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellPowerCost)
---@return SpellPowerCostInfo[] powerCosts
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellPowerCost()
    return CallSpellAPI("GetSpellPowerCost", self.spellID)
end

---Returns the rank of a spell that corresponds to an ability within a ranked SkillLine (ex: a crafting Recipe); Returns nil if spell is not found, or isn't part of a ranked SkillLine
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellSkillLineAbilityRank)
---@return number rank
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellSkillLineAbilityRank()
    return CallSpellAPI("GetSpellSkillLineAbilityRank", self.spellID)
end

---Returns nil if spell is not found
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellSubtext)
---@return string subtext
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellSubtext()
    return CallSpellAPI("GetSpellSubtext", self.spellID)
end

---Returns nothing if spell is not found
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellTexture)
---@return fileID iconID
---@return fileID originalIconID
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellTexture()
    return CallSpellAPI("GetSpellTexture", self.spellID)
end

---Returns nil if spell is not associated with a trade skill
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetSpellTradeSkillLink)
---@return string spellLink
---@param self Core.SpellInfo
function Core.SpellInfo:GetSpellTradeSkillLink()
    return CallSpellAPI("GetSpellTradeSkillLink", self.spellID)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.GetVisibilityInfo)
---@param visibilityType Enum.SpellAuraVisibilityType
---@return boolean hasCustom
---@return boolean alwaysShowMine
---@return boolean showForMySpec
---@param self Core.SpellInfo
function Core.SpellInfo:GetVisibilityInfo(visibilityType)
    return CallSpellAPI("GetVisibilityInfo", self.spellID, visibilityType)
end

---Returns true if the spell is an auto repeat player spell
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsAutoRepeatSpell)
---@return boolean isAutoRepeat
---@param self Core.SpellInfo
function Core.SpellInfo:IsAutoRepeatSpell()
    return CallSpellAPI("IsAutoRepeatSpell", self.spellID)
end

---Returns true if the spell comes from a Class Talent
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsClassTalentSpell)
---@return boolean isAutoRepeat
---@param self Core.SpellInfo
function Core.SpellInfo:IsClassTalentSpell()
    return CallSpellAPI("IsClassTalentSpell", self.spellID)
end

---Returns true if the spell is currently being cast or is queued to be cast
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsCurrentSpell)
---@return boolean isCurrentSpell
---@param self Core.SpellInfo
function Core.SpellInfo:IsCurrentSpell()
    return CallSpellAPI("IsCurrentSpell", self.spellID)
end

---Returns true if an aura is considered an external defensive.
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsExternalDefensive)
---@return boolean isExternalDefensive
---@param self Core.SpellInfo
function Core.SpellInfo:IsExternalDefensive()
    return CallSpellAPI("IsExternalDefensive", self.spellID)
end

---Returns true if the spell is an 'empower' type spell that is cast by pressing and holding, with the on-release cast typically being affected by time held
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsPressHoldReleaseSpell)
---@return boolean isPressHoldRelease
---@param self Core.SpellInfo
function Core.SpellInfo:IsPressHoldReleaseSpell()
    return CallSpellAPI("IsPressHoldReleaseSpell", self.spellID)
end

---Returns true if an aura is considered high priority and should be ordered ahead of other auras in the UI.
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsPriorityAura)
---@return boolean isHighPriority
---@param self Core.SpellInfo
function Core.SpellInfo:IsPriorityAura()
    return CallSpellAPI("IsPriorityAura", self.spellID)
end

---Returns true if the spell comes from a PvP Talent
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsPvPTalentSpell)
---@return boolean isAutoRepeat
---@param self Core.SpellInfo
function Core.SpellInfo:IsPvPTalentSpell()
    return CallSpellAPI("IsPvPTalentSpell", self.spellID)
end

---Returns true if the spell is the player's ranged Auto Attack spell (ex: Shoot, Auto Shot, etc)
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsRangedAutoAttackSpell)
---@return boolean isRangedAutoAttack
---@param self Core.SpellInfo
function Core.SpellInfo:IsRangedAutoAttackSpell()
    return CallSpellAPI("IsRangedAutoAttackSpell", self.spellID)
end

---Returns true if an aura only applies effects to the player, and no other units.
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsSelfBuff)
---@return boolean hasSelfEffectsOnly
---@param self Core.SpellInfo
function Core.SpellInfo:IsSelfBuff()
    return CallSpellAPI("IsSelfBuff", self.spellID)
end

---Returns true if the spell causes a crowd control effect when cast on a valid target.
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsSpellCrowdControl)
---@return boolean isCrowdControl
---@param self Core.SpellInfo
function Core.SpellInfo:IsSpellCrowdControl()
    return CallSpellAPI("IsSpellCrowdControl", self.spellID)
end

---Returns true if data for the spell has already been loaded and cached this session
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsSpellDataCached)
---@return boolean isCached
---@param self Core.SpellInfo
function Core.SpellInfo:IsSpellDataCached()
    return CallSpellAPI("IsSpellDataCached", self.spellID)
end

---Returns true if the spell can be cast on hostile targets
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsSpellHarmful)
---@return boolean isHarmful
---@param self Core.SpellInfo
function Core.SpellInfo:IsSpellHarmful()
    return CallSpellAPI("IsSpellHarmful", self.spellID)
end

---Returns true if the spell can be cast on the player or other friendly targets
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsSpellHelpful)
---@return boolean isHelpful
---@param self Core.SpellInfo
function Core.SpellInfo:IsSpellHelpful()
    return CallSpellAPI("IsSpellHelpful", self.spellID)
end

---Returns true if the spell is considered important. For example a spell that's lethal if not interrupted would be considered important.
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsSpellImportant)
---@return boolean isImportant
---@param self Core.SpellInfo
function Core.SpellInfo:IsSpellImportant()
    return CallSpellAPI("IsSpellImportant", self.spellID)
end

---Returns true if the current target is within range of the spell; False if out of range; Nil if range check was invalid
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsSpellInRange)
---@param targetUnit? UnitToken
---@return boolean? inRange
---@param self Core.SpellInfo
function Core.SpellInfo:IsSpellInRange(targetUnit)
    return CallSpellAPI("IsSpellInRange", self.spellID, targetUnit)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsSpellPassive)
---@return boolean isPassive
---@param self Core.SpellInfo
function Core.SpellInfo:IsSpellPassive()
    return CallSpellAPI("IsSpellPassive", self.spellID)
end

---Returns whether the spell is currently castable; Typically based on things like learned status, required resources, etc
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.IsSpellUsable)
---@return boolean isUsable
---@return boolean insufficientPower
---@param self Core.SpellInfo
function Core.SpellInfo:IsSpellUsable()
    return CallSpellAPI("IsSpellUsable", self.spellID)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.PickupSpell)
---@param self Core.SpellInfo
function Core.SpellInfo:PickupSpell()
    return CallSpellAPI("PickupSpell", self.spellID)
end

---Requests data for the spell be loaded; Listen for SPELL_DATA_LOAD_RESULT to be notified when load is finished
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.RequestLoadSpellData)
---@param self Core.SpellInfo
function Core.SpellInfo:RequestLoadSpellData()
    return CallSpellAPI("RequestLoadSpellData", self.spellID)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.SetSpellAutoCastEnabled)
---@param enabled boolean
---@param self Core.SpellInfo
function Core.SpellInfo:SetSpellAutoCastEnabled(enabled)
    return CallSpellAPI("SetSpellAutoCastEnabled", self.spellID, enabled)
end

---Returns true if the spell has a min and/or max range greater than 0
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.SpellHasRange)
---@return boolean hasRange
---@param self Core.SpellInfo
function Core.SpellInfo:SpellHasRange()
    return CallSpellAPI("SpellHasRange", self.spellID)
end

---Toggles whether spell's autoCast is enabled
---
---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Spell.ToggleSpellAutoCast)
---@param self Core.SpellInfo
function Core.SpellInfo:ToggleSpellAutoCast()
    return CallSpellAPI("ToggleSpellAutoCast", self.spellID)
end
