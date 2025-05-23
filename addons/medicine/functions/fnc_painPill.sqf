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



if (!hasInterface) exitWith {};

   if ((call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

if (alive player) then {

  titleText ["You take a pain pill...", "PLAIN DOWN"];

  [QCLASS(painkillers)] call EFUNC(common,itemDecrement);

  sleep 15;

  if (EGVAR(common,ace)) then {
  [player, QCLASS(painkillers), 120, 300, -1, 0.5, -1, 1] call ace_medical_status_fnc_addMedicationAdjustment;
  }else{
  private _playerhealth = damage player;
  player setDamage [_playerhealth - 0.05, false];
  };

};
