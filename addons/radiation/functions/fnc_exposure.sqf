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

//ACE check for dmg:
EGVAR(common,ace)=false;
if (isClass(configFile>>"cfgPatches">>"ace_main"))then{EGVAR(common,ace)=true};

[{(player getVariable [QCLASS(radiation), 0]) >= 500},
{
    [{
        params ["_args", "_handle"];

        if (((player getVariable [QCLASS(radiation), 0]) < 500) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery Rad exposure enh+ cycle terminated..."};
            [] call FUNC(exposure);
            if(EGVAR(common,debug))then{systemChat "Misery Rad exposure enh+ cycle checks re-initiated..."};
        };

        private ["_MHunger","_MThirst","_Rthirst","_radlvl","_scalednutrientloss","_scaledstaminaloss","_damage"];

        _MHunger = player getVariable [QCLASS(hunger), MACRO_PLAYER_HUNGER];
        _MThirst = player getVariable [QCLASS(thirst), MACRO_PLAYER_THIRST];
        _radlvl = player getVariable [QCLASS(radiation), 0];

        //calculation for hunger / thirst removal: (scales with radiation exposure)
        _scalednutrientloss = MACRO_RADIATION_NUTRITIONLOSS(_radlvl);

        //calculation for stamina loss: (scales with radiation exposure)
        _scaledstaminaloss = MACRO_RADIATION_STAMINALOSS(_radlvl);

        if (_radlvl >= 500) then {

                        _MHunger = player getVariable [QCLASS(hunger), MACRO_PLAYER_HUNGER];
                        _MThirst = player getVariable [QCLASS(thirst), MACRO_PLAYER_THIRST];

                        player setStamina ((getStamina player) - _scaledstaminaloss);

                        addCamShake [1, 5, 10];

                        player setVariable [QCLASS(hunger), (_MHunger - ((EGVAR(survival,hungerIncrement))))];
                        player setVariable [QCLASS(hunger), (_MHunger - ((EGVAR(survival,hungerIncrement))))];

                        // player setVariable [QCLASS(hunger), (_MHunger - ((EGVAR(survival,hungerIncrement))toFixed 2))];
                        // player setVariable [QCLASS(hunger), (_MHunger - ((EGVAR(survival,hungerIncrement))toFixed 2))];
                        if !(goggles player in antirad_goggles || vest player in antirad_vests) then {
                        player say3D ["Cough",10,1,2,0];
                        }else{
                        if (goggles player in antirad_goggles || vest player in antirad_vests) then {
                        player say3D ["CoughMuffled",10,1,2,0];

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
