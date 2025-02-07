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

[{
    params ["_args", "_handle"];

        if (!alive player) exitWith {};

        call EFUNC(common,getPlayerVariables) params ["_hunger", "_thirst", "_energyDeficit", "_playerTemperature", "_exposure", "_radiation", "_infection", "_parasites", "_toxicity", "", "", "_ailments"];

        private _isSleeping = player getVariable [QGVAR(isSleeping), false];
        private _randomNutrientSelection = selectRandom [1,2];

        private _weightDeficiency = 0;

        if (EGVAR(weight,deficiency)) then {
            _weightDeficiency = (call EFUNC(weight,calculated)) / 100;
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
            [-_thirstDecrement, "thirst"] call EFUNC(common,addModifier);
        } else {
            [-_hungerDecrement, "hunger"] call EFUNC(common,addModifier);
        };

        if (_hunger > 1) then {player setVariable [QGVAR(hunger), MACRO_PLAYER_DEFAULTS_HIGH]};
        if (_hunger <= 0) then {[player, 100] call EFUNC(common,specialDamage)};
        if (_thirst > 1) then {player setVariable [QGVAR(thirst), MACRO_PLAYER_DEFAULTS_HIGH]};
        if (_thirst <= 0) then {[player, 100] call EFUNC(common,specialDamage)};

        if (isMultiplayer) then {
            player setVariable [QGVAR(energyDeficit), MACRO_PLAYER_DEFAULTS_LOW];
        } else {
            [+_sleepDecrement, "energy"] call EFUNC(common,addModifier);
            if (_energyDeficit >= 1) then {player setVariable [QGVAR(energyDeficit), MACRO_PLAYER_DEFAULTS_HIGH]};
            if (_energyDeficit < 0) then {player setVariable [QGVAR(energyDeficit), MACRO_PLAYER_DEFAULTS_LOW]};

            private _blackout = true;

            if ((_ailments findIf {(_x select 0) isEqualTo "Inhumanely Exhausted"} > -1) && !(_isSleeping)) then {
                if ((random 100) > 25) then {_blackout = false};
                    if (_blackout) then {
                    [player, (1 + (random 3))] call EFUNC(common,stun);
                };
            };
        };

        if (_radiation > 0) then {
            [-0.001, "radiation"] call EFUNC(common,addModifier);
            _random = [1, 10] call BIS_fnc_randomInt;

            if (_random isEqualTo 5 && _radiation > 0.05 && GVAR(ailments)) then {
                if (_parasites > 0) then {
                    player setVariable [QGVAR(parasites), MACRO_PLAYER_DEFAULTS_LOW];
                };
            };
        };

        if (GVAR(ailments)) then {
            if ((_parasites > 0)) then {
                [-_hungerDecrement, "hunger"] call EFUNC(common,addModifier);
            };

            if (_toxicity > 0) then {
            if (_toxicity > 1) then {[player,(_toxicity / 100)] call EFUNC(common,specialDamage)};
                [-0.001, "toxicity"] call EFUNC(common,addModifier);
            };

            if (_infection > 0) then {
            if (_infection > 1) then {[player,(_infection / 100)] call EFUNC(common,specialDamage)};
                [-0.001, "infection"] call EFUNC(common,addModifier);
            };
        };

        if (EGVAR(temperature,enabled)) then {
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
}, 30, []] call CBA_fnc_addPerFrameHandler;

