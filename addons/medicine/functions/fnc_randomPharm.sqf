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

[{
    if ("ace_medical" call EFUNC(common,isModLoaded)) then {
        [player, QCLASS(randomMedication), 0, 300, -40, 0, -40] call ace_medical_status_fnc_addMedicationAdjustment;
    };

    [-0.5, "thirst"] call EFUNC(common,addStatusModifier);
    [-0.5, "hunger"] call EFUNC(common,addStatusModifier);

    [0.1, "toxicity"] call EFUNC(common,addStatusModifier);

    if ("ace_medical" call EFUNC(common,isModLoaded)) then {
        [player, true, 10, true] call ace_medical_fnc_setUnconscious;
    } else {
        [player, 5] call EFUNC(survival,setUnconscious);
    };
}, [], 15] call CBA_fnc_waitAndExecute;
