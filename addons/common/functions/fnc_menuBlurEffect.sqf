#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Creates or removes blur effect for GUIs based on display existence
 *
 * Arguments:
 * 0: IDD <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [602] call misery_common_fnc_menuBlurEffect;
 */

params [["_idd", -1, [0]]];

if (!hasInterface) exitWith {};

[{!isNull findDisplay _this}, {
    params ["_idd"];

    [{
        if (!isNull findDisplay _this) then {
            GVAR(blurEffect) = ppEffectCreate ["DynamicBlur", 999];
            GVAR(blurEffect) ppEffectEnable true;
            GVAR(blurEffect) ppEffectAdjust [2];
            GVAR(blurEffect) ppEffectCommit 0.3;
        };
    }, _idd, 0.1] call CBA_fnc_waitAndExecute; // Nested delay to ensure "separate" effects for each display

    [{isNull findDisplay _this}, {

        GVAR(blurEffect) ppEffectEnable false;
        GVAR(blurEffect) ppEffectAdjust [0];
        GVAR(blurEffect) ppEffectCommit 0.3;
        ppEffectDestroy GVAR(blurEffect);
    }, _idd] call CBA_fnc_waitUntilAndExecute; // Nested effect termination check once gui is closed
}, _idd] call CBA_fnc_waitUntilAndExecute; // Initial check for display idd

