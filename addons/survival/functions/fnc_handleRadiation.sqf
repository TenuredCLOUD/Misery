#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles radiation related things for survival loop.
 *
 * Arguments:
 * 0: Decrement Value <NUMBER>
 * 1: Parasites <NUMBER>
 * 2: Hunger <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_handleRadiation;
 *
 * Public: No
*/

params ["_radiation", "_parasites", "_hunger", "_thirst"];

if (_radiation > 0) then {
    [-0.001, "radiation"] call EFUNC(common,addStatusModifier);
    private _random = [1, 10] call BIS_fnc_randomInt;

    if (_random isEqualTo 5 && _radiation > 0.05 && GVAR(ailments)) then {
        if (_parasites > 0) then {
            player setVariable [QGVAR(parasites), MACRO_PLAYER_DEFAULTS_LOW];
        };
    };

    //calculation for hunger / thirst removal: (scales with radiation exposure)
    private _scaledNutrientLoss = MACRO_RADIATION_NUTRITIONLOSS(_radiation);

    //calculation for stamina loss: (scales with radiation exposure)
    private _scaledStaminaLoss = MACRO_RADIATION_STAMINALOSS(_radiation);

    player setStamina ((getStamina player) - _scaledStaminaLoss);

    if ([50] call EFUNC(common,rollChance)) then {
        [-_scaledNutrientLoss, "hunger"] call EFUNC(common,addStatusModifier);
    } else {
        [-_scaledNutrientLoss, "thirst"] call EFUNC(common,addStatusModifier);
    };

    addCamShake [1, 5, 10];

    if ((call EFUNC(protection,totalProtection) select 0) < 1 && (call EFUNC(protection,totalProtection) select 1) < 1) then {
        player say3D [QEGVAR(audio,sound_cough),10,1,2,0];
    } else {
        if ((call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0) then {
            player say3D [QEGVAR(audio,sound_coughMuffled),10,1,2,0];
        };
    };
};
