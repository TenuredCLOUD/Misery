#include "script_component.hpp"

if !(GVAR(enabled)) exitWith {};

GVAR(dsa) = ["DSA_Spooks"] call EFUNC(common,isModLoaded);
GVAR(ravage) = ["ravage"] call EFUNC(common,isModLoaded);
GVAR(remnant) = ["remnant"] call EFUNC(common,isModLoaded);
GVAR(webZC) = ["WBK_ZombieCreatures"] call EFUNC(common,isModLoaded);
GVAR(modifiers) = 0;
GVAR(sleepBlocked) = false;
GVAR(terrifiedState) = false;

["CBA_loadingScreenDone", {
    if (hasInterface) then {
        [] call FUNC(loop);

        [QGVAR(update), FUNC(effects)] call CBA_fnc_addEventHandler;

        call FUNC(heartFlutter);
    };
}] call CBA_fnc_addEventHandler;

GVAR(randomTextLines) = [
    [localize LSTRING(LingeringPresence), localize LSTRING(BeingWatched), localize LSTRING(Uneasy)],
    [localize LSTRING(ShadowsMoving), localize LSTRING(WatchingMe), localize LSTRING(FollowDarkness)]
];

GVAR(modifiers) = 0;
