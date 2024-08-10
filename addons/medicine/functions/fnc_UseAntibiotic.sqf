#include "\z\misery\addons\main\script_macros.hpp"

/*
Misery Antibiotic pill usage
Designed specifically for Misery mod
by TenuredCLOUD
*/

private _MInfection = player getVariable ["MiseryInfection", MIS_INFECTION];

MiseryACE=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=TRUE};

if (!hasInterface) exitWith {};

   if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
	titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

	if (alive player) exitwith {

	titleText ["You take an antibiotic pill...", "PLAIN DOWN"];

    player removeitem "Misery_antibioticpill";

	if (MiseryACE) then {
    [player, "Misery_antibioticpill", 10, 60, -10, 0, -10] call ace_medical_status_fnc_addMedicationAdjustment;
	};
	
sleep 60;

player setVariable ["MiseryInfection", MIS_INFECTION];

};