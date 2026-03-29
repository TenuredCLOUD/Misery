#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Processes entered PIN
 *
 * Arguments:
 * 0: PIN <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_doorlocks_fnc_processPin
 *
*/

params ["_pin"];

call FUNC(countDoors) params ["", "_building"];

if (_building isEqualTo objNull) exitWith {};

if (GVAR(pinMode) isEqualTo 0) then {
    _building setVariable [QGVAR(doorPin), _pin, true];
    private _pinSetTip = format ["Locking PIN has been set: %1", [_pin, 1, 0, false]call CBA_fnc_formatNumber];
    [player, QCLASS(lockKit)] call CBA_fnc_removeItem;
    [_pinSetTip, 1, [1, 1, 1, 1]] call CBA_fnc_notify;
    [] call FUNC(enableLocks);
    [_building, true, _pin] call FUNC(updateBuildingState);
} else {
    private _saved = _building getVariable [QGVAR(doorPin), 0];
    if (_pin isEqualTo _saved) then {
        if (_building getVariable [QGVAR(doorsLocked), false]) then {
            [] call FUNC(disableLocks);
            [_building, false, _saved] call FUNC(updateBuildingState);
        } else {
            [] call FUNC(enableLocks);
            [_building, true, _saved] call FUNC(updateBuildingState);
        };
    } else {
        ["Wrong PIN...", 1, [1, 0, 0, 1]] call CBA_fnc_notify;
    };
};

GVAR(pinMode) = nil;

