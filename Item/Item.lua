---@meta _
---@class Core.Item
---@field GetInfo fun(self: Core.Item, itemIdentifier: string|number): Core.ItemInfo|nil
---@field NormalizeItemID fun(self: Core.Item, itemID: string|number): string|number
Core.Item = Core.Item or {}

---@class Core.ItemInfo
---@field DoesItemContainSpec fun(self: Core.ItemInfo, classID: number, specID?: number): boolean
---@field DoesItemExistByID fun(self: Core.ItemInfo): boolean
---@field EquipItemByName fun(self: Core.ItemInfo, dstSlot?: number): nil
---@field GetDetailedItemLevelInfo fun(self: Core.ItemInfo): number, boolean, number
---@field GetItemChildInfo fun(self: Core.ItemInfo, slotID?: number): number[]
---@field GetItemCooldown fun(self: Core.ItemInfo): number, number, boolean
---@field GetItemCount fun(self: Core.ItemInfo, includeBank?: boolean, includeUses?: boolean, includeReagentBank?: boolean, includeAccountBank?: boolean): number
---@field GetItemCreationContext fun(self: Core.ItemInfo): number, string
---@field GetItemFamily fun(self: Core.ItemInfo): number?
---@field GetItemGemID fun(self: Core.ItemInfo, index: number): number
---@field GetItemIDForItemInfo fun(self: Core.ItemInfo): number
---@field GetItemIconByID fun(self: Core.ItemInfo): fileID?
---@field GetItemInfo fun(self: Core.ItemInfo): string, string, Enum.ItemQuality, number, number, string, string, number, string, fileID, number, number, number, number, number, number?, boolean, string
---@field GetItemInfoInstant fun(self: Core.ItemInfo): number, string, string, string, fileID, number, number
---@field GetItemInventoryTypeByID fun(self: Core.ItemInfo): Enum.InventoryType?
---@field GetItemLearnTransmogSet fun(self: Core.ItemInfo): number?
---@field GetItemMaxStackSizeByID fun(self: Core.ItemInfo): number?
---@field GetItemNameByID fun(self: Core.ItemInfo): string?
---@field GetItemNumAddedSockets fun(self: Core.ItemInfo): number
---@field GetItemNumSockets fun(self: Core.ItemInfo): number
---@field GetItemQualityByID fun(self: Core.ItemInfo): Enum.ItemQuality?
---@field GetItemSpecInfo fun(self: Core.ItemInfo): number[]
---@field GetItemSpell fun(self: Core.ItemInfo): string, number
---@field GetItemUniqueness fun(self: Core.ItemInfo): number, number
---@field GetItemUniquenessByID fun(self: Core.ItemInfo): boolean, string?, number?, number?
---@field GetItemUpgradeInfo fun(self: Core.ItemInfo): ItemUpgradeInfo?
---@field GetLimitedCurrencyItemInfo fun(self: Core.ItemInfo): string, fileID, number, number, number
---@field IsAnimaItemByID fun(self: Core.ItemInfo): boolean
---@field IsArtifactPowerItem fun(self: Core.ItemInfo): boolean
---@field IsConsumableItem fun(self: Core.ItemInfo): boolean
---@field IsCorruptedItem fun(self: Core.ItemInfo): boolean?
---@field IsCosmeticItem fun(self: Core.ItemInfo): boolean?
---@field IsCurioItem fun(self: Core.ItemInfo): boolean?
---@field IsCurrentItem fun(self: Core.ItemInfo): boolean
---@field IsDecorItem fun(self: Core.ItemInfo): boolean?
---@field IsDressableItemByID fun(self: Core.ItemInfo): boolean
---@field IsEquippableItem fun(self: Core.ItemInfo): boolean
---@field IsEquippedItem fun(self: Core.ItemInfo): boolean
---@field IsHarmfulItem fun(self: Core.ItemInfo): boolean
---@field IsHelpfulItem fun(self: Core.ItemInfo): boolean
---@field IsItemBindToAccount fun(self: Core.ItemInfo): boolean
---@field IsItemBindToAccountUntilEquip fun(self: Core.ItemInfo): boolean
---@field IsItemDataCachedByID fun(self: Core.ItemInfo): boolean
---@field IsItemInRange fun(self: Core.ItemInfo, targetToken: string): boolean?
---@field IsItemKeystoneByID fun(self: Core.ItemInfo): boolean
---@field IsItemSpecificToPlayerClass fun(self: Core.ItemInfo): boolean
---@field IsRelicItem fun(self: Core.ItemInfo): boolean?
---@field IsUsableItem fun(self: Core.ItemInfo): boolean, boolean
---@field ItemHasRange fun(self: Core.ItemInfo): boolean
---@field PickupItem fun(self: Core.ItemInfo): nil
---@field RequestLoadItemDataByID fun(self: Core.ItemInfo): nil
---@field UseItemByName fun(self: Core.ItemInfo, target?: string): nil
---@field itemID number|nil
---@field itemIdentifier string|number
---@field itemName string|nil
---@field itemDescription string|nil
---@field itemLink string|nil
---@field itemRarity number|nil
---@field itemLevel number|nil
---@field itemMinLevel number|nil
---@field itemType string|nil
---@field itemSubType string|nil
---@field itemStackCount number|nil
---@field itemEquipLoc string|nil
---@field itemTexture number|string|nil
---@field itemSellPrice number|nil
---@field classID number|nil
---@field subclassID number|nil
---@field bindType number|nil
---@field expansionID number|nil
---@field setID number|nil
---@field isCraftingReagent boolean|nil
Core.ItemInfo = Core.ItemInfo or {}

local itemCache = {}

--- C_Item APIs that accept an item identifier as their first argument.
local itemInfoAPIMethods = {
	DoesItemContainSpec = true,
	DoesItemExistByID = true,
	EquipItemByName = true,
	GetDetailedItemLevelInfo = true,
	GetItemChildInfo = true,
	GetItemCooldown = true,
	GetItemCount = true,
	GetItemCreationContext = true,
	GetItemFamily = true,
	GetItemGemID = true,
	GetItemIDForItemInfo = true,
	GetItemIconByID = true,
	GetItemInfo = true,
	GetItemInfoInstant = true,
	GetItemInventoryTypeByID = true,
	GetItemLearnTransmogSet = true,
	GetItemMaxStackSizeByID = true,
	GetItemNameByID = true,
	GetItemNumAddedSockets = true,
	GetItemNumSockets = true,
	GetItemQualityByID = true,
	GetItemSpecInfo = true,
	GetItemSpell = true,
	GetItemUniqueness = true,
	GetItemUniquenessByID = true,
	GetItemUpgradeInfo = true,
	GetLimitedCurrencyItemInfo = true,
	IsAnimaItemByID = true,
	IsArtifactPowerItem = true,
	IsConsumableItem = true,
	IsCorruptedItem = true,
	IsCosmeticItem = true,
	IsCurioItem = true,
	IsCurrentItem = true,
	IsDecorItem = true,
	IsDressableItemByID = true,
	IsEquippableItem = true,
	IsEquippedItem = true,
	IsHarmfulItem = true,
	IsHelpfulItem = true,
	IsItemBindToAccount = true,
	IsItemBindToAccountUntilEquip = true,
	IsItemDataCachedByID = true,
	IsItemInRange = true,
	IsItemKeystoneByID = true,
	IsItemSpecificToPlayerClass = true,
	IsRelicItem = true,
	IsUsableItem = true,
	ItemHasRange = true,
	PickupItem = true,
	RequestLoadItemDataByID = true,
	UseItemByName = true,
}

Core.ItemInfo.__index = function(itemInfo, methodName)
	local method = rawget(Core.ItemInfo, methodName)
	if method then
		return method
	end
	if not itemInfoAPIMethods[methodName] then
		return
	end

	method = function(self, ...)
		local itemAPI = C_Item and C_Item[methodName]
		if type(itemAPI) ~= "function" then
			return
		end

		return itemAPI(self.itemIdentifier or self.itemID, ...)
	end
	rawset(itemInfo, methodName, method)
	return method
end

local function CreateItemInfo(firstResult, ...)
	if type(firstResult) == "table" then
		return firstResult
	end
	if firstResult == nil then
		return
	end

	local itemName = firstResult
	local itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
		itemStackCount, itemEquipLoc, itemTexture, itemSellPrice, classID,
		subclassID, bindType, expansionID, setID, isCraftingReagent,
		itemDescription = ...
	return {
		itemName = itemName,
		itemLink = itemLink,
		itemRarity = itemRarity,
		itemLevel = itemLevel,
		itemMinLevel = itemMinLevel,
		itemType = itemType,
		itemSubType = itemSubType,
		itemStackCount = itemStackCount,
		itemEquipLoc = itemEquipLoc,
		itemTexture = itemTexture,
		itemSellPrice = itemSellPrice,
		classID = classID,
		subclassID = subclassID,
		bindType = bindType,
		expansionID = expansionID,
		setID = setID,
		isCraftingReagent = isCraftingReagent,
		itemDescription = itemDescription,
	}
end

---@param itemIdentifier string|number
---@return Core.ItemInfo|nil
local function FetchItemInfo(itemIdentifier)
	local itemAPI = C_Item and C_Item.GetItemInfo
	if type(itemAPI) == "function" then
		local ok, itemName, itemLink, itemRarity, itemLevel, itemMinLevel,
			itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture,
			itemSellPrice, classID, subclassID, bindType, expansionID, setID,
			isCraftingReagent, itemDescription = pcall(itemAPI, itemIdentifier)
		if ok then
			local info = CreateItemInfo(
				itemName,
				itemLink,
				itemRarity,
				itemLevel,
				itemMinLevel,
				itemType,
				itemSubType,
				itemStackCount,
				itemEquipLoc,
				itemTexture,
				itemSellPrice,
				classID,
				subclassID,
				bindType,
				expansionID,
				setID,
				isCraftingReagent,
				itemDescription
			)
			if info then
				return info
			end
		end
	end

	local legacyItemAPI = _G.GetItemInfo
	if type(legacyItemAPI) == "function" then
		local ok, itemName, itemLink, itemRarity, itemLevel, itemMinLevel,
			itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture,
			itemSellPrice, classID, subclassID, bindType, expansionID, setID,
			isCraftingReagent = pcall(legacyItemAPI, itemIdentifier)
		if ok then
			return CreateItemInfo(
				itemName,
				itemLink,
				itemRarity,
				itemLevel,
				itemMinLevel,
				itemType,
				itemSubType,
				itemStackCount,
				itemEquipLoc,
				itemTexture,
				itemSellPrice,
				classID,
				subclassID,
				bindType,
				expansionID,
				setID,
				isCraftingReagent
			)
		end
	end
end

---[Documentation](https://warcraft.wiki.gg/wiki/API_C_Item.GetItemInfo)
---@param itemIdentifier string|number item ID, name, or item link
---@return Core.ItemInfo|nil
function Core.Item:GetInfo(itemIdentifier)
	local normalizedItemID = self:NormalizeItemID(itemIdentifier)
	if type(normalizedItemID) ~= "string" and type(normalizedItemID) ~= "number" then
		return
	end
	if normalizedItemID == "" or (type(normalizedItemID) == "number" and normalizedItemID <= 0) then
		return
	end

	local info = itemCache[normalizedItemID]
	if not info then
		info = FetchItemInfo(normalizedItemID)
		if not info then
			return
		end

		info.itemID = info.itemID or (type(normalizedItemID) == "number" and normalizedItemID or nil)
		info.itemIdentifier = normalizedItemID
		setmetatable(info, Core.ItemInfo)
		itemCache[normalizedItemID] = info
	end

	return info
end

---@param itemID string|number
---@return string|number
function Core.Item:NormalizeItemID(itemID)
	if type(itemID) ~= "string" then
		return itemID
	end

	local trimmedItemID = itemID:match("^%s*(.-)%s*$")
	return tonumber(trimmedItemID) or trimmedItemID
end
