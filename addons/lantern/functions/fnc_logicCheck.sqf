#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Logic watchdog
 * Checks if lantern logic is still "allowed"
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_lantern_fnc_logicCheck
 *
*/

[{
    if !([[QCLASS(lantern_On)]] call EFUNC(common,hasItem)) exitWith {
        if (!isNil {player getVariable [QGVAR(state), nil]}) then {
            private _lantern = player getVariable [QGVAR(state), nil];
            [QGVAR(deleteLantern), [_lantern]] call CBA_fnc_globalEvent;
            player setVariable [QGVAR(state), nil, true];
        };
    };
}, [], 1] call CBA_fnc_waitAndExecute;
