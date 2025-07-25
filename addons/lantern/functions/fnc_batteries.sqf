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
    private _noBattery = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You don't have any 9v batteries..."];
    [QEGVAR(common,tileText), _noBattery] call CBA_fnc_localEvent;
};

if !([[QCLASS(lantern_NoBattery)]] call EFUNC(common,hasItem)) exitWith {
    private _noLantern = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You don't have a lantern that needs battery's..."];
    [QEGVAR(common,tileText), _noLantern] call CBA_fnc_localEvent;
};

{
    [player, _x] call CBA_fnc_removeItem
} forEach [QCLASS(lantern_NoBattery), QCLASS(9vBattery)];

private _batteryAdded = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You add a 9v battery to your lantern"];
[QEGVAR(common,tileText), _batteryAdded] call CBA_fnc_localEvent;

[player, QCLASS(lantern_Off), true] call CBA_fnc_addItem

