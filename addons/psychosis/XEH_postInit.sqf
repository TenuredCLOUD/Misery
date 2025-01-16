#include "script_component.hpp"

if (isServer) exitWith {};

GVAR(dsa) = ["DSA_Spooks"] call EFUNC(common,isModLoaded);
GVAR(ravage) = ["ravage"] call EFUNC(common,isModLoaded);
GVAR(remnant) = ["remnant"] call EFUNC(common,isModLoaded);
GVAR(additionalModifiers) = [];

[] call FUNC(loop);

[QGVAR(update), FUNC(effects)] call CBA_fnc_addEventHandler;

GVAR(randomTextLines) = [
    ["You feel a lingering presence..", "You feel like you're being watched..", "You feel uneasy.."],
    ["The shadows are moving..", "They're watching me..", "They follow in the darkness.."]
];
