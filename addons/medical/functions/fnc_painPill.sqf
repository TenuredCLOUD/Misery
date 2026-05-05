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

if (QCLASSACE(medical) call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(painkillers), 120, 300, -1, 0.5, -1, 1] call ACEFUNC(medical_status,addMedicationAdjustment);
} else {
    private _playerhealth = damage player;
    player setDamage [_playerhealth - 0.05, false];
};
