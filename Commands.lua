---@meta _
---@class Command
---@field name string
---@field aliases string[]
---@field description string|nil
---@field rawArguments boolean
---@field handler fun(...: string)

---@class Commands
---@field name string
---@field slashCommands string[]
---@field list Command[]
---@field commands table<string, Command>
Commands = {}
Commands.__index = Commands

local Unpack = table.unpack or unpack

local function NormalizeName(name)
    if type(name) ~= "string" then
        error("Command name must be a string", 3)
    end

    local normalized = name:lower():match("^%s*(.-)%s*$")
    if normalized == "" then
        error("Command name must not be empty", 3)
    end

    return normalized
end

local function CreateCommand(name, handler, description, aliases, rawArguments)
    if type(handler) ~= "function" then
        error("Command handler must be a function", 3)
    end

    local command = {
        name = NormalizeName(name),
        aliases = {},
        description = description,
        handler = handler,
    }

    if aliases ~= nil then
        if type(aliases) ~= "table" then
            error("Command aliases must be a table", 3)
        end

        for _, alias in ipairs(aliases) do
            table.insert(command.aliases, NormalizeName(alias))
        end
    end
    if rawArguments ~= nil and type(rawArguments) ~= "boolean" then
        error("Command rawArguments must be a boolean", 3)
    end
    command.rawArguments = rawArguments or false

    return command
end

local function ParseArguments(message)
    local tokens = {}
    local current = ""
    local quote
    local index = 1

    while index <= #message do
        local character = message:sub(index, index)
        if quote then
            if character == quote then
                quote = nil
            else
                current = current .. character
            end
        elseif character == "'" or character == '"' then
            quote = character
        elseif character:match("%s") then
            if current ~= "" then
                table.insert(tokens, current)
                current = ""
            end
        else
            current = current .. character
        end
        index = index + 1
    end

    if current ~= "" then
        table.insert(tokens, current)
    end

    return tokens
end

---@param name string
---@param handler fun(...: string)
---@param description string|nil
---@param aliases string[]|nil
---@param rawArguments boolean|nil
---@return Command
function Commands.Command(name, handler, description, aliases, rawArguments)
    return CreateCommand(name, handler, description, aliases, rawArguments)
end

---@param name string
---@param slashCommands string|string[]
---@return Commands
function Commands.New(name, slashCommands)
    if type(name) ~= "string" then
        error("Slash command name must be a string", 2)
    end

    name = name:upper():match("^%s*(.-)%s*$")
    if not name:match("^[A-Z][A-Z0-9_]*$") then
        error("Invalid SlashCmdList key: " .. name, 2)
    end

    if type(slashCommands) == "string" then
        slashCommands = { slashCommands }
    elseif type(slashCommands) ~= "table" then
        error("Slash commands must be a string or table", 2)
    end

    if #slashCommands == 0 then
        error("At least one slash command is required", 2)
    end

    return setmetatable({
        name = name,
        slashCommands = slashCommands,
        list = {},
        commands = {},
    }, Commands)
end

---@param command Command
---@return Command
function Commands:AddCommand(command)
    if type(command) ~= "table" then
        error("Command must be a table", 2)
    end

    if type(command.name) ~= "string" or type(command.handler) ~= "function" then
        error("Command must have a name and handler", 2)
    end
    if command.aliases ~= nil and type(command.aliases) ~= "table" then
        error("Command aliases must be a table", 2)
    end

    local names = { command.name }
    for _, alias in ipairs(command.aliases or {}) do
        table.insert(names, alias)
    end

    local seen = {}
    for _, name in ipairs(names) do
        local normalized = NormalizeName(name)
        if self.commands[normalized] or seen[normalized] then
            error("Command already registered: " .. normalized, 2)
        end
        seen[normalized] = true
    end

    command.name = NormalizeName(command.name)
    for index, alias in ipairs(command.aliases or {}) do
        command.aliases[index] = NormalizeName(alias)
    end

    table.insert(self.list, command)
    for _, name in ipairs(names) do
        self.commands[NormalizeName(name)] = command
    end

    return command
end

---@param message string
---@return boolean handled
---@return any ...
function Commands:Execute(message)
    if type(message) ~= "string" then
        error("Command message must be a string", 2)
    end

    local args = ParseArguments(message)

    local name = args[1] and NormalizeName(args[1])
    local command = name and self.commands[name]
    if not command then
        return false
    end

    table.remove(args, 1)
    if command.rawArguments then
        local _, commandEnd = message:find("%S+")
        local rawArguments = message:sub(commandEnd + 1):match("^%s*(.-)%s*$")
        return true, command.handler(rawArguments or "")
    end

    return true, command.handler(Unpack(args))
end

---@return Commands
function Commands:Register()
    SlashCmdList = SlashCmdList or {}
    if SlashCmdList[self.name] ~= nil then
        error("Slash command already registered: " .. self.name, 2)
    end

    for index, slashCommand in ipairs(self.slashCommands) do
        if type(slashCommand) ~= "string" or slashCommand:match("^%s*$") then
            error("Slash command must be a non-empty string", 2)
        end
        if not slashCommand:match("^/") then
            slashCommand = "/" .. slashCommand
            self.slashCommands[index] = slashCommand
        end
        _G["SLASH_" .. self.name .. index] = slashCommand
    end

    SlashCmdList[self.name] = function(message)
        if not self:Execute(message or "") then
            self:PrintHelp()
        end
    end

    return self
end

---@param printFunction function|nil
function Commands:PrintHelp(printFunction)
    printFunction = printFunction or print
    for _, command in ipairs(self.list) do
        local aliases = ""
        if #command.aliases > 0 then
            aliases = " (" .. table.concat(command.aliases, ", ") .. ")"
        end
        printFunction(command.name .. aliases .. (command.description and " - " .. command.description or ""))
    end
end
