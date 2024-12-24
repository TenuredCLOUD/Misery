#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Clozapine injection usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_clozapineInjection;
 *
*/

private _MFear = player getVariable ["MiseryFear", MACRO_PLAYER_FEAR];

EGVAR(common,ace)=false;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{EGVAR(common,ace)=true};

if (!hasInterface) exitWith {};

if (alive player) exitWith {

titleText ["You inject the Clozapine...", "PLAIN DOWN"];

player removeItem "Misery_Clozapine";

 if (EGVAR(common,ace)) then {
[player, "Misery_Clozapine", 120, 300, 5, 0, 5] call ace_medical_status_fnc_addMedicationAdjustment;
};

sleep 60;

if (MiseryFearenabled) then {
  player setVariable ["MiseryFear", (_MFear - 25)];
    if (_MFear <= 0) then {player setVariable ["MiseryFear", MACRO_PLAYER_FEAR]};
};

 };


