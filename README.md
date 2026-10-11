# Uwowea Core

Core utilities shared by Uwowea addons.

## Requirements

- World of Warcraft
- The addon is loaded as `Uwowea_Core`

The command system uses WoW's global `SlashCmdList` API. No additional
libraries are required.

## Installation

1. Place the Core project folder in your WoW `Interface/AddOns` directory.
2. Ensure the installed addon folder is named `Uwowea_Core`.
3. Enable **Uwowea Library: Core** in the AddOns list, then reload the game UI.

For a consuming addon, declare Core as a dependency in its `.toc` file so the
global `Commands` API is loaded before the addon code runs:

```text
## Dependencies: Uwowea_Core
```

## Usage

The addon exposes the global `Commands` registry. Add `Uwowea_Core` as a
dependency and create a registry during addon initialization:

```lua
local commands = Commands.New("MY_ADDON", "/myaddon")
```

The complete command setup is documented below.

## Command system

`Commands.lua` provides a registry for WoW chat commands. A registry owns one
`SlashCmdList` entry and can contain any number of subcommands.

### Basic usage

```lua
local commands = Commands.New("SELFBUFFTRACKER", {
    "/sbt",
    "/buff",
})

commands:AddCommand(Commands.Command(
    "add",
    function(spell)
        print("Adding buff:", spell)
    end,
    "Adds a buff to track",
    nil,
    true
))

commands:AddCommand(Commands.Command(
    "remove",
    function(spell)
        print("Removing buff:", spell)
    end,
    "Removes a buff from tracking",
    { "del" }
))

commands:Register()
```

This creates the following WoW slash command registration:

```lua
SLASH_SELFBUFFTRACKER1 = "/sbt"
SLASH_SELFBUFFTRACKER2 = "/buff"
SlashCmdList["SELFBUFFTRACKER"] = ...
```

The commands can then be used as:

```text
/sbt add Well Fed
/buff del Well Fed
```

The `add` command above uses raw argument mode, so all text after `add` is
passed to the handler as one value. Whitespace does not need to be grouped
with quotes:

```lua
function(spell)
    -- spell == "Well Fed"
end
```

`Register()` should be called once after all subcommands have been added.
Calling it again, or using a `SlashCmdList` key that is already registered,
raises an error instead of silently replacing an existing handler.

### API

#### `Commands.New(name, slashCommands)`

Creates a command registry.

* `name` is the uppercase key used in `SlashCmdList`. It may contain letters,
  numbers, and underscores, but must start with a letter.
* `slashCommands` is one slash alias or a table of aliases. The leading `/`
  is added automatically when it is omitted.

```lua
local commands = Commands.New("MY_ADDON", "/myaddon")
```

#### `Commands.Command(name, handler, description, aliases, rawArguments)`

Creates a subcommand definition.

* `name` is the subcommand name.
* `handler` is called with the parsed arguments as positional values.
* `description` is shown by `PrintHelp()`.
* `aliases` is an optional table of subcommand aliases.
* `rawArguments` is an optional boolean. When `true`, the complete text after
  the subcommand name is passed to the handler as one string.

Handlers can use any parameter names they need:

```lua
commands:AddCommand(Commands.Command(
    "configure",
    function(option, value)
        print("Option:", option)
        print("Value:", value)
    end,
    "Changes a configuration value",
    { "config", "set" }
))
```

The following calls all resolve to the same handler:

```text
/myaddon configure iconSize 64
/myaddon config iconSize 64
/myaddon set iconSize 64
```

Subcommand names and aliases are case-insensitive.

#### `registry:AddCommand(command)`

Adds a command to the registry. Duplicate names and aliases raise an error.

#### `registry:Register()`

Registers all slash aliases and creates the `SlashCmdList` dispatcher. The
dispatcher executes the matching subcommand and prints the command help when
the subcommand is unknown.

#### `registry:Execute(message)`

Executes a command message without going through WoW's chat system. This is
useful for tests or other integrations.

The method returns `false` when no subcommand matches. For a matching command
it returns `true` followed by the return values of the handler.

```lua
local handled, result = commands:Execute("configure iconSize 64")
```

#### `registry:PrintHelp(printFunction)`

Prints every registered subcommand. The optional `printFunction` can be
provided to capture or redirect the output; it defaults to WoW's `print`.

### Argument parsing

Arguments are split on whitespace. Single and double quotes group text into a
single argument, and the quote characters are removed:

```text
/sbt add "Power Word: Fortitude"
/sbt add 'Well Fed'
```

The handler receives:

```lua
function(spell)
    -- spell == "Power Word: Fortitude"
end
```

The command name itself is removed before the handler is called. An empty
argument list therefore calls the handler with no arguments. Quoting is
intended for grouping arguments; escape sequences are not interpreted.

For commands that operate on free-form text, use raw argument mode instead:

```lua
commands:AddCommand(Commands.Command(
    "add",
    function(spell)
        print("Adding:", spell)
    end,
    "Adds a spell by name",
    nil,
    true
))
```

This accepts `/myaddon add Power Word: Fortitude` and passes
`"Power Word: Fortitude"` as a single handler argument.

## Spell API

The Core addon exposes spell helpers through the global `Core.Spells` table.
The spell files are loaded by `Uwowea_Core.toc`, so consuming addons only need
to declare `Uwowea_Core` as a dependency.

### `Core.Spells:GetInfo(spellIdentifier)`

Returns the WoW `SpellInfo` object for a spell ID or spell name:

```lua
local info = Core.Spells:GetInfo(12345)
if info then
    print(info.name, info.iconID)
    print(info:IsHelpful())
end
```

The result is cached by the identifier. The method returns `nil` when the
spell cannot be resolved or when the client does not provide
`C_Spell.GetSpellInfo`.

The returned value is a `Core.SpellInfo` object extending WoW's `SpellInfo`
structure. It keeps the original spell fields and adds methods that use its
own `spellID`:

```lua
local info = Core.Spells:GetInfo(12345)
if info and info:IsHelpful() then
    print(info.name, "is helpful")
end

if info and info:IsHarmful() then
    print(info.name, "is harmful")
end
```

These methods do not require the spell ID as an argument.

### `Core.Spells:GetOverrides(spellIdentifier)`

Returns a list of override spell IDs for the supplied spell ID or name. The
result includes both Core's known aura overrides and the override returned by
the WoW API when available:

```lua
for _, overrideSpellID in ipairs(Core.Spells:GetOverrides(spellID)) do
    print("Override:", overrideSpellID)
end
```

The result is always a table and can be empty.

### `Core.Spells:GetBaseSpell(spellIdentifier)`

Returns the base spell ID for an override spell, or `nil` when no base spell
can be found:

```lua
local baseSpellID = Core.Spells:GetBaseSpell(spellID)
if baseSpellID then
    print("Base spell:", baseSpellID)
end
```

The helper checks Core's custom override map first and then uses
`C_Spell.GetBaseSpell` when that API is available. Spell API calls are guarded
so addons can load without failing on clients that do not expose the
corresponding `C_Spell` functions.

## Unit API

`Core.Unit` provides an object-oriented proxy over WoW's global `Unit*`
functions. Create an object for a unit token with `Core.Unit.Get()`:

```lua
local player = Core.Player
local target = Core.Target

print(player:Name())
print(player:Class())
print(player:IsDeadOrGhost())

if target:Exists() and player:IsUnit("target") then
    print("The target is the player")
end
```

`Core.Unit` also exposes ready-to-use instances for the standard WoW unit
tokens:

```lua
Core.Unit.Player
Core.Unit.Target
Core.Unit.Focus
Core.Unit.Mouseover
Core.Unit.Pet
Core.Unit.Vehicle

Core.Unit.Party1
Core.Unit.Raid40
Core.Unit.Arena5
Core.Unit.Boss5
Core.Unit.Nameplate40
```

Use `Core.Unit.Get()` for a custom or suffixed token, such as `targettarget`
or `partypet1`.

The proxy automatically maps shortened method names to the corresponding WoW
function:

| Proxy method | WoW function |
| --- | --- |
| `unit:Name()` | `UnitName(unitToken)` |
| `unit:Class()` | `UnitClass(unitToken)` |
| `unit:IsDeadOrGhost()` | `UnitIsDeadOrGhost(unitToken)` |
| `unit:Exists()` | `UnitExists(unitToken)` |
| `unit:IsUnit(otherToken)` | `UnitIsUnit(unitToken, otherToken)` |

The full WoW function name is also supported when useful:

```lua
local health = player:UnitHealth()
local power = player:UnitPower(0)
```

The documented Unit functions are implemented as real methods on the proxy.
The unit token is automatically supplied as the first argument and additional
arguments are passed through unchanged.

Any newer global function whose name starts with `Unit` can still be called
through the dynamic fallback without requiring another wrapper in Core.

The Core methods and LuaLS annotations are generated from WoW's
`UnitDocumentation`, so autocomplete includes the documented method names,
parameters, and return values. For functions with multiple return values, all
return types are exposed as a LuaLS tuple:

```lua
local mainHand, offHand, ranged = Core.Unit.Player:WeaponAttackPower()
```

Lua does not preserve names for multiple assigned return values, so use
descriptive local variable names in the assignment. The runtime forwards the
exact values and return values provided by the WoW API.

`Core.Unit.Get()` validates only that the token is a non-empty string. It does
not require the unit to exist, so objects can safely be created for dynamic
tokens such as `party1`, `raid5`, or `nameplate3`. The underlying WoW function
determines the return values for invalid or unavailable units.

## Game information

The Core addon exposes information about the current WoW client through
`Core.GameInfo`. It is initialized automatically when `GameInfo.lua` loads.

### `Core.GameInfo`

The object contains the values returned by WoW's `GetBuildInfo()`:

```lua
local gameInfo = Core.GameInfo

print(gameInfo.buildVersion)
print(gameInfo.buildNumber)
print(gameInfo.buildDate)
print(gameInfo.interfaceVersion)
print(gameInfo.localizedVersion)
print(gameInfo.buildInfo)
print(gameInfo.currentVersion)
```

The detected game type is available as `gameInfo.type`:

```lua
if gameInfo.type then
    print(gameInfo.type.name)
    print(gameInfo.type.interfaceVersion)
    print(gameInfo.type.expansionLevel)
end
```

Supported game types are available through `Core.GameType`, including
`CLASSIC`, `FOREVER`, `TBC`, `WOTLK`, `CATACLYSM`, `MOP`, `WOD`, `Legion`,
`BFA`, `SL`, `DF`, `TWW`, `Midnight`, and `LastTitan`.

### Methods

#### `Core.GameInfo:Init()`

Reads the current build information from `GetBuildInfo()` and updates the
object. The method is called automatically during Core initialization.

#### `Core.GameInfo:IsInicialized()`

Returns whether the game information has been initialized. The method keeps
the existing `IsInicialized` spelling for API compatibility.

#### `Core.GameInfo:CheckInit()`

Initializes the object if necessary and returns `true`:

```lua
Core.GameInfo:CheckInit()
```

#### `Core.GameInfo.Is(gameName)`

Checks a game type by its constant name or localized display name:

```lua
if Core.GameInfo.Is("The Burning Crusade") then
    print("Running on TBC")
end
```

#### `Core.GameInfo:GetGameVersion()`

Prints the current build and interface version values to the chat frame. Use
the fields on `Core.GameInfo` when the values need to be consumed by addon
logic rather than displayed.

## Development

`Uwowea_Core.toc` is the addon manifest and lists the Lua files loaded by WoW.
Add new runtime files to that manifest in the order required by their
dependencies. `Commands.lua` must be loaded before code that uses the
`Commands` global. `Core.lua` initializes `Core.Spells` before
`AuraOverrides.lua` and `Spells.lua` are loaded.

### LuaLS type information in consuming addons

To make the Core types available to LuaLS in another addon, add this Core
project's path to that addon's `.luarc.json` under `workspace.library`. For
example, use `"../Core"` when the addon and Core project are sibling
directories. Add the path to the existing list rather than replacing other
library paths.

The command registry is defined as the global `Commands` type, so consuming
code can use it directly:

```lua
local Commands = _G["Commands"]
```

Do not add `---@type Commands` to this local alias; LuaLS can infer its type
from the workspace definition.

### Troubleshooting

- If `Commands` is `nil`, verify that `Uwowea_Core` is installed, enabled, and
  listed in the consuming addon's `.toc` dependencies.
- If slash commands do not respond, verify that `commands:Register()` is
  called after all subcommands are added and that the `SlashCmdList` key is not
  already used by another addon.
- If the command appears in chat but a multi-word value is split into several
  arguments, enable `rawArguments` for that subcommand or use quotes around
  the value.

## License

Uwowea Core is distributed under the [MIT License](./LICENSE).
