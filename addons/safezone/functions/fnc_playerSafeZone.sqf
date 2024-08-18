#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Client handling of inside safezone.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_safezone_fnc_playerSafeZone
*/

[QEGVAR(common,titleText), "You are entering a safezone.."] call CBA_fnc_localEvent;

// Handle Damage
player allowDamage false;
player setVariable ["ace_medical_allowDamage", true, true];

private _index = player addEventHandler ["Fired", {
    params ["", "", "", "", "", "", "_projectile"];

    deleteVehicle _projectile;
}];

player setVariable [QGVAR(index), _index];

// PFH monitoring when the player leaves the safezone.
[{
    params ["_args", "_handle"];

    private _leftSafeZone = GVAR(safezoneAreas) findIf {player inArea _x} == -1;

    if (_leftSafeZone) exitWith {
        player allowDamage true;
        player setVariable ["ace_medical_allowDamage", false, true];

        private _index = player getVariable [QGVAR(index), 0];
        player removeEventHandler ["Fired", _index];
        [QEGVAR(common,titleText), "You have left a safezone.."] call CBA_fnc_localEvent;

        player setVariable [QGVAR(insideSafeZone), false, true];

        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 1] call CBA_fnc_addPerFrameHandler;
