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

        private _randomNutrientSelection = selectRandom ["hunger", "thirst"];

        private _weightDeficiency = 0;

        if (EGVAR(weight,deficiency)) then {
            _weightDeficiency = (call EFUNC(weight,calculated)) / 100;
        } else {
            _weightDeficiency = (selectRandom [0.01, 0.02, 0.03, 0.04, 0.05]) / 100;
        };

        private _decrementValue = 0.0001;

        // If player is not on foot, reduction stays at a low value.
        if (isNull objectParent player) then {
            private _speedPenalty = abs (speed player) / 10000;

            _decrementValue = _decrementValue + _speedPenalty + _weightDeficiency;
        };

        [-_decrementValue, _randomNutrientSelection] call EFUNC(common,addStatusModifier);

        private _finalHunger = ((_hunger + GVAR(hungerModifiers)) min 1) max 0;
        GVAR(hungerModifiers) = 0;
        player setVariable [QGVAR(hunger), _finalHunger];

        private _finalThirst = ((_thirst + GVAR(thirstModifiers)) min 1) max 0;
        GVAR(thirstModifiers) = 0;
        player setVariable [QGVAR(thirst), _finalThirst];

        if (_finalHunger == 0 || _finalThirst == 0) then {
            [player, 100] call EFUNC(common,specialDamage);
        };

        if (isMultiplayer) then {
            [+_decrementValue, "energy"] call EFUNC(common,addStatusModifier);
            private _finalEnergy = ((_energyDeficit + GVAR(energyModifiers)) min 1) max 0;
            player setVariable [QGVAR(energyDeficit), _finalEnergy];

            private _isSleeping = player getVariable [QGVAR(isSleeping), false];
            private _inhumanlyExhausted = (_ailments findIf {(_x select 0) isEqualTo "Inhumanely Exhausted"}) > -1;

            if (_inhumanlyExhausted && !(_isSleeping) && (random 100) < 25) then {
                [player, random 4] call EFUNC(common,stun);
            };
        };

        if (_radiation > 0) then {
            [-0.001, "radiation"] call EFUNC(common,addStatusModifier);
            private _random = [1, 10] call BIS_fnc_randomInt;

            if (_random isEqualTo 5 && _radiation > 0.05 && GVAR(ailments)) then {
                if (_parasites > 0) then {
                    player setVariable [QGVAR(parasites), MACRO_PLAYER_DEFAULTS_LOW];
                };
            };
        };

        if (GVAR(ailments)) then {
            if ((_parasites > 0)) then {
                [-_decrementValue, "hunger"] call EFUNC(common,addStatusModifier);
            };

            if (_toxicity > 0) then {
                if (_toxicity > 1) then {
                    [player, (_toxicity / 100)] call EFUNC(common,specialDamage);
                };
                [-0.001, "toxicity"] call EFUNC(common,addStatusModifier);
                private _finalToxicity = ((_toxicity + GVAR(toxicityModifiers)) min 1) max 0;
                player setVariable [QGVAR(toxicity), _finalToxicity];
            };

            if (_infection > 0) then {
                if (_infection > 1) then {
                    [player, (_infection / 100)] call EFUNC(common,specialDamage);
                };
                [-0.001, "infection"] call EFUNC(common,addStatusModifier);
                private _finalInfection = ((_infection + GVAR(infectionModifiers)) min 1) max 0;
                player setVariable [QGVAR(infection), _finalInfection];
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
                if (isNil {player getVariable QCLASS(breathCondensationEffect)}) then {
                    [] call EFUNC(temperature,breathFog);
                };
            };

            private _finalExposure = round _exposure;
            player setVariable [QGVAR(exposure), _finalExposure];

            if ((_exposure <= -1 || _exposure >= 1) || (_playerTemperature <= -30 || _playerTemperature >= 55)) then {
                if ((random 100) > 90) then {
                    [player, 100] call EFUNC(common,specialDamage);
                };
            };
        };
}, 30, []] call CBA_fnc_addPerFrameHandler;

