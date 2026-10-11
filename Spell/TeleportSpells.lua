---@meta _

---@class Core.Spells
---@field TeleportSpells table<number, true>
Core.Spells.TeleportSpells = {
	-- Classic capital cities
	[3561] = true, -- Teleport: Stormwind
	[3562] = true, -- Teleport: Ironforge
	[3563] = true, -- Teleport: Undercity
	[3565] = true, -- Teleport: Darnassus
	[3566] = true, -- Teleport: Thunder Bluff
	[3567] = true, -- Teleport: Orgrimmar
	[32271] = true, -- Teleport: Exodar
	[32272] = true, -- Teleport: Silvermoon

	-- Outland and Northrend
	[33690] = true, -- Teleport: Shattrath
	[53140] = true, -- Teleport: Dalaran - Northrend

	-- Cataclysm and later capital cities
	[88342] = true, -- Teleport: Tol Barad
	[132621] = true, -- Teleport: Vale of Eternal Blossoms
	[176242] = true, -- Teleport: Warspear
	[176248] = true, -- Teleport: Stormshield
	[224869] = true, -- Teleport: Dalaran - Broken Isles
	[193759] = true, -- Teleport: Hall of the Guardian
	[281403] = true, -- Teleport: Boralus
	[281404] = true, -- Teleport: Dazar'alor
	[344587] = true, -- Teleport: Oribos
	[395277] = true, -- Teleport: Valdrakken
	[446540] = true, -- Teleport: Dornogal

	-- Mage portals
	[10059] = true, -- Portal: Stormwind
	[11416] = true, -- Portal: Ironforge
	[11417] = true, -- Portal: Orgrimmar
	[11418] = true, -- Portal: Undercity
	[11419] = true, -- Portal: Darnassus
	[11420] = true, -- Portal: Thunder Bluff
	[11421] = true, -- Portal: Theramore
	[11422] = true, -- Portal: Stonard
	[32266] = true, -- Portal: Exodar
	[32267] = true, -- Portal: Silvermoon
	[33691] = true, -- Portal: Shattrath
	[53142] = true, -- Portal: Dalaran - Northrend
	[88346] = true, -- Portal: Tol Barad
	[132626] = true, -- Portal: Vale of Eternal Blossoms
	[176244] = true, -- Portal: Warspear
	[176246] = true, -- Portal: Stormshield
	[224871] = true, -- Portal: Dalaran - Broken Isles
	[281400] = true, -- Portal: Boralus
	[281402] = true, -- Portal: Dazar'alor
	[344597] = true, -- Portal: Oribos
	[395289] = true, -- Portal: Valdrakken
	[446534] = true, -- Portal: Dornogal

	-- Mage movement teleports
	[212653] = true, -- Shimmer
	[212801] = true, -- Displacement

	-- Class and player utility teleports
	[556] = true, -- Astral Recall
	[18960] = true, -- Teleport: Moonglade
	[193753] = true, -- Dreamwalk
	[50977] = true, -- Death Gate
	[48020] = true, -- Demonic Circle: Teleport
	[119996] = true, -- Transcendence: Transfer
	[36554] = true, -- Shadowstep
	[1953] = true, -- Blink
}
