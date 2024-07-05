/* -----------------------------------
Misery Clozapine pill usage
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

#include "\Misery\Scripts\Misery_PreParser.hpp"

private _MFear = player getVariable ["MiseryFear", MIS_FEAR];

MiseryACE=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=TRUE};

if (!hasInterface) exitWith {};

  if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
	titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

if (alive player) exitwith {

titleText ["You take a clozapine pill...", "PLAIN DOWN"];

player removeitem "Misery_ClozapinePill";

 if (MiseryACE) then {
[player, "Misery_ClozapinePill", 120, 300, 5, 0, 5] call ace_medical_status_fnc_addMedicationAdjustment;
};

sleep 60; 

if ((count(entities"Misery_FearFramework")) > 0) then {
  player setVariable ["MiseryFear", (_MFear - 10)];
	if (_MFear <= 0) then {player setVariable ["MiseryFear", MIS_FEAR]};
};

 };


