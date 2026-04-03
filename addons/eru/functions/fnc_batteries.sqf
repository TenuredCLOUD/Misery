#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * ERU batteries
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_eru_fnc_batteries
 *
*/

if !([[QCLASS(lithiumBattery)]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), localize ECSTRING(common,NoLithiumBatteries)] call CBA_fnc_localEvent;
};

if !([[QCLASS(eru_NoBattery)]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), localize ECSTRING(common,NoERUNeedsBatteries)] call CBA_fnc_localEvent;
};

{
    [player, _x] call CBA_fnc_removeItem
} forEach [QCLASS(eru_NoBattery), QCLASS(lithiumBattery)];

[QEGVAR(common,tileText), localize ECSTRING(common,AddBatteryToERU)] call CBA_fnc_localEvent;

[player, QCLASS(eru_Off), true] call CBA_fnc_addItem;
