#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Updates global building states
 *
 * Arguments:
 * 0: Building <OBJECT>
 * 1: Doors Locked <BOOL>
 * 2: PIN <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_doorlocks_fnc_updateBuildingState
 *
 */

params ["_building", "_doorsLocked", ["_pin", 0]];

if (isNull _building) exitWith {};

private _posStr = str (getPosATL _building);  // Key buildings by pos
private _states = missionNamespace getVariable [QGVAR(buildingStates), []];

private _index = _states findIf {(_x select 0) isEqualTo _posStr};
if (_index isNotEqualTo -1) then {
    _states set [_index, [_posStr, _doorsLocked, _pin]];
} else {
    _states pushBack [_posStr, _doorsLocked, _pin];
};

missionNamespace setVariable [QGVAR(buildingStates), _states, true];
