---@meta _

---@type Core.Unit
Core.Unit.Focus = Core.Unit.Get("focus")
---@type Core.Unit
Core.Unit.Mouseover = Core.Unit.Get("mouseover")
---@type Core.Unit
Core.Unit.Pet = Core.Unit.Get("pet")
---@type Core.Unit
Core.Unit.Vehicle = Core.Unit.Get("vehicle")
---@type Core.Unit
Core.Unit.NPC = Core.Unit.Get("npc")
---@type Core.Unit
Core.Unit.QuestNPC = Core.Unit.Get("questnpc")
---@type Core.Unit
Core.Unit.None = Core.Unit.Get("none")
---@type Core.Unit
Core.Unit.AnyEnemy = Core.Unit.Get("anyenemy")
---@type Core.Unit
Core.Unit.AnyFriend = Core.Unit.Get("anyfriend")
---@type Core.Unit
Core.Unit.AnyInteract = Core.Unit.Get("anyinteract")
---@type Core.Unit
Core.Unit.SoftEnemy = Core.Unit.Get("softenemy")
---@type Core.Unit
Core.Unit.SoftFriend = Core.Unit.Get("softfriend")
---@type Core.Unit
Core.Unit.SoftInteract = Core.Unit.Get("softinteract")

local tokenGroups = {
    { prefix = "Party", tokenPrefix = "party", count = 4 },
    { prefix = "Raid", tokenPrefix = "raid", count = 40 },
    { prefix = "Arena", tokenPrefix = "arena", count = 5 },
    { prefix = "Boss", tokenPrefix = "boss", count = 5 },
    { prefix = "Nameplate", tokenPrefix = "nameplate", count = 40 },
}

for _, group in ipairs(tokenGroups) do
    for index = 1, group.count do
        Core.Unit[group.prefix .. index] = Core.Unit.Get(group.tokenPrefix .. index)
    end
end
