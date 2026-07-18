#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ambient AI groups Generator
 * Generates highly reactive AI around players
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_ai_fnc_spawn;
 *
 * Public: No
*/

[{
    params ["_args", "_handle"];

    if ((count GVAR(registeredEntities)) >= GVAR(maxGroups)) exitWith {};

    private _players = call EFUNC(common,listPlayers);
    if (_players isEqualTo []) exitWith {}; // If no players in game exit spawner

    private _selectedPlayer = selectRandom _players;

    private _unitCase = switch (true) do {
        case (GVAR(faction) isEqualTo 0): {"BLUFOR"};
        case (GVAR(faction) isEqualTo 1): {"OPFOR"};
        case (GVAR(faction) isEqualTo 2): {"Civilian"};
        case (GVAR(faction) isEqualTo 3): {"Independant"};
    };

    switch (_unitCase) do {
        case "BLUFOR": {
            GVAR(factionType) = west;
            GVAR(aiClass) = "B_Survivor_F";
        };
        case "OPFOR": {
            GVAR(factionType) = east;
            GVAR(aiClass) = "O_G_Survivor_F";
        };
        case "Civilian": {
            GVAR(factionType) = civilian;
            GVAR(aiClass) = "C_man_1";
        };
        case "Independant": {
            GVAR(factionType) = independent;
            GVAR(aiClass) = "I_G_Survivor_F";
        };
    };

    private _group = createGroup GVAR(factionType);
    private _numEntities = [1, GVAR(groupSize)] call BIS_fnc_randomInt;

    private _position = [];
    private _isValidPosition = false;

    for "_attempts" from 1 to 5 do {

        private _radius = [GVAR(minimumDistance), GVAR(maximumDistance)] call BIS_fnc_randomInt;
        private _potentialPos = [getPosWorld _selectedPlayer, _radius] call CBA_fnc_randPos;

        private _playerTooClose = [_potentialPos, GVAR(minimumDistance)] call CBA_fnc_nearPlayer;

        if (!_playerTooClose && {!(surfaceIsWater _potentialPos)}) then {
            _position = _potentialPos;
            _isValidPosition = true;
            break;
        };
    };

    if (!_isValidPosition) exitWith {
        [QUOTE(COMPONENT_BEAUTIFIED), localize LSTRING(SpawnerInvalidPos)] call EFUNC(common,debugMessage);
    };

    for "_i" from 1 to _numEntities do {
        private _unit = objNull;

        if ([GVAR(spawnChance)] call EFUNC(common,rollChance)) then {
            _unit = _group createUnit [GVAR(aiClass), _position, [], 0, "FORM"];
        };

        if (isNull _unit) exitWith {continue};

        _unit addEventHandler ["Killed", {
            params ["_unit"];
            addToRemainsCollector [_unit];
        }];

        [_unit] call FUNC(randomGear);
        [_unit, "because"] call ACEFUNC(common,muteUnit);
        [_unit, _unit] call ACEFUNC(common,claim);

        if !(isMultiplayer) then {
            [_unit] call FUNC(addRecruitOption);
            [_unit] call FUNC(addGearOption);
        };

        _unit setVariable [QGRADGVAR(persistence,isExcluded), true];
        if (!isNil "grad_persistence_blacklist") then {
            [_unit] call grad_persistence_fnc_blacklistObjects;
        };

        // Set var for money searching if chance exists
        if (EGVAR(currency,corpseHasMoneyChance) > 0) then {
            _unit setVariable [QEGVAR(currency,canSearch), true, true];
        };
    };

    _group enableDynamicSimulation true;
    GVAR(registeredEntities) pushBack _group;
}, GVAR(cycleLength)] call CBA_fnc_addPerFrameHandler;
