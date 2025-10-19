#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Treatment Check stats
 * Checks players stats to see if they need treatment
 *
 * Arguments:
 * 0: Treatment name <STRING>
 *
 * Return Value:
 * 0: Needs treatment <BOOL>
 *
 * Example:
 * [] call misery_treatment_fnc_checkStats;
 *
 * Public: No
*/

params ["_name"];

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "_radiation", "_infection", "_parasites", "_toxicity", "_psychosis"];

private _treatmeant = switch (true) do {
    case (_name isEqualTo "Treat Wounds"): {1};
    case (_name isEqualTo "Treat Radiation"): {2};
    case (_name isEqualTo "Treat Infection"): {3};
    case (_name isEqualTo "Treat Parasites"): {4};
    case (_name isEqualTo "Treat Toxicity"): {5};
    case (_name isEqualTo "Treat Psychosis"): {6};
};

_needsTreatment = true;

switch (_treatmeant) do {
    case 1: {
        if ("ace_medical" call EFUNC(common,isModLoaded)) then {
            if !(player call ace_medical_fnc_isInjured) then {
                _needsTreatment = false;
            };
        } else {
            if ((damage player) isEqualTo 0) then {
                _needsTreatment = false;
            };
        };
    };
    case 2: {
        if (_radiation isEqualTo 0) then {
            _needsTreatment = false;
        };
    };
    case 3: {
        if (_infection isEqualTo 0) then {
            _needsTreatment = false;
        };
    };
    case 4: {
        if (_parasites isEqualTo 0) then {
            _needsTreatment = false;
        };
    };
    case 5: {
        if (_toxicity isEqualTo 0) then {
            _needsTreatment = false;
        };
    };
    case 6: {
        if (_psychosis isEqualTo 0) then {
            _needsTreatment = false;
        };
    };
};

_needsTreatment
