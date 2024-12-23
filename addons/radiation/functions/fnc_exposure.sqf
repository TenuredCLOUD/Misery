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
MiseryACE=false;
if (isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=true};

[{(player getVariable ["MiseryRadiation", 0]) >= 500},
{
    [{
        params ["_args", "_handle"];

        if (((player getVariable ["MiseryRadiation", 0]) < 500) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(MiseryDebug)then{systemChat "Misery Rad exposure enh+ cycle terminated..."};
            [] call FUNC(exposure);
            if(MiseryDebug)then{systemChat "Misery Rad exposure enh+ cycle checks re-initiated..."};
        };

        private ["_MHunger","_MThirst","_Rhunger","_Rthirst","_radlvl","_scalednutrientloss","_scaledstaminaloss","_damage"];

        _MHunger = player getVariable ["MiseryHunger", MACRO_PLAYER_HUNGER];
        _MThirst = player getVariable ["MiseryThirst", MACRO_PLAYER_THIRST];
        _radlvl = player getVariable ["MiseryRadiation", 0];

        //calculation for hunger / thirst removal: (scales with radiation exposure)
        _scalednutrientloss = MACRO_RADIATION_NUTRITIONLOSS(_radlvl);

        //calculation for stamina loss: (scales with radiation exposure)
        _scaledstaminaloss = MACRO_RADIATION_STAMINALOSS(_radlvl);

        if (_radlvl >= 500) then {

                        _MHunger = player getVariable ["MiseryHunger", MACRO_PLAYER_HUNGER];
                        _MThirst = player getVariable ["MiseryThirst", MACRO_PLAYER_THIRST];

                        player setStamina ((getStamina player) - _scaledstaminaloss);

                        addCamShake [1, 5, 10];

                        player setVariable ["MiseryHunger", (_MHunger - ((MiseryHungerIncrement)))];
                        player setVariable ["MiseryHunger", (_MHunger - ((MiseryHungerIncrement)))];

                        // player setVariable ["MiseryHunger", (_MHunger - ((MiseryHungerIncrement)toFixed 2))];
                        // player setVariable ["MiseryHunger", (_MHunger - ((MiseryHungerIncrement)toFixed 2))];
                        if !(goggles player in antirad_goggles || vest player in antirad_vests) then {
                        player say3D ["Cough",10,1,2,0];
                        }else{
                        if (goggles player in antirad_goggles || vest player in antirad_vests) then {
                        player say3D ["CoughMuffled",10,1,2,0];

                };
            };
        };

        if (_radlvl >= 9500) then  {

            if (MiseryACE) then {
            [player, 1, "head", "stab"] call ace_medical_fnc_addDamageToUnit;
            [player, 1, "body", "stab"] call ace_medical_fnc_addDamageToUnit;
            }else{
            _damage = damage player;
            player setDamage (_damage + 1); //No ACE damage
            };

        };

    if(MiseryDebug)then{systemChat "Misery Rad exposure enh+ cycle..."};

    }, 120, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
