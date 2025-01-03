#include "..\script_component.hpp"
/*
Misery Radiation Zone processor
Designed specifically for Misery mod
by TenuredCLOUD
*/

/*
[{!isNil "MiseryinChemZone" && MiseryinChemZone},
{

[{
        params ["_args","_handle"];

        if ((!isNil "MiseryinChemZone" && !MiseryinChemZone) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery Chemical cycle terminated..."};
            [] call "framework\scripts\Modules\chemicalzone\chemicalzoneinit.sqf";
            if(EGVAR(common,debug))then{systemChat "Misery Chemical cycle checks re-initiated..."};
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

        _skinProtection = _totalProtection select 0;
        _respiratoryProtection = _totalProtection select 1;
        _eyeProtection = _totalProtection select 2;

        private _RadiationMultiplier = 10;

        private _totalShortfall = 300 - (_skinProtection + _respiratoryProtection + _eyeProtection);

        private _radiationExposure = _totalShortfall * _RadiationMultiplier;

        player setVariable [QCLASS(radiation), (player getVariable [QCLASS(radiation), 0]) + _radiationExposure];

        if (EGVAR(common,debug)) then {
        systemChat format ["Radiation Damage Multiplier: %1", _RadiationMultiplier];
        systemChat format ["Radiation Protection: Skin %1%2, Respiratory %3%4, Eye %5%6", _skinProtection, "%", _respiratoryProtection, "%", _eyeProtection, "%"];
        };

        if ((_skinProtection < 100 || _respiratoryProtection < 100 || _eyeProtection < 100) && MiseryinRadZone) then {

            if (_respiratoryProtection < 75) then { //If less than 75% respiratory protection, make player choke
             playSound "Choking";
            };

            if (EGVAR(common,ace)) then {
                [player, 0.2, "body", "punch"] call ace_medical_fnc_addDamageToUnit;
                [player, 0.2, "head", "punch"] call ace_medical_fnc_addDamageToUnit;
            } else {
                private _damage = damage player;
                player setDamage (_damage + 0.2);
            };

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

        if(EGVAR(common,debug))then{systemChat "Misery Radiation cycle..."};

}, 15, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
*/
