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
 * [] call misery_safezone_fnc_process
*/

[QEGVAR(common,tileText), localize LSTRING(Entered)] call CBA_fnc_localEvent;

// Handle Damage
ACE_player allowDamage false;
ACE_player setVariable [QACEGVAR(medical,allowDamage), false, true];

private _index = ACE_player addEventHandler ["Fired", {
    params ["", "", "", "", "", "", "_projectile"];

    deleteVehicle _projectile;
}];

ACE_player setVariable [QGVAR(index), _index];

// PFH monitoring when the player leaves the safezone.
[{
    params ["_args", "_handle"];

    private _leftSafeZone = GVAR(areasCached) findIf {ACE_player inArea _x} isEqualTo -1;

    if (_leftSafeZone) exitWith {
        ACE_player allowDamage true;
        ACE_player setVariable [QACEGVAR(medical,allowDamage), true, true];

        private _index = ACE_player getVariable [QGVAR(index), 0];
        ACE_player removeEventHandler ["Fired", _index];
        [QEGVAR(common,tileText), localize LSTRING(Left)] call CBA_fnc_localEvent;

        ACE_player setVariable [QGVAR(insideArea), false, true];

        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 1] call CBA_fnc_addPerFrameHandler;
