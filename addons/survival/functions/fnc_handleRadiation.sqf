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
    [-0.001, "radiation"] call EFUNC(common,addStatusModifier);

    if ([15] call EFUNC(common,rollChance) && _radiation > 0.05) then {
        if (_parasites > 0) then {
            [-1, "parasites"] call EFUNC(common,addStatusModifier);
        };
    };

    //calculation for hunger / thirst removal: (scales with radiation exposure)
    private _scaledNutrientLoss = MACRO_RADIATION_NUTRITIONLOSS(_radiation);

    //calculation for stamina loss: (scales with radiation exposure)
    private _scaledStaminaLoss = MACRO_RADIATION_STAMINALOSS(_radiation);

    player setStamina ((getStamina player) - _scaledStaminaLoss);

    [[-_scaledNutrientLoss, "hunger"] call EFUNC(common,addStatusModifier), [-_scaledNutrientLoss, "thirst"] call EFUNC(common,addStatusModifier)] select ([50] call EFUNC(common,rollChance));

    if (_radiation > 0.025) then {
        if ([25] call EFUNC(common,rollChance)) then {
            addCamShake [1, 5, 10];

            if ((call EFUNC(protection,totalProtection) select 0) < 1 && (call EFUNC(protection,totalProtection) select 1) < 1) then {
                player say3D [QEGVAR(audio,sound_cough),10,1,2,0];
            } else {
                if ((call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0) then {
                    player say3D [QEGVAR(audio,sound_coughMuffled),10,1,2,0];
                };
            };
        };
    };
};
