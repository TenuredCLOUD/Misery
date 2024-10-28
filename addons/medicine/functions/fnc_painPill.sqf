#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Pain pill usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_painPill;
 *
*/

MiseryACE=false;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=true};

if (!hasInterface) exitWith {};

   if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

if (alive player) then {

  titleText ["You take a pain pill...", "PLAIN DOWN"];

  ["Misery_pain"] call EFUNC(common,itemDecrement);

  sleep 15;

  if (MiseryACE) then {
  [player, "Misery_pain", 120, 300, -1, 0.5, -1] call ace_medical_status_fnc_addMedicationAdjustment;
  }else{
  private _playerhealth = damage player;
  player setDamage [_playerhealth - 0.05, false];
  };

};
