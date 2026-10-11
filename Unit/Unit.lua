---@meta _
---@class Core.Unit
---@field token string
Core.Unit = Core.Unit or {}
Core.Unit.__index = function(unit, methodName)
    local classMethod = rawget(Core.Unit, methodName)
    if classMethod then
        return classMethod
    end

    local globalName = methodName
    if globalName:sub(1, 4) ~= "Unit" then
        globalName = "Unit" .. globalName
    end

    local unitFunction = _G[globalName]
    if type(unitFunction) ~= "function" then
        return
    end

    local method = function(_, ...)
        return unitFunction(unit.token, ...)
    end
    rawset(unit, methodName, method)
    return method
end

---@param unitToken UnitToken
---@return Core.Unit
function Core.Unit.Get(unitToken)
    if type(unitToken) ~= "string" or unitToken == "" then
        error("Unit token must be a non-empty string", 2)
    end

    return setmetatable({
        token = unitToken,
    }, Core.Unit)
end
