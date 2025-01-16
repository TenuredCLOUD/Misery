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

private _MFear = player getVariable [QCLASS(psycosis), MACRO_PLAYER_PSYCHOSIS];



if (!hasInterface) exitWith {};

  if ((call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

if (alive player) exitWith {

titleText ["You take a clozapine pill...", "PLAIN DOWN"];

player removeItem QCLASS(clozapineBox);

 if (EGVAR(common,ace)) then {
[player, QCLASS(clozapineBox), 120, 300, 5, 0, 5] call ace_medical_status_fnc_addMedicationAdjustment;
};

sleep 60;

if (EGVAR(fear,enabled)) then {
  player setVariable [QCLASS(psycosis), (_MFear - 10)];
    if (_MFear <= 0) then {player setVariable [QCLASS(psycosis), MACRO_PLAYER_PSYCHOSIS]};
};

 };


