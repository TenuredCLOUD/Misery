#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Handles psychosis when inside a radiation zone
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Psychosis alteration <NUMBER>
 *
 * Example:
 * [] call misery_psychosis_fnc_radiationZone
 *
*/

if !(EGVAR(cognito_hazard,enabled)) exitWith {0};

if (player getVariable [QEGVAR(cognito_hazard,insideArea), false]) exitWith {
    GVAR(unnaturalIncrease)
};
