#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Psyfield Processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_psyfield_fnc_process;
 *
*/

[{!isNil "MiseryinPsyfield" && MiseryinPsyfield},
{

[{
        params ["_args","_handle"];

        if ((!isNil "MiseryinPsyfield" && !MiseryinPsyfield) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery Psyfield cycle terminated..."};
            [] call FUNC(process);
            if(EGVAR(common,debug))then{systemChat "Misery Psyfield cycle checks re-initiated..."};
        };

        private _gear = player call EFUNC(common,getSimplifiedLoadout);

        _totalProtection = [0, 0, 0, 0];

    {
        _equipment = _x;

        if (_equipment isEqualTo "") then {
        _totalProtection = [0, 0, 0, 0];
        }else{
        {
            if (_x select 0 == _equipment) then {
                _totalProtection = _totalProtection vectorAdd (_x select 1);
            };
        } forEach EGVAR(common,protectiveGear);
            };
    } forEach _gear;

        _hearingProtection = _totalProtection select 3;

        private _damageMultiplier = 0;

        if (_hearingProtection >= 100) then {
        _damageMultiplier = 0;
        }else{
        _damageMultiplier = (100 / (100 - _hearingProtection));
        };

        if (_damageMultiplier >= 0.25) then {
        _damageMultiplier = 0.25;
        };

        if (EGVAR(common,debug)) then {
        systemChat format ["Psyfield Damage Multiplier: %1", _damageMultiplier];
        systemChat format ["Psyfield Hearing Protection: %1%2", _hearingProtection, "%"];
        };

        if (_hearingProtection < 100 && MiseryinPsyfield) then {

            if (EGVAR(common,ace)) then {
                [player, 0.09 + _damageMultiplier, "head", "punch"] call ace_medical_fnc_addDamageToUnit;
            } else {
                private _damage = damage player;
                player setDamage (_damage + 0.09 + _damageMultiplier);
            };

            //Check if Fear framework is active && No protective equipment if so then destroy players sanity
            if (isNil "MiseryFearPsy") then {MiseryFearPsy = "DISABLED"};
            if (MiseryFearPsy == "ENABLED") then {
            private _fearadd = MACRO_FEAR_CALC_PSYFIELD_NOPROTECTION;
            player setVariable [QCLASS(psycosis), (_MFear + parseNumber ((_fearadd)toFixed 2))];
            };

            playSound "Brain_Scorcher2";

            "dynamicBlur" ppEffectEnable true;
            "dynamicBlur" ppEffectAdjust [10];
            "dynamicBlur" ppEffectCommit 3;
            enableCamShake true;
            addCamShake [10, 45, 10];
            player setFatigue 1;
            5 fadeSound 0.1;

            "dynamicBlur" ppEffectAdjust [20];
            "dynamicBlur" ppEffectCommit 3;
            "dynamicBlur" ppEffectEnable false;
        };

        if(EGVAR(common,debug))then{systemChat "Misery Psyfield cycle..."};

}, 8, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;


