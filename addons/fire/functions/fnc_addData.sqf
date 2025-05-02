#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Parses nearby fire to activeFires array, ensuring no duplicates
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fire_fnc_addData
 */

call EFUNC(common,nearFire) params ["_nearbyFires", "_isInflamed"];

if (_nearbyFires isEqualTo []) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "No nearby fires detected."] call EFUNC(common,debugMessage);
};

private _nearbyFire = _nearbyFires select 0;

if (GVAR(activeFires) findIf {_nearbyFire isEqualTo (_x select 0)} >= 0) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Fire %1 at %2 already tracked in activeFires.", _nearbyFire, getPosATL _nearbyFire]] call EFUNC(common,debugMessage);
};

private _fuelType = switch (true) do {
    case (_nearbyFire isKindOf "Land_MetalBarrel_F" || _nearbyFire isKindOf "MetalBarrel_burning_F"): {"barrel"};
    case (_nearbyFire isKindOf "Land_Campfire_F" || _nearbyFire isKindOf "Campfire_burning_F"): {"big"};
    default {"small"};
};

// Assign burn time
private _burnTimeLeft = [2700, 5400, 7200] select (["small", "big", "barrel"] find _fuelType);
if (_isInflamed) then {
    _burnTimeLeft = _burnTimeLeft * 0.75; // Reduce burn time for already burning fires (editor placed)
};

GVAR(activeFires) pushBack [_nearbyFire, _fuelType, _burnTimeLeft];
publicVariable QGVAR(activeFires);

[QUOTE(COMPONENT_BEAUTIFIED), format ["Added %1 fire %2 at %3 to activeFires with %4s burn time.", _fuelType, _nearbyFire, getPosATL _nearbyFire, _burnTimeLeft]] call EFUNC(common,debugMessage);
