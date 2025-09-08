#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Geiger batteries
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_geiger_fnc_batteries
 *
*/

if !([[QCLASS(lithiumBattery)]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), "You don't have any lithium batteries..."] call CBA_fnc_localEvent;
};

if !([[QCLASS(geiger_NoBattery)]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), "You don't have a geiger that needs batteries..."] call CBA_fnc_localEvent;
};

{
    [player, _x] call CBA_fnc_removeItem
} forEach [QCLASS(geiger_NoBattery), QCLASS(lithiumBattery)];

[QEGVAR(common,tileText), "You add a lithium battery to your geiger"] call CBA_fnc_localEvent;

[player, QCLASS(geiger_Off), true] call CBA_fnc_addItem;
