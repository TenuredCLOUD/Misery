#include "\z\misery\addons\main\script_macros.hpp"

/*
Misery Clozapine injection usage
Designed specifically for Misery mod
by TenuredCLOUD
*/

private _MFear = player getVariable ["MiseryFear", MIS_FEAR];

MiseryACE=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=TRUE};

if (!hasInterface) exitWith {};

if (alive player) exitwith {

titleText ["You inject the Clozapine...", "PLAIN DOWN"];

player removeitem "Misery_Clozapine";

 if (MiseryACE) then {
[player, "Misery_Clozapine", 120, 300, 5, 0, 5] call ace_medical_status_fnc_addMedicationAdjustment;
};

sleep 60;

if (MiseryFearenabled) then {
  player setVariable ["MiseryFear", (_MFear - 25)];
    if (_MFear <= 0) then {player setVariable ["MiseryFear", MIS_FEAR]};
};

 };

