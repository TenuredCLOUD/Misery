#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Clozapine pill usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_clozapine;
 *
*/

private _MFear = player getVariable ["MiseryFear", MACRO_PLAYER_FEAR];

EGVAR(common,ace)=false;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{EGVAR(common,ace)=true};

if (!hasInterface) exitWith {};

  if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

if (alive player) exitWith {

titleText ["You take a clozapine pill...", "PLAIN DOWN"];

player removeItem "Misery_ClozapinePill";

 if (EGVAR(common,ace)) then {
[player, "Misery_ClozapinePill", 120, 300, 5, 0, 5] call ace_medical_status_fnc_addMedicationAdjustment;
};

sleep 60;

if (MiseryFearenabled) then {
  player setVariable ["MiseryFear", (_MFear - 10)];
    if (_MFear <= 0) then {player setVariable ["MiseryFear", MACRO_PLAYER_FEAR]};
};

 };


