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

private _MFear = player getVariable [QCLASS(psycosis), MACRO_PLAYER_PSYCHOSIS];



if (!hasInterface) exitWith {};

if (alive player) exitWith {

titleText ["You inject the Clozapine...", "PLAIN DOWN"];

player removeItem QCLASS(clozapineBox);

 if (EGVAR(common,ace)) then {
[player, QCLASS(clozapineBox), 120, 300, 5, 0, 5] call ace_medical_status_fnc_addMedicationAdjustment;
};

sleep 60;

if (EGVAR(fear,enabled)) then {
  player setVariable [QCLASS(psycosis), (_MFear - 25)];
    if (_MFear <= 0) then {player setVariable [QCLASS(psycosis), MACRO_PLAYER_PSYCHOSIS]};
};

 };


