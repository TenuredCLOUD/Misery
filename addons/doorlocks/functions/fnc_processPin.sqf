#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Processes entered PIN
 *
 * Arguments:
 * 0: PIN <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_doorlocks_fnc_processPin
 *
*/

params ["_pin"];

call FUNC(countDoors) params ["", "_building"];

if (_building isEqualTo objNull) exitWith {};

if (GVAR(pinMode) isEqualTo 0) then {
    [QGVAR(serverInstallLock), [ACE_player, _building, _pin]] call CBA_fnc_serverEvent;
} else {
    [QGVAR(serverToggleLock), [ACE_player, _building, _pin]] call CBA_fnc_serverEvent;
};

GVAR(pinMode) = nil;
