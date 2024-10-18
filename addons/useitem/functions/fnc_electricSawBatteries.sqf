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

if ("Misery_18vbat" in items player) then {

player removeitem "Misery_electrichandsawnobattery";

titleText ["You add a battery to your saw...", "PLAIN DOWN"];

player removeitem "Misery_18vbat";

player additem "Misery_electrichandsaw";

} else {

  titleText ["You don't have any 18v batteries...", "PLAIN DOWN"];

};
