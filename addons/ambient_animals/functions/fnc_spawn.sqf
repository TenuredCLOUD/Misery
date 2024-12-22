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

//!! Parsed Data for animals need to be in array format from initSettings -
//Since PR #33 this needs to be looked into:
// ["Sheep_random_F", 3],
// ["Goat_random_F", 2],
// ["Cock_random_F", 1],
// ["Hen_random_F", 4]

if ((count GVAR(registeredEntities)) >= GVAR(maxAnimalUnits)) exitWith {};

private _players = call EFUNC(common,listPlayers);
private _selectedPlayer = selectRandom _players;

private _clusters = selectRandom [1, 2, 3];

private _markerPos = getPosATL _selectedPlayer;
private _playerUID = getPlayerUID _selectedPlayer;
private _markerName = format ["%1_%2", CBA_missionTime, _playerUID];
private _marker = createMarkerLocal [_markerName, _markerPos];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [GVAR(markerSizeX), GVAR(markerSizeY)];
_marker setMarkerAlphaLocal 0;

for "_i" from 1 to _clusters do {
    (selectRandom GVAR(animalTypes)) params ["_animalClass", "_animalCount"];

    for "_z" from 0 to _animalCount - 1 do {
        private _outsidePos = [_marker, true] call CBA_fnc_randPosArea;

        // Check if _outsidePos is valid and not water
        if (_outsidePos isEqualTo [] || surfaceIsWater _outsidePos) exitWith {
            systemChat "Invalid position or position in water, skipping...";
            continue;
        };
        private _createdAnimal = createAgent [_animalClass, _outsidePos, [], 0, "CAN_COLLIDE"];
        GVAR(registeredEntities) pushBack (agent _createdAnimal);
    };
};

[{
    deleteMarkerLocal _this;
}, _marker, 1] call CBA_fnc_waitAndExecute;
