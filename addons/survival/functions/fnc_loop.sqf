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

    private _radiation = player getVariable [QGVAR(radiation), MACRO_PLAYER_DEFAULTS_LOW];
    private _hunger = player getVariable [QGVAR(hunger), MACRO_PLAYER_DEFAULTS_HIGH];
    private _thirst = player getVariable [QGVAR(thirst), MACRO_PLAYER_DEFAULTS_HIGH];
    private _infection = player getVariable [QGVAR(infection), MACRO_PLAYER_DEFAULTS_LOW];
    private _parasites = player getVariable [QGVAR(parasites), MACRO_PLAYER_DEFAULTS_LOW];
    private _poison = player getVariable [QGVAR(toxicity), MACRO_PLAYER_DEFAULTS_LOW];
    private _sleepiness = player getVariable [QGVAR(energyDeficit), MACRO_PLAYER_DEFAULTS_LOW];
    private _exposure = player getVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW];
    private _playerTemperature = player getVariable [QGVAR(temperature), 0];
    private _isSleeping = player getVariable [QGVAR(isSleeping), false];

    private _ailments = player getVariable [QEGVAR(vitals,ailments), []];

    private _randomNutrientSelection = selectRandom [1,2];

    private _weightDeficiency = 0;

    if (GVAR(weightDeficiency)) then {
    _weightDeficiency = (call FUNC(weightCalculation)) / 100;
    } else {
    _weightDeficiency = selectRandom [0.01, 0.02, 0.03, 0.04, 0.05];
    _weightDeficiency = _weightDeficiency / 100;
    };

    private _hungerDecrement = 0;
    private _thirstDecrement = 0;
    private _sleepDecrement = 0;

    // If player is not on foot, make reduction a very low value
    if !(isNull objectParent player) then {
        _hungerDecrement = 0.0001;
        _thirstDecrement = 0.0001;
        _sleepDecrement = 0.0001;
    } else {
    private _speedPenalty = abs(speed player) / 10000;

    _hungerDecrement = 0.0001 + _speedPenalty + _weightDeficiency;
    _thirstDecrement = 0.0001 + _speedPenalty + _weightDeficiency;
    _sleepDecrement = 0.0001 + _speedPenalty + _weightDeficiency;
    };

    if (_randomNutrientSelection isEqualTo 1) then {
        player setVariable [QGVAR(thirst), (_thirst - _thirstDecrement)];
    } else {
        player setVariable [QGVAR(hunger), (_hunger - _hungerDecrement)];
    };

    if (_hunger > 1) then {player setVariable [QGVAR(hunger), MACRO_PLAYER_DEFAULTS_HIGH]};
    if (_hunger <= 0) then {[player, 100] call EFUNC(common,specialDamage)};
    if (_thirst > 1) then {player setVariable [QGVAR(thirst), MACRO_PLAYER_DEFAULTS_HIGH]};
    if (_thirst <= 0) then {[player, 100] call EFUNC(common,specialDamage)};

    if (EGVAR(common,checkMultiplayer)) then {
    player setVariable [QGVAR(energyDeficit), MACRO_PLAYER_DEFAULTS_LOW];
    } else {
    player setVariable [QGVAR(energyDeficit), (_sleepiness + _sleepDecrement)];
    if (_sleepiness >= 1) then {player setVariable [QGVAR(energyDeficit), MACRO_PLAYER_DEFAULTS_HIGH]};
    if (_sleepiness < 0) then {player setVariable [QGVAR(energyDeficit), MACRO_PLAYER_DEFAULTS_LOW]};

    private _blackout = true;

    if ((_ailments findIf {(_x select 0) isEqualTo "Inhumanely Exhausted"} > -1) && !(_isSleeping)) then {

        if ((random 100) > 25) then {_blackout = false};

        if (_blackout) then {
        [player, (1 + (random 3))] call EFUNC(common,stun);
            };
        };
    };

    if (_radiation > 0) then {
    player setVariable [QGVAR(radiation), (_radiation) - 0.001];
    _random = [1, 10] call BIS_fnc_randomInt;

    if (_random isEqualTo 5 && _radiation > 0.05 && GVAR(ailments)) then {
    if (_ailments findIf {(_x select 0) isEqualTo "Parasite Infection"} > -1) then {
        player setVariable [QGVAR(parasites), MACRO_PLAYER_DEFAULTS_LOW];
            };
        };
    };

    if (GVAR(ailments)) then {
    if ((_ailments findIf {(_x select 0) isEqualTo "Parasite Infection"} > -1)) then {
        player setVariable [QGVAR(hunger), (_hunger - _hungerDecrement)];
    };

    if (_poison > 0) then {
    if (_poison > 1) then {[player,(_poison / 100)] call EFUNC(common,specialDamage)};
        player setVariable [QGVAR(toxicity), (_poison - 0.001)];
    };

    if (_infection > 0) then {
    if (_infection > 1) then {[player,(_infection / 100)] call EFUNC(common,specialDamage)};
    player setVariable [QGVAR(infection), (_infection - 0.001)];
        };
    };

    if (EGVAR(temperature,enable)) then {
    [player] call EFUNC(temperature,warmup);
    [player] call EFUNC(temperature,overtemp);
    [player] call EFUNC(temperature,sick);
    [player] call EFUNC(temperature,cold);
    [player] call EFUNC(temperature,water);
    [player] call EFUNC(temperature,effectiveTemperature);

    if (EGVAR(temperature,breathFogAllowed)) then {
    if (isNil{player getVariable QCLASS(breathCondensationEffect)}) then {
    [] call EFUNC(temperature,breathFog);
        };
    };

    if (_exposure <= -1) then {player setVariable [QGVAR(exposure), -1];};
    if (_exposure >= 1) then {player setVariable [QGVAR(exposure), 1];};


    if ((_exposure <= -1 || _exposure >= 1) || (_playerTemperature <= -30 || _playerTemperature >= 55)) then {

    if ((random 100) > 90) then {
    [player, 100] call EFUNC(common,specialDamage);
            };
        };
    };

    if (EGVAR(common,debug)) then {systemChat "[Misery survival] loop cycle..."};

}, 30, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
