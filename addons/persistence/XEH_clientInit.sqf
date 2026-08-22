#include "script_component.hpp"

if !(hasInterface) exitWith {};

GVAR(blockSave) = false;

["CBA_loadingScreenDone", {
    [] call FUNC(init);
}] call CBA_fnc_addEventHandler;
