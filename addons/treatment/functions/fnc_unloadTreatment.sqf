#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Unload treatment
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_treatment_fnc_unloadTreatment;
 *
*/

private _trader = player getVariable [QGVAR(currentDoctor), objNull];

if (!isNull _trader) then {
    _trader setVariable [QGVAR(isTreating), false, true];
};

player setVariable [QGVAR(currentDoctor), nil];
