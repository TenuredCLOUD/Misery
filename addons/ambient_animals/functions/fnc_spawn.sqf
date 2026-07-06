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

if ((count GVAR(registeredEntities)) >= GVAR(maxPopulation)) exitWith {};

private _numEntities = [1, GVAR(clusterSize)] call BIS_fnc_randomInt;

private _players = call EFUNC(common,listPlayers);
private _selectedPlayer = selectRandom _players;

// If no players in game exit spawner
if (_players isEqualTo []) exitWith {};

for "_i" from 1 to _numEntities do {

    if ((count GVAR(registeredEntities)) >= GVAR(maxPopulation)) exitWith {break};

    private _radius = [GVAR(animalMinimumDistance), GVAR(animalMaximumDistance)] call BIS_fnc_randomInt;

    private _position = [getPosWorld _selectedPlayer, _radius] call CBA_fnc_randPos;

    // Check if _position is valid and not water
    if (_position isEqualTo [] || surfaceIsWater _position) exitWith {
        if (GVAR(debug)) then {[QUOTE(COMPONENT_BEAUTIFIED), localize LSTRING(InvalidPos)] call EFUNC(common,debugMessage);};
        continue;
    };
    if ([GVAR(animalSpawnChance)] call EFUNC(common,rollChance)) then {
        private _createdAnimal = createAgent [selectRandom [MACRO_FIELDDRESS_ANIMALTYPES], _position, [], 0, "CAN_COLLIDE"];
        GVAR(registeredEntities) pushBack _createdAnimal;
    };
};
