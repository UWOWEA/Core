
---@param name string
---@param parent Frame
---@return Button
local function testFunction(name, parent)
    local container = CreateFrame("Button", name, parent, "BackdropTemplate")

    return container
end
