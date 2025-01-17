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

    private _weightDeficiency = 1;

    if (GVAR(weightDeficiency)) then {
    _weightDeficiency = call FUNC(weightCalculation);
    };

    // Define hunger, thirst, and sleep decrement values
    private _hungerDecrement = 0;
    private _thirstDecrement = 0;
    private _sleepDecrement = 0;

    // If player is not on foot, make reduction the lowest value
    if !(isNull objectParent player) then {
        _hungerDecrement = 0.001;
        _thirstDecrement = 0.001;
        _sleepDecrement = 0.001;
    } else {
        switch (true) do {
            case (speed player < 5): {
                _hungerDecrement = 0.001 * _weightDeficiency;
                _thirstDecrement = 0.0015 * _weightDeficiency;
                _sleepDecrement = 0.001 * _weightDeficiency;
            };
            case (speed player < 10): {
                _hungerDecrement = 0.002 * _weightDeficiency;
                _thirstDecrement = 0.003 * _weightDeficiency;
                _sleepDecrement = 0.002 * _weightDeficiency;
            };
            case (speed player >= 10): {
                _hungerDecrement = 0.003 * _weightDeficiency;
                _thirstDecrement = 0.0045 * _weightDeficiency;
                _sleepDecrement = 0.003 * _weightDeficiency;
            };
        };
    };

    if (_randomNutrientSelection isEqualTo 1) then {
        player setVariable [QGVAR(thirst), (_thirst - _thirstDecrement)];
    } else {
        player setVariable [QGVAR(hunger), (_hunger - _hungerDecrement)];
    };

    if (EGVAR(common, checkMultiplayer)) then {
        player setVariable [QGVAR(energyDeficit), MACRO_PLAYER_FATIGUE];
    } else {
    player setVariable [QGVAR(energyDeficit), (_sleepiness + _sleepDecrement)];

    if (_sleepiness >= 1) then {player setVariable [QGVAR(energyDeficit), 1]};
    if (_sleepiness <= 0) then {player setVariable [QGVAR(energyDeficit), 0]};
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
        player setVariable [QGVAR(hunger), (_hunger - _hungerDecrement)]};
    };

        if (_radiation > 0) then {
        player setVariable [QGVAR(radiation), (_radiation) - EGVAR(radiation,healingValue)];
        };
            _random = [1, 10] call BIS_fnc_randomInt;

            if (_random isEqualTo 5 && _radiation > 1000 && GVAR(ailments)) then {

            if (_ailments findIf {(_x select 0) isEqualTo "Parasite Infection"}) then {_ailments deleteAt (_ailments find "PARASITES"); player setVariable [QCLASS(ailments), _ailments];};
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

}, 30, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
