#include "script_component.hpp"

if (!isServer) exitWith {};

if (!GVAR(enabled)) exitWith {};

GVAR(registeredEntities) = [];

["CBA_loadingScreenDone", {
    call FUNC(convertToArray);
    call FUNC(loop);
    call FUNC(patrol);
}] call CBA_fnc_addEventHandler;
