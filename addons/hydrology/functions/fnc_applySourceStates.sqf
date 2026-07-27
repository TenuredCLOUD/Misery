#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Applies restored water source states from GRAD Persistence
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hydrology_fnc_applySourceStates;
 *
 * Public: No
*/

if (!isServer) exitWith {};

private _masterWaterMap = missionNamespace getVariable [QGVAR(wellStates), createHashMap];

if (count _masterWaterMap isEqualTo 0) exitWith {};

{
    missionNamespace setVariable [_x, _y, true];
} forEach _masterWaterMap;
