#include "script_component.hpp"

if (!isServer) exitWith {};
if (!GVAR(ambientWildlife)) exitWith {};

GVAR(registeredEntities) = [];

["CBA_loadingScreenDone", {
    [] call FUNC(loop);
}] call CBA_fnc_addEventHandler;
