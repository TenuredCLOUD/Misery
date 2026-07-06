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

if ((count GVAR(registeredEntities)) >= GVAR(maxPopulation)) exitWith {};

private _numEntities = [1, GVAR(clusterSize)] call BIS_fnc_randomInt;

private _players = call EFUNC(common,listPlayers);
private _selectedPlayer = selectRandom _players;

// If no players in game exit spawner
if (_players isEqualTo []) exitWith {};

for "_i" from 1 to _numEntities do {

    // recheck every spawn cycle
    if ((count GVAR(registeredEntities)) >= GVAR(maxPopulation)) exitWith {break};

    private _radius = [GVAR(minimumDistance), GVAR(maximumDistance)] call BIS_fnc_randomInt;

    private _position = [getPosWorld _selectedPlayer, _radius] call CBA_fnc_randPos;

    if (_position isEqualTo [] || surfaceIsWater _position) exitWith {
        [QUOTE(COMPONENT_BEAUTIFIED), "AI Spawner: Invalid position or position in water, skipping"] call EFUNC(common,debugMessage);
        continue;
    };

    private _type = [] call FUNC(findClass);

    private _group = createGroup resistance;

    private _unit = objNull;

    if ([GVAR(spawnChance)] call EFUNC(common,rollChance)) then {
        if (_type isEqualType "") then {
            private _class = if (_type isEqualTo "GOLIATH") then {
                selectRandom [MACRO_WZC_SPECIAL];
            } else {
                selectRandom [MACRO_WZC_SPECIAL_ZOMBIES];
            };
            [_unit, _unit] call ACEFUNC(common,claim);
            _unit = _group createUnit [_class, _position, [], 0, "NONE"];
            _unit setVariable [QGRADGVAR(persistence,isExcluded), true];
            _unit addEventHandler ["Killed", {
                params ["_unit"];
                addToRemainsCollector [_unit];
            }];
            _unit enableDynamicSimulation true;
            GVAR(registeredEntities) pushBack _group;
        } else {
            private _unit = _group createUnit ["WBK_C_ExportClass", _position, [], 0, "NONE"];
            [_unit, _type] call FUNC(randomGear);
            [_unit, _type] call WBK_LoadAIThroughEden;
            _unit setDamage 0.5; // apply blood effect to all regular zombie types
            _unit setSpeaker "NoVoice"; // ensure no callouts, even with single grouped units
            _unit setVariable [QGRADGVAR(persistence,isExcluded), true];
            _unit addEventHandler ["Killed", {
                params ["_unit"];
                addToRemainsCollector [_unit];
            }];
            _unit enableDynamicSimulation true;
            GVAR(registeredEntities) pushBack _group;
            [_unit, _unit] call ACEFUNC(common,claim);
            // set var for money searching if chance exists
            if (EGVAR(currency,corpseHasMoneyChance) > 0) then {
                _unit setVariable [QEGVAR(currency,canSearch), true, true];
            };
        };
    };
};
