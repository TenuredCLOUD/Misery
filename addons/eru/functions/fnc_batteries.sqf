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
    [QEGVAR(common,tileText), "You don't have any lithium batteries..."] call CBA_fnc_localEvent;
};

if !([[QCLASS(eru_NoBattery)]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), "You don't have an ERU that needs batteries..."] call CBA_fnc_localEvent;
};

{
    [player, _x] call CBA_fnc_removeItem
} forEach [QCLASS(eru_NoBattery), QCLASS(lithiumBattery)];

[QEGVAR(common,tileText), "You add a lithium battery to your ERU"] call CBA_fnc_localEvent;

[player, QCLASS(eru_Off), true] call CBA_fnc_addItem;
