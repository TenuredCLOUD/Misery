#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Headlamp batteries
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_headlamp_fnc_batteries
 *
*/

if ("Misery_9vbat" in items player) then {

player removeItem "Misery_Headlamp_NB";

titleText ["You add a 9v battery to your Headlamp", "PLAIN DOWN"];

player removeItem "Misery_9vbat";

player addItem "Misery_HeadlampOFF";

} else {
titleText ["You don't have any 9v batteries...", "PLAIN DOWN"];
};
