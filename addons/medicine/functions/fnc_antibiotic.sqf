#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Antibiotic pill usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_antibiotic;
 *
*/

private _MInfection = player getVariable [QEGVAR(survival,infection), MACRO_PLAYER_DEFAULTS_LOW];



if (!hasInterface) exitWith {};

   if ((call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

    if (alive player) exitWith {

    titleText ["You take an antibiotic pill...", "PLAIN DOWN"];

    player removeItem QCLASS(antibiotic);

    if (EGVAR(common,ace)) then {
    [player, QCLASS(antibiotic), 10, 60, -10, 0, -10] call ace_medical_status_fnc_addMedicationAdjustment;
    };

sleep 60;

player setVariable [QEGVAR(survival,infection), MACRO_PLAYER_DEFAULTS_LOW];

};
