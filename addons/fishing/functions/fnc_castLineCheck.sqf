#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks if player has gear to enable cast line button
 *
 * Arguments:
 * 0: Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_control] call misery_fishing_fnc_castLineCheck
 *
*/

params ["_control"];

if !([] call FUNC(hasGear)) then {
    _control ctrlEnable false;
} else {
    _control ctrlEnable true;
};
