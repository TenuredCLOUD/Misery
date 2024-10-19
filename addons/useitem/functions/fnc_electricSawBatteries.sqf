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

if ([["Misery_18vbat"]] call EFUNC(common,hasItem)) then {

player removeItem "Misery_electrichandsawnobattery";

titleText ["You add a battery to your saw...", "PLAIN DOWN"];

player removeItem "Misery_18vbat";

player addItem "Misery_electrichandsaw";

} else {

  titleText ["You don't have any 18v batteries...", "PLAIN DOWN"];

};
