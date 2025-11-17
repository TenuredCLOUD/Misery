#include "script_component.hpp"

if !(GVAR(enabled)) exitWith {};

GVAR(dsa) = ["DSA_Spooks"] call EFUNC(common,isModLoaded);
GVAR(ravage) = ["ravage"] call EFUNC(common,isModLoaded);
GVAR(remnant) = ["remnant"] call EFUNC(common,isModLoaded);
GVAR(webZC) = ["WBK_ZombieCreatures"] call EFUNC(common,isModLoaded);
GVAR(modifiers) = 0;
GVAR(sleepBlocked) = false;
GVAR(terrifiedState) = false;

["CBA_settingsInitialized", {
    if (hasInterface) then {
        [] call FUNC(loop);

        [QGVAR(update), FUNC(effects)] call CBA_fnc_addEventHandler;

        // Add heart fluttering if ACE is loaded
        if ("ace_main" call EFUNC(common,isModLoaded)) then {
            call FUNC(heartFlutter);
        };
    };
}] call CBA_fnc_addEventHandler;

GVAR(randomTextLines) = [
    ["You feel a lingering presence..", "You feel like you're being watched..", "You feel uneasy.."],
    ["The shadows are moving..", "They're watching me..", "They follow in the darkness.."]
];

GVAR(modifiers) = 0;
