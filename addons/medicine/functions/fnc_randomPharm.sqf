#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Random pharm usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_randomPharm;
 *
*/

[3, 2] call EFUNC(common,chromaticEffect);

if (QCLASSACE(medical) call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(randomMedication), 0, 300, -40, 0, -40] call ACEFUNC(medical_status,addMedicationAdjustment);
};

[-0.5, "thirst"] call EFUNC(common,addStatusModifier);
[-0.5, "hunger"] call EFUNC(common,addStatusModifier);
[0.1, "toxicity"] call EFUNC(common,addStatusModifier);

if (QCLASSACE(medical) call EFUNC(common,isModLoaded)) then {
    [player, true, 10, true] call ACEFUNC(medical,setUnconscious);
} else {
    [player, 5] call EFUNC(survival,setUnconscious);
};

