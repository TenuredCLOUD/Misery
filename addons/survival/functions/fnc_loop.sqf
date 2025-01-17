#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Main survival loop
 * Client survival loop runs after Client settings are defined
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_loop;
 *
 * Public: No
*/

[{alive player},
{
    [{
        params ["_args", "_handle"];

        if (!alive player) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "[Misery survival] loop cycle terminated..."};
            [] call FUNC(loop);
            if(EGVAR(common,debug))then{systemChat "[Misery survival] loop cycle checks re-initiated..."};
        };

    private _radiation = player getVariable [QGVAR(radiation), 0];
    private _hunger = player getVariable [QGVAR(hunger), MACRO_PLAYER_HUNGER];
    private _thirst = player getVariable [QGVAR(thirst), MACRO_PLAYER_THIRST];
    private _infection = player getVariable [QGVAR(infection), MACRO_PLAYER_INFECTION];
    private _parasites = player getVariable [QGVAR(parasites), MACRO_PLAYER_PARASITES];
    private _poison = player getVariable [QGVAR(toxicity), MACRO_PLAYER_TOXICITY];
    private _sleepiness = player getVariable [QGVAR(energyDeficit), MACRO_PLAYER_FATIGUE];
    private _exposure = player getVariable [QGVAR(exposure), MACRO_PLAYER_EXPOSURE];
    private _playerTemperature = player getVariable [QGVAR(temperature), 0];
    private _isSleeping = player getVariable [QGVAR(isSleeping), false];

    private _buffs = player getVariable [QEGVAR(vitals,buffs), []];
    private _ailments = player getVariable [QEGVAR(vitals,ailments), []];

    private _randomNutrientSelection = [1, 2] call BIS_fnc_randomInt;

    if (_randomNutrientSelection isEqualTo 1) then {
    player setVariable [QGVAR(thirst), (_thirst - ((QGVAR(thirstIncrement))))];
    }else{
    player setVariable [QGVAR(hunger), (_hunger - ((QGVAR(hungerIncrement))))];
    };

    if (QGVAR(weightDeficiency)) then {

    private _randomWeightDeficiency = [1, 2] call BIS_fnc_randomInt;

    private _bagWeightLoad = loadAbs player / getNumber (configFile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
    private _playerWeight = round(_bagWeightLoad * 100);
    private _weightCalculated = MACRO_WEIGHTCALC(_playerWeight);

    if (_randomWeightDeficiency isEqualTo 1) then {
    player setVariable [QGVAR(thirst), (_thirst - (_weightCalculated))];
    }else{
    player setVariable [QGVAR(hunger), (_hunger - (_weightCalculated))];
    };

    if !(EGVAR(common,checkMultiplayer)) then {
    _randomEnergyDeficiency = [1, 2] call BIS_fnc_randomInt;
    if (_randomEnergyDeficiency isEqualTo 1) then {
    player setVariable [QGVAR(energyDeficit), (_sleepiness + (_weightCalculated))];
            };
        };
    };

    if (EGVAR(common,checkMultiplayer)) then {
    player setVariable [QGVAR(energyDeficit), MACRO_PLAYER_FATIGUE];
    }else{
        player setVariable [QGVAR(energyDeficit), (_sleepiness + (QGVAR(energyDeficitIncrement)))];

        if ((_sleepiness) >= 1) then {player setVariable [QGVAR(energyDeficit), 1]};
        if ((_sleepiness) <= 0) then {player setVariable [QGVAR(energyDeficit), 0]};
    };

    private _blackout = true;

    if ((_ailments findIf {(_x select 0) isEqualTo "Inhumanely Exhausted"}) && (!_isSleeping)) then {

        if ((random 100) > (QGVAR(blackoutChance))) then {_blackout = false};

        if (_blackout) then {
        [player,(1+(random 3))] call EFUNC(common,stun);
        };
    };

    if (GVAR(ailments)) then {
    if ((_ailments findIf {(_x select 0) isEqualTo "Parasite Infection"})) then {
        player setVariable [QGVAR(hunger), (_hunger - ((QGVAR(hungerIncrement))))]};
    };

        if (_radiation > 0) then {
        player setVariable [QGVAR(radiation), (_radiation) - EGVAR(radiation,healingValue)];
        };
            _random = [1, 10] call BIS_fnc_randomInt;

            if (_random isEqualTo 5 && _radiation > 1000 && GVAR(ailments)) then {

            if (_ailments find "PARASITES" != -1) then {_ailments deleteAt (_ailments find "PARASITES"); player setVariable [QCLASS(ailments), _ailments];};
        };

    if (_poison > 0 && GVAR(ailments)) then {

        _ailments pushBackUnique "POISON"; player setVariable [QCLASS(ailments), _ailments];

        if (_poison > 1) then {[player,(_poison / 100)] call EFUNC(common,specialDamage)};

        player setVariable [QGVAR(toxicity), (_poison - ((QGVAR(toxicityHealing))))];
    };

    if (_poison <= 0) then {_ailments deleteAt (_ailments find "POISON"); player setVariable [QCLASS(ailments), _ailments];};

    if(_infection > 0 && GVAR(ailments))then{

        _ailments pushBackUnique "INFECTION"; player setVariable [QCLASS(ailments), _ailments];

        if (_infection > 1) then {[player,(_infection / 100)] call EFUNC(common,specialDamage)};

        player setVariable [QGVAR(infection), (_infection - ((QGVAR(infectionHealing))))];
    };

    if(_infection <= 0) then {_ailments deleteAt (_ailments find "INFECTION"); player setVariable [QCLASS(ailments), _ailments];};

            if(_hunger > 1) then {player setVariable [QGVAR(hunger), MACRO_PLAYER_HUNGER]};

             if(_hunger <= 0)then{[player,100] call EFUNC(common,specialDamage)};

            if(_thirst > 1) then {player setVariable [QGVAR(thirst), MACRO_PLAYER_THIRST]};

             if(_thirst <= 0)then{[player,100] call EFUNC(common,specialDamage)};

    if (EGVAR(temperature,enable)) then {

    [player] call EFUNC(temperature,warmup);
    [player] call EFUNC(temperature,overtemp);
    [player] call EFUNC(temperature,sick);
    [player] call EFUNC(temperature,cold);
    [player] call EFUNC(temperature,water);
    [player] call EFUNC(temperature,effectiveTemperature);

    if (MiseryBreathFogAllowed) then {
    if (isNil{player getVariable QCLASS(breathCondensationEffect)}) then {
    [] call EFUNC(temperature,breathFog);
    };
};

    if (_exposure <= -1) then {player setVariable [QGVAR(exposure), -1];};
    if (_exposure >= 1) then {player setVariable [QGVAR(exposure), 25];};


        if ((_exposure <= -1 || _exposure >= 1) || (_playerTemperature <= -30 || _playerTemperature >= 55)) then {

            if((random 100)>90)then{

                [player,100] call EFUNC(common,specialDamage);
            };
        };
    };

    if (EGVAR(common,debug)) then {systemChat "[Misery survival] loop cycle..."};

}, QGVAR(cycle), []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
