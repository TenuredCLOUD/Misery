#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Health deterioration check from ailments
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_ailmentDecay;
 *
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "_radiation", "", "", "", "_psychosis"];

if (_radiation > 0.01) then {
    if ([1] call EFUNC(common,rollChance)) then {
        [player, _radiation] call EFUNC(medical,handleRadiationEffects);
        [player] call EFUNC(medical,handleRadiationExposure);
    };
};

if (_psychosis > 0.75) then {
    if ([1] call EFUNC(common,rollChance)) then {
        5 call ACEFUNC(hearing,earRinging);
        [] call ACEFUNC(medical_feedback,effectIncapacitated);
        [player, _psychosis] call EFUNC(medical,handlePsychosisEffects);
        [player] call EFUNC(medical,handleHeadTrauma);
    };
};
