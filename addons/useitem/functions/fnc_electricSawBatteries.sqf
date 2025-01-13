#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Skillsaw batteries
 * Action to add batteries into handheld electric saw
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_useitem_fnc_electricSawBatteries;
 *
 * Public: No
*/

if ([[QCLASS(18vBattery)]] call EFUNC(common,hasItem)) then {

player removeItem QCLASS(electricHandSaw_NoBattery);

titleText ["You add a battery to your saw...", "PLAIN DOWN"];

player removeItem QCLASS(18vBattery);

player addItem QCLASS(electricHandsaw);

} else {

  titleText ["You don't have any 18v batteries...", "PLAIN DOWN"];

};
