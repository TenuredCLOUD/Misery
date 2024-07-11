/*
Misery comabt logger timeout
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

waitUntil {!isNull (findDisplay 49)};
((findDisplay 49) displayctrl 104) ctrlEnable false;
((findDisplay 49) displayctrl 104) ctrlSetText format ["Please wait %2 seconds...", true, MiseryCombatlog];
uisleep 0.1;
sleep MiseryCombatlog;
((findDisplay 49) displayctrl 104) ctrlSetText format ["LOGOUT",true];
uisleep 0.1;
((findDisplay 49) displayctrl 104) ctrlEnable true;