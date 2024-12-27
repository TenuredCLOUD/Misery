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

private _MInfection = player getVariable [QCLASS(infection), MACRO_PLAYER_INFECTION];



if (!hasInterface) exitWith {};

   if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

    if (alive player) exitWith {

    titleText ["You take an antibiotic pill...", "PLAIN DOWN"];

    player removeItem "Misery_antibioticpill";

    if (EGVAR(common,ace)) then {
    [player, "Misery_antibioticpill", 10, 60, -10, 0, -10] call ace_medical_status_fnc_addMedicationAdjustment;
    };

sleep 60;

player setVariable [QCLASS(infection), MACRO_PLAYER_INFECTION];

};
