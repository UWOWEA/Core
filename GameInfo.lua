---@meta _

---@class Core.GameType.Value
---@field interfaceVersion integer
---@field name string
---@field expansionLevel integer
---@class Core.GameType
Core.GameType = {
    CLASSIC = {
        interfaceVersion = 10000,
        name = "Classic",
        expansionLevel = Enum.ExpansionLevel.None,
    },
    FOREVER = {
        interfaceVersion = 16000,
        name = "Forever",
        expansionLevel = Enum.ExpansionLevel.None,
    },
    TBC = {
        interfaceVersion = 20000,
        name = "The Burning Crusade",
        expansionLevel = Enum.ExpansionLevel.BurningCrusade,
    },
    WOTLK = {
        interfaceVersion = 30000,
        name = "Wrath of the Lich King",
        expansionLevel = Enum.ExpansionLevel.Northrend,
    },
    CATACLYSM = {
        interfaceVersion = 40000,
        name = "Cataclysm",
        expansionLevel = Enum.ExpansionLevel.Cataclysm,
    },
    MOP = {
        interfaceVersion = 50000,
        name = "Mists of Pandaria",
        expansionLevel = Enum.ExpansionLevel.MistsOfPandaria,
    },
    WOD = {
        interfaceVersion = 60000,
        name = "Warlords of Draenor",
        expansionLevel = Enum.ExpansionLevel.Draenor,
    },
    Legion = {
        interfaceVersion = 70000,
        name = "Legion",
        expansionLevel = Enum.ExpansionLevel.Legion,
    },
    BFA = {
        interfaceVersion = 80000,
        name = "Battle for Azeroth",
        expansionLevel = Enum.ExpansionLevel.BattleForAzeroth,
    },
    SL = {
        interfaceVersion = 90000,
        name = "Shadowlands",
        expansionLevel = Enum.ExpansionLevel.Shadowlands,
    },
    DF = {
        interfaceVersion = 100000,
        name = "Dragonflight",
        expansionLevel = Enum.ExpansionLevel.Dragonflight,
    },
    TWW = {
        interfaceVersion = 110000,
        name = "The War Within",
        expansionLevel = Enum.ExpansionLevel.WarWithin,
    },
    Midnight = {
        interfaceVersion = 120000,
        name = "Midnight",
        expansionLevel = Enum.ExpansionLevel.Midnight,
    },
    LastTitan = {
        interfaceVersion = 130000,
        name = "The Last Titan",
        expansionLevel = Enum.ExpansionLevel.LastTitan,
    },
}

---@class Core.GameInfo
---@field Init fun(self: Core.GameInfo)
---@field IsInicialized fun(self: Core.GameInfo): boolean
---@field GetGameVersion fun(self: Core.GameInfo)
---@field CheckInit fun(self: Core.GameInfo): boolean
---@field type Core.GameType.Value|nil
Core.GameInfo = {
    buildVersion = nil, -- 2.5.6
    buildNumber = nil, -- 69795
    buildDate = nil,
    interfaceVersion = nil, -- 20506
    localizedVersion = nil,
    buildInfo = nil,
    currentVersion = nil, -- 20506
    name = nil,
    inicialized = false,
    type = nil,
}
Core.GameInfo.__index = Core.GameInfo

---@param interfaceVersion number
---@return Core.GameType.Value
local function findGameType(interfaceVersion)
    local result

    for key, info in pairs(Core.GameType) do
        if interfaceVersion >= info.interfaceVersion
            and (not result or info.interfaceVersion > result.interfaceVersion) then
            result = Core.GameType[key]
        end
    end

    return result
end

function Core.GameInfo:Init()
    local buildVersion, buildNumber, buildDate, interfaceVersion, localizedVersion, buildInfo, currentVersion  = GetBuildInfo()
    Core.GameInfo.buildVersion = buildVersion
    Core.GameInfo.buildNumber = buildNumber
    Core.GameInfo.buildDate = buildDate
    Core.GameInfo.interfaceVersion = interfaceVersion
    Core.GameInfo.localizedVersion = localizedVersion
    Core.GameInfo.buildInfo = buildInfo
    Core.GameInfo.currentVersion = currentVersion
    Core.GameInfo.inicialized = true
    Core.GameInfo.type = findGameType(interfaceVersion)
end

---@return boolean
function Core.GameInfo:IsInicialized()
    return Core.GameInfo.inicialized
end

---@return boolean
function Core.GameInfo:CheckInit()
    if not Core.GameInfo:IsInicialized() then
        Core.GameInfo:Init()
    end

    return true
end

---@param gameName string
function Core.GameInfo.Is(gameName)
    for key, info in pairs(Core.GameType) do
        if string.lower(gameName) == string.lower(key) or string.lower(gameName) == string.lower(info.name) then
            return true
        end
    end

    return false
end

function Core.GameInfo:GetGameVersion()
    Core.GameInfo:CheckInit()

    local buildVersion, buildNumber, buildDate, interfaceVersion, localizedVersion, buildInfo, currentVersion  = GetBuildInfo()
    print("buildVersion: ", buildVersion)
    print("buildNumber: ", buildNumber)
    print("interfaceVersion: ", interfaceVersion)
    print("currentVersion: ", currentVersion)
end

Core.GameInfo:Init()
