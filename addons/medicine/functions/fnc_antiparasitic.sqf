#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Antiparasitic pill usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_antiparasitic;
 *
*/

private _ailments = player getVariable QCLASS(ailments);

EGVAR(common,ace)=false;
if (isClass(configFile>>"cfgPatches">>"ace_main")) then {
    EGVAR(common,ace)=true
};

if (!hasInterface) exitWith {};

if ((call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

if (alive player) then {
    titleText ["You take a Anti parasitic pill...", "PLAIN DOWN"];

    player removeItem QCLASS(antiparasitic);

    if (EGVAR(common,ace)) then {
        [player, QCLASS(antiparasitic), 10, 60, -15, 0, -15] call ace_medical_status_fnc_addMedicationAdjustment;
    };

    sleep 60;

    if (_ailments find "PARASITES" isNotEqualTo -1) then {
        _ailments deleteAt (_ailments find "PARASITES");
        player setVariable [QCLASS(ailments), _ailments];
    };
};
