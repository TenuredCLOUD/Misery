/*
Misery THBD stim (rad removal)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

MiseryACE=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=TRUE};

if (!hasInterface) exitWith {};

//ACE med ajustment:
  if (MiseryACE) then {
  [player, "Misery_ThrombomodulinStimpack", 120, 600, 1, 0, 1] call ace_medical_status_fnc_addMedicationAdjustment;
  };

titleText ["You use the Thrombomodulin Stimpack...", "PLAIN DOWN"];

    player removeitem "Misery_ThrombomodulinStimpack";

sleep 5;

//This snippet is an altered version from Anti rad pills usage from Ravage mod, permission was requested before use:
_compteur = 0;
player setVariable ["_antirad", true];
if (isNil {player getVariable "radMonitorON"}) then {

};
while {_compteur < 5000} do {
	_effectSpeed = 75 + random 25;
	player setVariable ["_radToRemove", ((player getVariable ["_radToRemove", 0]) + _effectSpeed)];
	_compteur = _compteur + _effectSpeed;
	sleep 1;
};
player setVariable ["_antirad", nil];

    
   