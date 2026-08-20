#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ambient creature groups Generator
 * Generates creatures around players
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_wzc_fnc_spawn;
 *
 * Public: No
*/

[{
    params ["_args", "_handle"];

    if ((count GVAR(registeredEntities)) >= GVAR(maxPopulation)) exitWith {};

    private _players = call EFUNC(common,listPlayers);

    // If no players in game exit spawner
    if (_players isEqualTo []) exitWith {};

    private _selectedPlayer = selectRandom _players;

    private _numEntities = [1, GVAR(clusterSize)] call BIS_fnc_randomInt;

    for "_i" from 1 to _numEntities do {
        if ((count GVAR(registeredEntities)) >= GVAR(maxPopulation)) exitWith {break};

        private _position = [];
        private _isValidPosition = false;

        for "_attempts" from 1 to 5 do {

            private _radius = [GVAR(minimumDistance), GVAR(maximumDistance)] call BIS_fnc_randomInt;
            private _potentialPos = [getPosWorld _selectedPlayer, _radius] call CBA_fnc_randPos;

            private _playerTooClose = [_potentialPos, GVAR(minimumDistance)] call CBA_fnc_nearPlayer;

            if (!_playerTooClose && {!(surfaceIsWater _potentialPos)}) then {

                private _spawnAreaType = [_potentialPos] call EFUNC(common,evaluateEnvironment);

                // Check if potential position is in a forest area, if so drop spawn chance to 2% (less zombies in wooded areas unless night)
                if (_spawnAreaType in ["WOODS", "WILDERNESS"] && [98] call EFUNC(common,rollChance) && sunOrMoon > 0.2) then {continue};

                _position = _potentialPos;
                _isValidPosition = true;
                break;
            };
        };

        if (!_isValidPosition) then {
            [QUOTE(COMPONENT_BEAUTIFIED), "AI Spawner: Invalid position or position in water, skipping"] call EFUNC(common,debugMessage);
            continue;
        };

        if ([GVAR(spawnChance)] call EFUNC(common,rollChance)) then {

            private _type = [] call FUNC(findClass);

            private _group = createGroup resistance;

            private _unit = objNull;

            if (_type isEqualType "") then {
                private _class = if (_type isEqualTo "GOLIATH") then {
                    selectRandom [MACRO_WZC_SPECIAL];
                } else {
                    selectRandom [MACRO_WZC_SPECIAL_ZOMBIES];
                };

                _unit = _group createUnit [_class, _position, [], 0, "NONE"];
                if (isNull _unit) exitWith {continue};

                [_unit, _unit] call ACEFUNC(common,claim);
                _unit setVariable [QGRADGVAR(persistence,isExcluded), true];
                _unit addEventHandler ["Killed", {
                    params ["_unit"];
                    addToRemainsCollector [_unit];
                }];
                _unit enableDynamicSimulation true;

                GVAR(registeredEntities) pushBack _group;
            } else {
                _unit = _group createUnit ["WBK_C_ExportClass", _position, [], 0, "NONE"];
                if (isNull _unit) exitWith {continue};

                [_unit, _type] call FUNC(randomGear);
                [_unit, _type] call WBK_LoadAIThroughEden;
                _unit setDamage 0.5; // apply blood effect to all regular zombie types
                [_unit, "because"] call ACEFUNC(common,muteUnit); // Mute unit (disables callouts)
                _unit setVariable [QGRADGVAR(persistence,isExcluded), true];
                _unit addEventHandler ["Killed", {
                    params ["_unit"];
                    addToRemainsCollector [_unit];
                }];
                _unit enableDynamicSimulation true;
                [_unit, _unit] call ACEFUNC(common,claim);

                // Set var for money searching if chance exists (Only for regular zombies)
                if (EGVAR(currency,corpseHasMoneyChance) > 0) then {
                    _unit setVariable [QEGVAR(currency,canSearch), true, true];
                    if ([EGVAR(currency,corpseHasMoneyChance)] call EFUNC(common,rollChance)) then {
                        private _cashFound = [EGVAR(currency,minAiMoney), EGVAR(currency,maxAiMoney)] call BIS_fnc_randomInt;
                        _unit setVariable [QEGVAR(currency,funds), _cashFound, true];
                    } else {
                        _unit setVariable [QEGVAR(currency,funds), 0, true];
                    };
                };

                GVAR(registeredEntities) pushBack _group;

                // set var for money searching if chance exists
                if (EGVAR(currency,corpseHasMoneyChance) > 0) then {
                    _unit setVariable [QEGVAR(currency,canSearch), true, true];
                };
            };
        };
    };
}, GVAR(cycleLength)] call CBA_fnc_addPerFrameHandler;
