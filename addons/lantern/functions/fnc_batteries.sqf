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
    [QEGVAR(common,tileText), localize LSTRING(MissingBatteries)] call CBA_fnc_localEvent;
};

if !([[QCLASS(lantern_NoBattery)]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoBatteriesNeeded)] call CBA_fnc_localEvent;
};

{
    [player, _x] call CBA_fnc_removeItem
} forEach [QCLASS(lantern_NoBattery), QCLASS(9vBattery)];

[QEGVAR(common,tileText), localize LSTRING(AddedBattery)] call CBA_fnc_localEvent;

[player, QCLASS(lantern_Off), true] call CBA_fnc_addItem

