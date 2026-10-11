---@meta _

--- Explicit Unit API methods with LuaLS signatures.

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitAffectingCombat)
---@param self Core.Unit
---@return boolean result
function Core.Unit:AffectingCombat()
    return UnitAffectingCombat(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitAlliedRaceInfo)
---@param self Core.Unit
---@return boolean isAlliedRace
---@return boolean hasHeritageArmorUnlocked
function Core.Unit:AlliedRaceInfo()
    return UnitAlliedRaceInfo(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitArmor)
---@param self Core.Unit
---@return number base
---@return number effective
---@return number real
---@return number bonus
function Core.Unit:Armor()
    return UnitArmor(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitAttackPower)
---@param self Core.Unit
---@return number attackPower
---@return number posBuff
---@return number negBuff
function Core.Unit:AttackPower()
    return UnitAttackPower(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitAttackSpeed)
---@param self Core.Unit
---@return number attackSpeed
---@return number? offhandAttackSpeed
function Core.Unit:AttackSpeed()
    return UnitAttackSpeed(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitBattlePetLevel)
---@param self Core.Unit
---@return number? result
function Core.Unit:BattlePetLevel()
    return UnitBattlePetLevel(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitBattlePetSpeciesID)
---@param self Core.Unit
---@return number? result
function Core.Unit:BattlePetSpeciesID()
    return UnitBattlePetSpeciesID(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitBattlePetType)
---@param self Core.Unit
---@return number? result
function Core.Unit:BattlePetType()
    return UnitBattlePetType(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitCanAssist)
---@param self Core.Unit
---@param target UnitToken
---@return boolean result
function Core.Unit:CanAssist(target)
    return UnitCanAssist(self.token, target)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitCanAttack)
---@param self Core.Unit
---@param target UnitToken
---@return boolean result
function Core.Unit:CanAttack(target)
    return UnitCanAttack(self.token, target)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitCanCooperate)
---@param self Core.Unit
---@param target UnitToken
---@return boolean result
function Core.Unit:CanCooperate(target)
    return UnitCanCooperate(self.token, target)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitCanPetBattle)
---@param self Core.Unit
---@param target UnitToken
---@return boolean result
function Core.Unit:CanPetBattle(target)
    return UnitCanPetBattle(self.token, target)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitCastingDuration)
---@param self Core.Unit
---@return LuaDurationObject duration
function Core.Unit:CastingDuration()
    return UnitCastingDuration(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitCastingInfo)
---@param self Core.Unit
---@return string name
---@return string displayName
---@return fileID textureID
---@return number startTimeMs
---@return number endTimeMs
---@return boolean isTradeskill
---@return WOWGUID castID
---@return boolean? notInterruptible
---@return number castingSpellID
---@return number? castBarID
---@return number delayTimeMs
function Core.Unit:CastingInfo()
    return UnitCastingInfo(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitChannelDuration)
---@param self Core.Unit
---@return LuaDurationObject duration
function Core.Unit:ChannelDuration()
    return UnitChannelDuration(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitChannelInfo)
---@param self Core.Unit
---@return string name
---@return string displayName
---@return fileID textureID
---@return number startTimeMs
---@return number endTimeMs
---@return boolean isTradeskill
---@return boolean? notInterruptible
---@return number spellID
---@return boolean isEmpowered
---@return number numEmpowerStages
---@return number? castBarID
function Core.Unit:ChannelInfo()
    return UnitChannelInfo(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitChromieTimeID)
---@param self Core.Unit
---@return number ID
function Core.Unit:ChromieTimeID()
    return UnitChromieTimeID(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitClass)
---@param self Core.Unit
---@return string className
---@return string classFilename
---@return number classID
function Core.Unit:Class()
    return UnitClass(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitClassBase)
---@param self Core.Unit
---@return string classFilename
---@return number classID
function Core.Unit:ClassBase()
    return UnitClassBase(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitClassFromGUID)
---@param self Core.Unit
---@return string className
---@return string classFilename
---@return number classID
function Core.Unit:ClassFromGUID()
    return UnitClassFromGUID(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitClassification)
---@param self Core.Unit
---@return string result
function Core.Unit:Classification()
    return UnitClassification(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitControllingVehicle)
---@param self Core.Unit
---@return boolean result
function Core.Unit:ControllingVehicle()
    return UnitControllingVehicle(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitCreatureFamily)
---@param self Core.Unit
---@return string name
---@return number id
function Core.Unit:CreatureFamily()
    return UnitCreatureFamily(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitCreatureID)
---@param self Core.Unit
---@return number? creatureID
function Core.Unit:CreatureID()
    return UnitCreatureID(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitCreatureType)
---@param self Core.Unit
---@return string name
---@return number id
function Core.Unit:CreatureType()
    return UnitCreatureType(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitDamage)
---@param self Core.Unit
---@return number minDamage
---@return number maxDamage
---@return number offhandMinDamage
---@return number offhandMaxDamage
---@return number posBuff
---@return number negBuff
---@return number percent
function Core.Unit:Damage()
    return UnitDamage(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitDetailedThreatSituation)
---@param self Core.Unit
---@param mobGUID UnitToken
---@return boolean isTanking
---@return number status
---@return number scaledPercentage
---@return number rawPercentage
---@return number rawThreat
function Core.Unit:DetailedThreatSituation(mobGUID)
    return UnitDetailedThreatSituation(self.token, mobGUID)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitDistanceSquared)
---@param self Core.Unit
---@return number distance
---@return boolean checkedDistance
function Core.Unit:DistanceSquared()
    return UnitDistanceSquared(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitEffectiveLevel)
---@param self Core.Unit
---@return number result
function Core.Unit:EffectiveLevel()
    return UnitEffectiveLevel(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitEmpoweredChannelDuration)
---@param self Core.Unit
---@param includeHoldAtMaxTime? boolean Default = true
---@return LuaDurationObject duration
function Core.Unit:EmpoweredChannelDuration(includeHoldAtMaxTime)
    return UnitEmpoweredChannelDuration(self.token, includeHoldAtMaxTime)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitEmpoweredStageDurations)
---@param self Core.Unit
---@return LuaDurationObject[] duration
function Core.Unit:EmpoweredStageDurations()
    return UnitEmpoweredStageDurations(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitEmpoweredStagePercentages)
---@param self Core.Unit
---@param includeHoldAtMaxTime? boolean Default = true
---@return number[] percentages
function Core.Unit:EmpoweredStagePercentages(includeHoldAtMaxTime)
    return UnitEmpoweredStagePercentages(self.token, includeHoldAtMaxTime)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitExists)
---@param self Core.Unit
---@return boolean result
function Core.Unit:Exists()
    return UnitExists(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitFactionGroup)
---@param self Core.Unit
---@param checkDisplayRace? boolean Default = false
---@return string factionGroupTag
---@return string localized
function Core.Unit:FactionGroup(checkDisplayRace)
    return UnitFactionGroup(self.token, checkDisplayRace)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitFullName)
---@param self Core.Unit
---@return string unitName
---@return string unitServer
function Core.Unit:FullName()
    return UnitFullName(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitGUID)
---@param self Core.Unit
---@return WOWGUID? result
function Core.Unit:GUID()
    return UnitGUID(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitGetDetailedHealPrediction)
---@param self Core.Unit
---@param healerUnit? UnitTokenPvPRestrictedForAddOns
---@param healPredictionCalculator UnitHealPredictionCalculator
function Core.Unit:GetDetailedHealPrediction(healerUnit, healPredictionCalculator)
    return UnitGetDetailedHealPrediction(self.token, healerUnit, healPredictionCalculator)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitGetIncomingHeals)
---@param self Core.Unit
---@param healerGUID? UnitTokenPvPRestrictedForAddOns
---@return number? result
function Core.Unit:GetIncomingHeals(healerGUID)
    return UnitGetIncomingHeals(self.token, healerGUID)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitGetTotalAbsorbs)
---@param self Core.Unit
---@return number result
function Core.Unit:GetTotalAbsorbs()
    return UnitGetTotalAbsorbs(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitGetTotalHealAbsorbs)
---@param self Core.Unit
---@return number result
function Core.Unit:GetTotalHealAbsorbs()
    return UnitGetTotalHealAbsorbs(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitGroupRolesAssigned)
---@param self Core.Unit
---@return string result
function Core.Unit:GroupRolesAssigned()
    return UnitGroupRolesAssigned(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitGroupRolesAssignedEnum)
---@param self Core.Unit
---@return number result
function Core.Unit:GroupRolesAssignedEnum()
    return UnitGroupRolesAssignedEnum(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitHPPerStamina)
---@param self Core.Unit
---@return number result
function Core.Unit:HPPerStamina()
    return UnitHPPerStamina(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitHasRelicSlot)
---@param self Core.Unit
---@return boolean result
function Core.Unit:HasRelicSlot()
    return UnitHasRelicSlot(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitHasVehiclePlayerFrameUI)
---@param self Core.Unit
---@return boolean result
function Core.Unit:HasVehiclePlayerFrameUI()
    return UnitHasVehiclePlayerFrameUI(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitHasVehicleUI)
---@param self Core.Unit
---@return boolean result
function Core.Unit:HasVehicleUI()
    return UnitHasVehicleUI(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitHealthMax)
---@param self Core.Unit
---@return number result
function Core.Unit:HealthMax()
    return UnitHealthMax(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitHealthMissing)
---@param self Core.Unit
---@param usePredicted? boolean Default = true
---@return number result
function Core.Unit:HealthMissing(usePredicted)
    return UnitHealthMissing(self.token, usePredicted)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitHealthPercent)
---@param self Core.Unit
---@param usePredicted? boolean Default = true
---@param curve? LuaCurveObjectBase
---@return LuaCurveEvaluatedResult result
function Core.Unit:HealthPercent(usePredicted, curve)
    return UnitHealthPercent(self.token, usePredicted, curve)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitHealth)
---@param self Core.Unit
---@param usePredicted? boolean Default = true
---@return number result
function Core.Unit:Health(usePredicted)
    return UnitHealth(self.token, usePredicted)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitHonor)
---@param self Core.Unit
---@return number result
function Core.Unit:Honor()
    return UnitHonor(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitHonorLevel)
---@param self Core.Unit
---@return number result
function Core.Unit:HonorLevel()
    return UnitHonorLevel(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitHonorMax)
---@param self Core.Unit
---@return number result
function Core.Unit:HonorMax()
    return UnitHonorMax(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitInAnyGroup)
---@param self Core.Unit
---@param partyIndex? number
---@return boolean result
function Core.Unit:InAnyGroup(partyIndex)
    return UnitInAnyGroup(self.token, partyIndex)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitInBattleground)
---@param self Core.Unit
---@param partyIndex? number
---@return number? result
function Core.Unit:InBattleground(partyIndex)
    return UnitInBattleground(self.token, partyIndex)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitInOtherParty)
---@param self Core.Unit
---@return boolean inOtherParty
function Core.Unit:InOtherParty()
    return UnitInOtherParty(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitInParty)
---@param self Core.Unit
---@param partyIndex? number
---@return boolean result
function Core.Unit:InParty(partyIndex)
    return UnitInParty(self.token, partyIndex)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitInPartyIsAI)
---@param self Core.Unit
---@return boolean result
function Core.Unit:InPartyIsAI()
    return UnitInPartyIsAI(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitInPartyShard)
---@param self Core.Unit
---@return boolean inPartyShard
function Core.Unit:InPartyShard()
    return UnitInPartyShard(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitInRaid)
---@param self Core.Unit
---@param partyIndex? number
---@return number? result
function Core.Unit:InRaid(partyIndex)
    return UnitInRaid(self.token, partyIndex)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitInRange)
---@param self Core.Unit
---@return boolean inRange
---@return boolean checkedRange
function Core.Unit:InRange()
    return UnitInRange(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitInSubgroup)
---@param self Core.Unit
---@param partyIndex? number
---@return boolean result
function Core.Unit:InSubgroup(partyIndex)
    return UnitInSubgroup(self.token, partyIndex)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitInVehicle)
---@param self Core.Unit
---@return boolean result
function Core.Unit:InVehicle()
    return UnitInVehicle(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitInVehicleControlSeat)
---@param self Core.Unit
---@return boolean result
function Core.Unit:InVehicleControlSeat()
    return UnitInVehicleControlSeat(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitInVehicleHidesPetFrame)
---@param self Core.Unit
---@return boolean result
function Core.Unit:InVehicleHidesPetFrame()
    return UnitInVehicleHidesPetFrame(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsAFK)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsAFK()
    return UnitIsAFK(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsBattlePet)
---@param self Core.Unit
---@return boolean? result
function Core.Unit:IsBattlePet()
    return UnitIsBattlePet(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsBattlePetCompanion)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsBattlePetCompanion()
    return UnitIsBattlePetCompanion(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsBossMob)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsBossMob()
    return UnitIsBossMob(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsCharmed)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsCharmed()
    return UnitIsCharmed(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsConnected)
---@param self Core.Unit
---@return boolean isConnected
function Core.Unit:IsConnected()
    return UnitIsConnected(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsControlling)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsControlling()
    return UnitIsControlling(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsCorpse)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsCorpse()
    return UnitIsCorpse(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsDND)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsDND()
    return UnitIsDND(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsDead)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsDead()
    return UnitIsDead(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsDeadOrGhost)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsDeadOrGhost()
    return UnitIsDeadOrGhost(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsEnemy)
---@param self Core.Unit
---@param target UnitToken
---@return boolean result
function Core.Unit:IsEnemy(target)
    return UnitIsEnemy(self.token, target)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsFeignDeath)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsFeignDeath()
    return UnitIsFeignDeath(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsFriend)
---@param self Core.Unit
---@param target UnitToken
---@return boolean result
function Core.Unit:IsFriend(target)
    return UnitIsFriend(self.token, target)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsGameObject)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsGameObject()
    return UnitIsGameObject(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsGhost)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsGhost()
    return UnitIsGhost(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsGroupAssistant)
---@param self Core.Unit
---@return boolean isAssistant
function Core.Unit:IsGroupAssistant()
    return UnitIsGroupAssistant(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsGroupLeader)
---@param self Core.Unit
---@param partyCategory? number
---@return boolean isLeader
function Core.Unit:IsGroupLeader(partyCategory)
    return UnitIsGroupLeader(self.token, partyCategory)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsHumanPlayer)
---@param self Core.Unit
---@param partyIndex? number
---@return boolean result
function Core.Unit:IsHumanPlayer(partyIndex)
    return UnitIsHumanPlayer(self.token, partyIndex)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsInMyGuild)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsInMyGuild()
    return UnitIsInMyGuild(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsInteractable)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsInteractable()
    return UnitIsInteractable(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsLieutenant)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsLieutenant()
    return UnitIsLieutenant(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsMercenary)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsMercenary()
    return UnitIsMercenary(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsMinion)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsMinion()
    return UnitIsMinion(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsNPCAsPlayer)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsNPCAsPlayer()
    return UnitIsNPCAsPlayer(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsOtherPlayersBattlePet)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsOtherPlayersBattlePet()
    return UnitIsOtherPlayersBattlePet(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsOtherPlayersPet)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsOtherPlayersPet()
    return UnitIsOtherPlayersPet(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsOwnerOrControllerOfUnit)
---@param self Core.Unit
---@param controlledUnit UnitToken
---@return boolean unitIsOwnerOrControllerOfUnit
function Core.Unit:IsOwnerOrControllerOfUnit(controlledUnit)
    return UnitIsOwnerOrControllerOfUnit(self.token, controlledUnit)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsPVP)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsPVP()
    return UnitIsPVP(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsPVPFreeForAll)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsPVPFreeForAll()
    return UnitIsPVPFreeForAll(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsPVPSanctuary)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsPVPSanctuary()
    return UnitIsPVPSanctuary(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsPlayer)
---@param self Core.Unit
---@param partyIndex? number
---@return boolean result
function Core.Unit:IsPlayer(partyIndex)
    return UnitIsPlayer(self.token, partyIndex)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsPossessed)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsPossessed()
    return UnitIsPossessed(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsQuestBoss)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsQuestBoss()
    return UnitIsQuestBoss(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsRaidOfficer)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsRaidOfficer()
    return UnitIsRaidOfficer(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsSameServer)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsSameServer()
    return UnitIsSameServer(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsSpellTarget)
---@param self Core.Unit
---@param target UnitToken
---@return boolean result
function Core.Unit:IsSpellTarget(target)
    return UnitIsSpellTarget(self.token, target)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsTapDenied)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsTapDenied()
    return UnitIsTapDenied(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsTrivial)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsTrivial()
    return UnitIsTrivial(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsUnconscious)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsUnconscious()
    return UnitIsUnconscious(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsUnit)
---@param self Core.Unit
---@param unit2 UnitToken
---@return boolean result
function Core.Unit:IsUnit(unit2)
    return UnitIsUnit(self.token, unit2)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsVisible)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsVisible()
    return UnitIsVisible(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitIsWildBattlePet)
---@param self Core.Unit
---@return boolean result
function Core.Unit:IsWildBattlePet()
    return UnitIsWildBattlePet(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitLeadsAnyGroup)
---@param self Core.Unit
---@return boolean isLeader
function Core.Unit:LeadsAnyGroup()
    return UnitLeadsAnyGroup(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitLevel)
---@param self Core.Unit
---@return number result
function Core.Unit:Level()
    return UnitLevel(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitName)
---@param self Core.Unit
---@return string unitName
---@return string unitServer
function Core.Unit:Name()
    return UnitName(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitNameFromGUID)
---@param self Core.Unit
---@return string unitName
---@return string unitServer
function Core.Unit:NameFromGUID()
    return UnitNameFromGUID(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitNameUnmodified)
---@param self Core.Unit
---@return string unitName
---@return string unitServer
function Core.Unit:NameUnmodified()
    return UnitNameUnmodified(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitNameplateShowsWidgetsOnly)
---@param self Core.Unit
---@return boolean nameplateShowsWidgetsOnly
function Core.Unit:NameplateShowsWidgetsOnly()
    return UnitNameplateShowsWidgetsOnly(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitNumPowerBarTimers)
---@param self Core.Unit
---@return number result
function Core.Unit:NumPowerBarTimers()
    return UnitNumPowerBarTimers(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitOnTaxi)
---@param self Core.Unit
---@return boolean result
function Core.Unit:OnTaxi()
    return UnitOnTaxi(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitOwnerGUID)
---@param self Core.Unit
---@return WOWGUID ownerGUID
function Core.Unit:OwnerGUID()
    return UnitOwnerGUID(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPVPName)
---@param self Core.Unit
---@return string result
function Core.Unit:PVPName()
    return UnitPVPName(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPartialPower)
---@param self Core.Unit
---@param powerType? Enum.PowerType
---@param unmodified? boolean Default = false
---@return number partialPower
function Core.Unit:PartialPower(powerType, unmodified)
    return UnitPartialPower(self.token, powerType, unmodified)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPercentHealthFromGUID)
---@param self Core.Unit
---@return number? percentHealth
function Core.Unit:PercentHealthFromGUID()
    return UnitPercentHealthFromGUID(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPhaseReason)
---@param self Core.Unit
---@return Enum.PhaseReason? reason
function Core.Unit:PhaseReason()
    return UnitPhaseReason(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPlayerControlled)
---@param self Core.Unit
---@return boolean result
function Core.Unit:PlayerControlled()
    return UnitPlayerControlled(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPlayerOrPetInParty)
---@param self Core.Unit
---@param partyIndex? number
---@return boolean result
function Core.Unit:PlayerOrPetInParty(partyIndex)
    return UnitPlayerOrPetInParty(self.token, partyIndex)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPlayerOrPetInRaid)
---@param self Core.Unit
---@param partyIndex? number
---@return boolean result
function Core.Unit:PlayerOrPetInRaid(partyIndex)
    return UnitPlayerOrPetInRaid(self.token, partyIndex)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPosition)
---@param self Core.Unit
---@return number positionX
---@return number positionY
---@return number positionZ
---@return number mapID
function Core.Unit:Position()
    return UnitPosition(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPower)
---@param self Core.Unit
---@param powerType? Enum.PowerType
---@param unmodified? boolean Default = false
---@return number power
function Core.Unit:Power(powerType, unmodified)
    return UnitPower(self.token, powerType, unmodified)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPowerBarID)
---@param self Core.Unit
---@return number barID
function Core.Unit:PowerBarID()
    return UnitPowerBarID(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPowerBarTimerInfo)
---@param self Core.Unit
---@param index? number Default = 0
---@return number duration
---@return number expiration
---@return number barID
---@return number auraID
function Core.Unit:PowerBarTimerInfo(index)
    return UnitPowerBarTimerInfo(self.token, index)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPowerDisplayMod)
---@param self Core.Unit
---@param powerType Enum.PowerType
---@return number displayMod
function Core.Unit:PowerDisplayMod(powerType)
    return UnitPowerDisplayMod(powerType)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPowerMax)
---@param self Core.Unit
---@param powerType? Enum.PowerType
---@param unmodified? boolean Default = false
---@return number maxPower
function Core.Unit:PowerMax(powerType, unmodified)
    return UnitPowerMax(self.token, powerType, unmodified)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPowerMissing)
---@param self Core.Unit
---@param powerType? Enum.PowerType
---@param unmodified? boolean Default = false
---@return number result
function Core.Unit:PowerMissing(powerType, unmodified)
    return UnitPowerMissing(self.token, powerType, unmodified)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPowerPercent)
---@param self Core.Unit
---@param powerType? Enum.PowerType
---@param unmodified? boolean Default = false
---@param curve? LuaCurveObjectBase
---@return LuaCurveEvaluatedResult result
function Core.Unit:PowerPercent(powerType, unmodified, curve)
    return UnitPowerPercent(self.token, powerType, unmodified, curve)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPowerType)
---@param self Core.Unit
---@param index? number Default = 0
---@return Enum.PowerType powerType
---@return string powerTypeToken
---@return number rgbX
---@return number rgbY
---@return number rgbZ
function Core.Unit:PowerType(index)
    return UnitPowerType(self.token, index)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitPvpClassification)
---@param self Core.Unit
---@return Enum.PvPUnitClassification? classification
function Core.Unit:PvpClassification()
    return UnitPvpClassification(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitQuestTrivialLevelRange)
---@param self Core.Unit
---@return number levelRange
function Core.Unit:QuestTrivialLevelRange()
    return UnitQuestTrivialLevelRange(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitQuestTrivialLevelRangeScaling)
---@param self Core.Unit
---@return number levelRange
function Core.Unit:QuestTrivialLevelRangeScaling()
    return UnitQuestTrivialLevelRangeScaling(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitRace)
---@param self Core.Unit
---@return string localizedRaceName
---@return string englishRaceName
---@return number raceID
function Core.Unit:Race()
    return UnitRace(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitRangedAttackPower)
---@param self Core.Unit
---@return number attackPower
---@return number posBuff
---@return number negBuff
function Core.Unit:RangedAttackPower()
    return UnitRangedAttackPower(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitRangedDamage)
---@param self Core.Unit
---@return number speed
---@return number minDamage
---@return number maxDamage
---@return number posBuff
---@return number negBuff
---@return number percent
function Core.Unit:RangedDamage()
    return UnitRangedDamage(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitReaction)
---@param self Core.Unit
---@param target UnitToken
---@return number? result
function Core.Unit:Reaction(target)
    return UnitReaction(self.token, target)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitRealmRelationship)
---@param self Core.Unit
---@return number? realmRelationship
function Core.Unit:RealmRelationship()
    return UnitRealmRelationship(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitSelectionColor)
---@param self Core.Unit
---@param useExtendedColors? boolean Default = false
---@return number resultR
---@return number resultG
---@return number resultB
---@return number resultA
function Core.Unit:SelectionColor(useExtendedColors)
    return UnitSelectionColor(self.token, useExtendedColors)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitSelectionType)
---@param self Core.Unit
---@param useExtendedColors? boolean Default = false
---@return number result
function Core.Unit:SelectionType(useExtendedColors)
    return UnitSelectionType(self.token, useExtendedColors)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitSex)
---@param self Core.Unit
---@return number? sex
function Core.Unit:Sex()
    return UnitSex(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitSexBase)
---@param self Core.Unit
---@return Enum.UnitSex? sex
function Core.Unit:SexBase()
    return UnitSexBase(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitShouldDisplayName)
---@param self Core.Unit
---@return boolean result
function Core.Unit:ShouldDisplayName()
    return UnitShouldDisplayName(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitShouldDisplaySpellTargetName)
---@param self Core.Unit
---@return boolean result
function Core.Unit:ShouldDisplaySpellTargetName()
    return UnitShouldDisplaySpellTargetName(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitSpellHaste)
---@param self Core.Unit
---@return number result
function Core.Unit:SpellHaste()
    return UnitSpellHaste(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitSpellTargetClass)
---@param self Core.Unit
---@return string classFilename
function Core.Unit:SpellTargetClass()
    return UnitSpellTargetClass(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitSpellTargetName)
---@param self Core.Unit
---@return string targetName
function Core.Unit:SpellTargetName()
    return UnitSpellTargetName(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitStagger)
---@param self Core.Unit
---@return number result
function Core.Unit:Stagger()
    return UnitStagger(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitStat)
---@param self Core.Unit
---@param index number
---@return number currentStat
---@return number effectiveStat
---@return number statPositiveBuff
---@return number statNegativeBuff
function Core.Unit:Stat(index)
    return UnitStat(self.token, index)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitSwitchToVehicleSeat)
---@param self Core.Unit
---@param virtualSeatIndex number
function Core.Unit:SwitchToVehicleSeat(virtualSeatIndex)
    return UnitSwitchToVehicleSeat(self.token, virtualSeatIndex)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitTargetsVehicleInRaidUI)
---@param self Core.Unit
---@return boolean result
function Core.Unit:TargetsVehicleInRaidUI()
    return UnitTargetsVehicleInRaidUI(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitThreatLeadSituation)
---@param self Core.Unit
---@param mobGUID UnitToken
---@return number? result
function Core.Unit:ThreatLeadSituation(mobGUID)
    return UnitThreatLeadSituation(self.token, mobGUID)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitThreatPercentageOfLead)
---@param self Core.Unit
---@param mobGUID UnitToken
---@return number? result
function Core.Unit:ThreatPercentageOfLead(mobGUID)
    return UnitThreatPercentageOfLead(self.token, mobGUID)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitThreatSituation)
---@param self Core.Unit
---@param mobGUID? UnitToken
---@return number? result
function Core.Unit:ThreatSituation(mobGUID)
    return UnitThreatSituation(self.token, mobGUID)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitTokenFromGUID)
---@param self Core.Unit
---@return string? unitToken
function Core.Unit:TokenFromGUID()
    return UnitTokenFromGUID(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitTreatAsPlayerForDisplay)
---@param self Core.Unit
---@return boolean treatAsPlayer
function Core.Unit:TreatAsPlayerForDisplay()
    return UnitTreatAsPlayerForDisplay(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitTrialBankedLevels)
---@param self Core.Unit
---@return number bankedLevels
---@return number xpIntoCurrentLevel
---@return number xpForNextLevel
function Core.Unit:TrialBankedLevels()
    return UnitTrialBankedLevels(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitTrialXP)
---@param self Core.Unit
---@return number result
function Core.Unit:TrialXP()
    return UnitTrialXP(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitUsingVehicle)
---@param self Core.Unit
---@return boolean result
function Core.Unit:UsingVehicle()
    return UnitUsingVehicle(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitVehicleSeatCount)
---@param self Core.Unit
---@return number result
function Core.Unit:VehicleSeatCount()
    return UnitVehicleSeatCount(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitVehicleSeatInfo)
---@param self Core.Unit
---@param virtualSeatIndex number
---@return string controlType
---@return string occupantName
---@return string serverName
---@return boolean ejectable
---@return boolean canSwitchSeats
function Core.Unit:VehicleSeatInfo(virtualSeatIndex)
    return UnitVehicleSeatInfo(self.token, virtualSeatIndex)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitVehicleSkin)
---@param self Core.Unit
---@return fileID result
function Core.Unit:VehicleSkin()
    return UnitVehicleSkin(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitWeaponAttackPower)
---@param self Core.Unit
---@return number mainHandWeaponAttackPower
---@return number offHandWeaponAttackPower
---@return number rangedWeaponAttackPower
function Core.Unit:WeaponAttackPower()
    return UnitWeaponAttackPower(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitWidgetSet)
---@param self Core.Unit
---@return number uiWidgetSet
function Core.Unit:WidgetSet()
    return UnitWidgetSet(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitXP)
---@param self Core.Unit
---@return number result
function Core.Unit:XP()
    return UnitXP(self.token)
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_UnitXPMax)
---@param self Core.Unit
---@return number result
function Core.Unit:XPMax()
    return UnitXPMax(self.token)
end
