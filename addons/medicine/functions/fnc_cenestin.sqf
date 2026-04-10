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

if (QCLASSACE(medical) call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(cenestinBottle), 120, 300, 1, 0, 1, 1] call ACEFUNC(medical_status,addMedicationAdjustment);

    {
        [player, _x, "FieldDressing"] call ACEFUNC(medical_treatment,bandageLocal);
    } forEach ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
} else {
    private _playerhealth = damage player;
    player setDamage [_playerhealth - 0.15, false];
};
