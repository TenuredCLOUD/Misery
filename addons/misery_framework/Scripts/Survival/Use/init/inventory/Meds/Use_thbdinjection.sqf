/* -----------------------------------
Misery THBD injection (non-stim) (rad removal)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

MiseryACE=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=TRUE};

if (!hasInterface) exitWith {};

if (MiseryACE) then {
[player, "Misery_Thrombomodulin", 120, 300, 1, 0, 1] call ace_medical_status_fnc_addMedicationAdjustment;
};

titleText ["You inject the Thrombomodulin...", "PLAIN DOWN"];

player removeitem "Misery_Thrombomodulin";

sleep 5;

//This snippet is an altered version from Anti rad pills usage from Ravage mod, permission was requested before use:
_compteur = 0;
player setVariable ["_antirad", true];
if (isNil {player getVariable "radMonitorON"}) then {
	0 = [] spawn rvg_fnc_radMonitor;
};
while {_compteur < 2500} do {
	_effectSpeed = 50 + random 25;
	player setVariable ["_radToRemove", ((player getVariable ["_radToRemove", 0]) + _effectSpeed)];
	_compteur = _compteur + _effectSpeed;
	sleep 1;
};
player setVariable ["_antirad", nil];

 