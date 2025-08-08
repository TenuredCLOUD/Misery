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
    private _noBattery = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You don't have any lithium batteries..."];
    [QEGVAR(common,tileText), _noBattery] call CBA_fnc_localEvent;
};

if !([[QCLASS(eru_NoBattery)]] call EFUNC(common,hasItem)) exitWith {
    private _noGeiger = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You don't have an ERU that needs batteries..."];
    [QEGVAR(common,tileText), _noGeiger] call CBA_fnc_localEvent;
};

{
    [player, _x] call CBA_fnc_removeItem
} forEach [QCLASS(eru_NoBattery), QCLASS(lithiumBattery)];

private _batteryAdded = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You add a lithium battery to your ERU"];
[QEGVAR(common,tileText), _batteryAdded] call CBA_fnc_localEvent;

[player, QCLASS(eru_Off), true] call CBA_fnc_addItem;
