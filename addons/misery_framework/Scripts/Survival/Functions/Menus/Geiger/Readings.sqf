/*
Misery Geiger UI Reading updater 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

waitUntil {sleep 1; !isNull findDisplay 982344};

While {!isNull findDisplay 982344} do {  
 
_RadReading = format ["%1 mSv", round (player getVariable ["MiseryRadiation",0])];
ctrlSetText [1000, _RadReading];

sleep 0.25;
};

