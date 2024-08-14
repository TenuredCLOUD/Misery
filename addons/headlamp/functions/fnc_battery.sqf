#include "..\script_component.hpp"
/*
Misery Headlmap batteries
Designed specifically for Misery mod
by TenuredCLOUD
*/

if ("Misery_9vbat" in items player) then {

player removeitem "Misery_Headlamp_NB";

titleText ["You add a 9v battery to your Headlamp", "PLAIN DOWN"];

player removeitem "Misery_9vbat";

player additem "Misery_HeadlampOFF";

} else {
titleText ["You don't have any 9v batteries...", "PLAIN DOWN"];
};
