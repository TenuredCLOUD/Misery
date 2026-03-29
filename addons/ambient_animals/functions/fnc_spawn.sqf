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

private _markerPos = getPosATL _selectedPlayer;
private _playerUID = getPlayerUID _selectedPlayer;
private _markerName = format ["%1_%2_%3", CBA_missionTime, _playerUID, random 100];
private _marker = createMarkerLocal [_markerName, _markerPos];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [GVAR(markerSizeX), GVAR(markerSizeY)];
_marker setMarkerAlphaLocal 0;

for "_i" from 1 to _numEntities do {

    if ((count GVAR(registeredEntities)) >= GVAR(maxPopulation)) exitWith {break};

    private _outsidePos = [_marker, true] call CBA_fnc_randPosArea;

    // Check if _outsidePos is valid and not water
    if (_outsidePos isEqualTo [] || surfaceIsWater _outsidePos) exitWith {
        if (GVAR(debug)) then {systemChat "[Misery Animal spawner] Invalid position or position in water, skipping..."};
        continue;
    };
    if ([GVAR(animalSpawnChance)] call EFUNC(common,rollChance)) then {
        private _createdAnimal = createAgent [selectRandom [MACRO_FIELDDRESS_ANIMALTYPES], _outsidePos, [], 0, "CAN_COLLIDE"];
        GVAR(registeredEntities) pushBack _createdAnimal;
    };
};

[{
    deleteMarkerLocal _this;
}, _marker, 1] call CBA_fnc_waitAndExecute;
