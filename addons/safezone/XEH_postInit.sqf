#include "script_component.hpp"

if (isServer) then {
    call FUNC(inArea);
};

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {
    [QGVAR(safeZoneEvent), FUNC(process)] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
