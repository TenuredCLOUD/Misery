#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Lantern batteries
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_lantern_fnc_batteries
 *
*/

if !([[QCLASS(9vBattery)]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), "You don't have any 9v batteries..."] call CBA_fnc_localEvent;
};

if !([[QCLASS(lantern_NoBattery)]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), "You don't have a lantern that needs battery's..."] call CBA_fnc_localEvent;
};

{
    [player, _x] call CBA_fnc_removeItem
} forEach [QCLASS(lantern_NoBattery), QCLASS(9vBattery)];

[QEGVAR(common,tileText), "You add a 9v battery to your lantern"] call CBA_fnc_localEvent;

[player, QCLASS(lantern_Off), true] call CBA_fnc_addItem

