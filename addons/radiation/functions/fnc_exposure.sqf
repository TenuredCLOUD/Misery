#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Advanced radiation exposure
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_radiation_fnc_exposure;
 *
*/

[{(player getVariable [QEGVAR(survival,radiation), 0]) >= 500},
{
    [{
        params ["_args", "_handle"];

        if (((player getVariable [QEGVAR(survival,radiation), 0]) < 500) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery Rad exposure enh+ cycle terminated..."};
            [] call FUNC(exposure);
            if(EGVAR(common,debug))then{systemChat "Misery Rad exposure enh+ cycle checks re-initiated..."};
        };

        private ["_MHunger","_MThirst","_Rthirst","_radlvl","_scalednutrientloss","_scaledstaminaloss","_damage"];

        _MHunger = player getVariable [QEGVAR(survival,hunger), MACRO_PLAYER_HUNGER];
        _MThirst = player getVariable [QEGVAR(survival,thirst), MACRO_PLAYER_THIRST];
        _radlvl = player getVariable [QEGVAR(survival,radiation), 0];

        //calculation for hunger / thirst removal: (scales with radiation exposure)
        _scalednutrientloss = MACRO_RADIATION_NUTRITIONLOSS(_radlvl);

        //calculation for stamina loss: (scales with radiation exposure)
        _scaledstaminaloss = MACRO_RADIATION_STAMINALOSS(_radlvl);

        if (_radlvl >= 500) then {

                        _MHunger = player getVariable [QEGVAR(survival,hunger), MACRO_PLAYER_HUNGER];
                        _MThirst = player getVariable [QEGVAR(survival,thirst), MACRO_PLAYER_THIRST];

                        player setStamina ((getStamina player) - _scaledstaminaloss);

                        addCamShake [1, 5, 10];

                        player setVariable [QEGVAR(survival,hunger), (_MHunger - ((EGVAR(survival,hungerIncrement))))];
                        player setVariable [QEGVAR(survival,hunger), (_MHunger - ((EGVAR(survival,hungerIncrement))))];

                        if ((call EFUNC(protection,totalProtection) select 0) < 1 && (call EFUNC(protection,totalProtection) select 1) < 1) then {
                        player say3D [QEGVAR(audio,sound_cough),10,1,2,0];
                        }else{
                        if ((call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0) then {
                        player say3D [QEGVAR(audio,sound_coughMuffled),10,1,2,0];
                };
            };
        };

        if (_radlvl >= 9500) then  {

            if (EGVAR(common,ace)) then {
            [player, 1, "head", "stab"] call ace_medical_fnc_addDamageToUnit;
            [player, 1, "body", "stab"] call ace_medical_fnc_addDamageToUnit;
            }else{
            _damage = damage player;
            player setDamage (_damage + 1); //No ACE damage
            };

        };

    if(EGVAR(common,debug))then{systemChat "Misery Rad exposure enh+ cycle..."};

    }, 120, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
