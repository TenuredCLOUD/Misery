#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Simulates lock Install to building
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_doorlocks_fnc_installLocks
 *
*/

if (GVAR(areas) findIf {player inArea _x} isNotEqualTo -1) exitWith {
    [localize ECSTRING(common,CannotInstallLock), 1, [1, 1, 1, 1]] call CBA_fnc_notify;
};

if !([[QCLASS(lockKit)]] call EFUNC(common,hasItem)) exitWith {
    [localize ECSTRING(common,NoLockKit), 1, [1, 1, 1, 1]] call CBA_fnc_notify;
};

[] call FUNC(promptPin);
