#include "..\script_component.hpp"
/*
Misery comabt logger timeout
Designed specifically for Misery mod
by TenuredCLOUD
*/

waitUntil {!isNull (findDisplay 49)};
((findDisplay 49) displayCtrl 104) ctrlEnable false;
((findDisplay 49) displayCtrl 104) ctrlSetText format ["Please wait %1 seconds...", MiseryCombatlog];
uiSleep 0.1;
sleep MiseryCombatlog;
((findDisplay 49) displayCtrl 104) ctrlSetText ["LOGOUT",true];
uiSleep 0.1;
((findDisplay 49) displayCtrl 104) ctrlEnable true;
