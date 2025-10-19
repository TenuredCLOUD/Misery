#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cenestin pill usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_cenestin;
 *
*/

if ("ace_medical" call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(cenestinBottle), 120, 300, 1, 0, 1, 1] call ace_medical_status_fnc_addMedicationAdjustment;

    [{
        {
            [player, _x, "FieldDressing"] call ace_medical_treatment_fnc_bandageLocal;
        } forEach ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
    }, [], 15] call CBA_fnc_waitAndExecute;
} else {
    [{
        private _playerhealth = damage player;
        player setDamage [_playerhealth - 0.15, false];
    }, [], 15] call CBA_fnc_waitAndExecute;
};
