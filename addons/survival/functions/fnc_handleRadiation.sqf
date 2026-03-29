#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles radiation related things for survival loop.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_handleRadiation;
 *
 * Public: No
*/

call EFUNC(common,getPlayerVariables) params ["_hunger", "_thirst", "", "", "", "", "_radiation", "", "_parasites"];

private _finalRadiation = ((_radiation + GVAR(radiationModifiers)) min 1) max 0;
GVAR(radiationModifiers) = 0;
player setVariable [QGVAR(radiation), _finalRadiation];

if (_radiation > 0) then {
    [-3.333e-6, "radiation"] call EFUNC(common,addStatusModifier);

    if ([0.5] call EFUNC(common,rollChance) && _radiation > 0.05) then {
        if (_parasites > 0) then {
            [-1, "parasites"] call EFUNC(common,addStatusModifier);
        };
    };

    // calculation for hunger / thirst removal: (scales with radiation exposure)
    private _scaledNutrientLoss = linearConversion [0, 1, _radiation, 0, 0.000011 * GVAR(metabolicCoef), true];

    // calculation for stamina loss: (scales with radiation exposure)
    private _scaledStaminaLoss = linearConversion [0, 1, _radiation, 0, 0.000015 * GVAR(metabolicCoef), true];

    player setStamina ((getStamina player) - _scaledStaminaLoss);

    [[-_scaledNutrientLoss, "hunger"] call EFUNC(common,addStatusModifier), [-_scaledNutrientLoss, "thirst"] call EFUNC(common,addStatusModifier)] select ([50] call EFUNC(common,rollChance));
};
