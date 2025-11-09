#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Applies lock states to buildings
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_doorlocks_fnc_applyBuildingStates
 *
 */

if (!isServer) exitWith {};

private _states = missionNamespace getVariable [QGVAR(buildingStates), []];
{
    _x params ["_posStr", "_doorsLocked", "_pin"];
    private _pos = call compile _posStr;
    private _building = nearestBuilding _pos;
    if (!isNull _building) then {
        if (_doorsLocked) then {
            _building setVariable [QGVAR(doorsLocked), true, true];
            private _config = [_building] call CBA_fnc_getObjectConfig;
            private _doorCount = getNumber (_config >> "numberOfDoors");
            for "_i" from 1 to _doorCount do {
                _building setVariable [format ["bis_disabled_Door_%1", _i], 1, true];
            };
        };
        if (_pin isNotEqualTo 0) then {
            _building setVariable [QGVAR(doorPin), _pin, true];
        };
    };
} forEach _states;
