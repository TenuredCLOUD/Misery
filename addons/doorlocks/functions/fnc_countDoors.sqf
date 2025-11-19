#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Grabs number of doors from object config
 * Also runs model check and ignores models known to not lock
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Doors <NUMBER>
 * 1: Nearest Building <OBJECT>
 * 2: No lock <BOOL>
 *
 * Example:
 * [] call misery_doorlocks_fnc_countDoors
 *
*/

private _building = cursorObject;

if !(_building isKindOf "House") exitWith {
    [0, objNull, true];
};

if (player distance _building > 25) exitWith {
    [0, objNull, true];
};

private _config = [_building] call CBA_fnc_getObjectConfig;

private _doorCount = getNumber (_config >> "numberOfDoors");

private _model = toLower ((getModelInfo _building) select 0);

private _hasNoLock = _model in [MACRO_NODOORLOCK_MODELS];

[_doorCount, _building, _hasNoLock]
