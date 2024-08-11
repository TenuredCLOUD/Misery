/*
Misery Cigar usage
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\main\script_macros.hpp"

if (!hasInterface) exitWith {};
MiseryACE=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=TRUE};
private _MFear = player getVariable ["MiseryFear", MIS_FEAR];

	if !("rvg_matches" in magazines player || "Misery_lighter" in items player) exitWith {titleText ["You need a lighter or matches to smoke...", "PLAIN DOWN"];};
	
	
	if (alive player) then {

	if ("rvg_matches" in magazines player) then {

    titleText ["You light up a cigar...", "PLAIN DOWN"];

	 player removeitem "Misery_cigar";

  	playSound3D ["\z\misery\addons\audio\sounds\immersion\Matchsmoking.ogg", player, false, getPosASL player, 4, 1, 10];

	//Remove some fear due to cig smoking:
  if (MiseryFearenabled) then {
	player setVariable ["MiseryFear", (_MFear - 3)];
	if (_MFear <= 0) then {player setVariable ["MiseryFear", 0]};
  };

	sleep 1;

if (MiseryACE) then {
	[player, "Misery_cigar", 10, 300, -5, -5, -5] call ace_medical_status_fnc_addMedicationAdjustment; 
};

 //This snippet is an altered version from Anti rad pills usage from Ravage mod, permission was requested before use:
_compteur = 0;
player setVariable ["_antirad", true];
if (isNil {player getVariable "radMonitorON"}) then {

};
while {_compteur < 500} do {
	_effectSpeed = 1 + random 5;
	player setVariable ["_radToRemove", ((player getVariable ["_radToRemove", 0]) + _effectSpeed)];
	_compteur = _compteur + _effectSpeed;
	sleep 1;
};
player setVariable ["_antirad", nil];

}else {

if ("Misery_lighter" in items player) then {

    titleText ["You light up a cigar...", "PLAIN DOWN"];

  	playSound3D ["\z\misery\addons\audio\sounds\immersion\Lightersmoking.ogg", player, false, getPosASL player, 4, 1, 10];

    player removeitem "Misery_cigar";

	//Remove some fear due to cig smoking:
  if (MiseryFearenabled) then {
	player setVariable ["MiseryFear", (_MFear - 3)];
	if (_MFear <= 0) then {player setVariable ["MiseryFear", 0]};
  };

	sleep 1;

if (MiseryACE) then {
	[player, "Misery_cigar", 10, 300, -5, -5, -5] call ace_medical_status_fnc_addMedicationAdjustment;
};

   //This snippet is an altered version from Anti rad pills usage from Ravage mod, permission was requested before use:
_compteur = 0;
player setVariable ["_antirad", true];
if (isNil {player getVariable "radMonitorON"}) then {
};
while {_compteur < 500} do {
	_effectSpeed = 1 + random 5;
	player setVariable ["_radToRemove", ((player getVariable ["_radToRemove", 0]) + _effectSpeed)];
	_compteur = _compteur + _effectSpeed;
	sleep 1;
};
player setVariable ["_antirad", nil];

};
};
	}; //End of code 