#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Unload maintenance
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_unload;
 *
*/

private _vehicle = ACE_player getVariable [QGVAR(currentVehicle), objNull];

if (!isNull _vehicle) then {
    ACE_player setVariable [QGVAR(currentVehicle), objNull];
};
