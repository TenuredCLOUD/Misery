#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Take Money UI exit
 * Resets variables
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_exitTaking;
 *
*/

private _target = ACE_player getVariable [QGVAR(searchTarget), objNull];

if (_target isNotEqualTo objNull) then {
    ACE_player setVariable [QGVAR(searchTarget), nil];
};
