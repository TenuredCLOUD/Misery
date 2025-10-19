#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Action to add batteries into handheld electric saw
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_misc_fnc_electricSawBatteries;
 *
 * Public: No
*/

if ([[QCLASS(18vBattery)]] call EFUNC(common,hasItem)) then {
    player removeItem QCLASS(electricHandSaw_NoBattery);
    player removeItem QCLASS(18vBattery);
    [player, QCLASS(electricHandsaw), true] call CBA_fnc_addMagazine;
};
