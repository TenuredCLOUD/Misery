#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Load treatment
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_treatment_fnc_loadTreatment;
 *
*/

private _trader = player getVariable [QGVAR(currentDoctor), objNull];

if (isNull _trader) exitWith {(findDisplay 982381) closeDisplay 2};

_trader setVariable [QGVAR(isTreating), true, true];
