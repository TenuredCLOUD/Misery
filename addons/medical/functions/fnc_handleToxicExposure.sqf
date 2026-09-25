#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Toxicity tracker for ACE medical API
 * Used for toxicity exposure simulation
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Toxicity <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_handleToxicExposure;
 *
*/

params ["_unit", "_toxicity"];

if (ACEGVAR(medical_vitals,simulateSpO2)) then {
    private _targetSpO2 = 1 - (_toxicity ^ 2);
    ["toxicity", _targetSpO2] call ACEFUNC(medical_vitals,addSpO2DutyFactor);
} else {
    if (_toxicity > 0.9) then {
        if ([0.5] call EFUNC(common,rollChance)) then {
            [_unit] call ACEFUNC(medical_status,setDead);
        };
    };
};


