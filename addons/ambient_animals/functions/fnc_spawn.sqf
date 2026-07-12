 #include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Animal spawner animal generation
 * Processes spawning / generation of ambient animals near players
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_animals_fnc_spawn;
 *
*/

[{
    params ["_args", "_handle"];

    if ((count GVAR(registeredEntities)) >= GVAR(maxPopulation)) exitWith {};

    private _numEntities = [1, GVAR(clusterSize)] call BIS_fnc_randomInt;

    private _players = call EFUNC(common,listPlayers);
    private _selectedPlayer = selectRandom _players;

    // If no players in game exit spawner
    if (_players isEqualTo []) exitWith {};

    for "_i" from 1 to _numEntities do {

        if ((count GVAR(registeredEntities)) >= GVAR(maxPopulation)) exitWith {break};

        private _position = [];
        private _isValidPosition = false;

        for "_attempts" from 1 to 5 do {

            private _radius = [GVAR(animalMinimumDistance), GVAR(animalMaximumDistance)] call BIS_fnc_randomInt;
            private _potentialPos = [getPosWorld _selectedPlayer, _radius] call CBA_fnc_randPos;

            private _playerTooClose = [_potentialPos, GVAR(animalMinimumDistance)] call CBA_fnc_nearPlayer;

            if (!_playerTooClose && {!(surfaceIsWater _potentialPos)}) then {
                _position = _potentialPos;
                _isValidPosition = true;
                break;
            };
        };

        if (!_isValidPosition) then {
            if (GVAR(debug)) then {
                [QUOTE(COMPONENT_BEAUTIFIED), localize LSTRING(InvalidPos)] call EFUNC(common,debugMessage);
            };
            continue;
        };

        if ([GVAR(animalSpawnChance)] call EFUNC(common,rollChance)) then {
            private _createdAnimal = createAgent [selectRandom [MACRO_FIELDDRESS_ANIMALTYPES], _position, [], 0, "CAN_COLLIDE"];
            [_createdAnimal, "because"] call ACEFUNC(common,muteUnit); // Mute unit (disables callouts)
            GVAR(registeredEntities) pushBack _createdAnimal;
        };
    };
}, GVAR(animalCycleLength)] call CBA_fnc_addPerFrameHandler;
