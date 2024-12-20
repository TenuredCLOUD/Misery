 #include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
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

private _players = call EFUNC(common,listPlayers);

if ((count GVAR(registeredEntities)) > GVAR(maxAnimalUnits)) exitWith {};
if ((random 100) <= 100) then {  // Animal spawn chance
    private _player = selectRandom _players;
    private _clusters = [1, 3] call BIS_fnc_randomInt;

    for "_cluster" from 1 to _clusters do {
        private _animalClass = selectRandom GVAR(animalTypes);
        private _animalCount = (_animalClass select 1);

        //draw marker on each client: 
        private _markerPos = getPos _player;
        private _playerUID = getPlayerUID _player;
        private _markerName = format ["marker_%1", _playerUID];
        private _marker = createMarkerLocal [_markerName, _markerPos];
        _marker setMarkerShapeLocal "ELLIPSE";
        _marker setMarkerSizeLocal [GVAR(animalMinimumDistance) + GVAR(animalSafeDistance), GVAR(animalMaximumDistance) + GVAR(animalSafeDistance)];

        for "_i" from 1 to _animalCount do {
            private _tries = 10;
            private _spawn = false;
            private _pos = [];

            for "_z" from 1 to _tries do {
                _pos = [_marker, true] call CBA_fnc_randPosArea;

                if (!surfaceIsWater _pos) then {
                    _spawn = true;
                    {
                        if ((_pos distance _x) < GVAR(animalSafeDistance)) then {
                            _spawn = false;
                        };
                    } forEach _players;
                    if (_spawn) exitWith {};
                };
            };

            if (_spawn) then {
                private _animalType = (_animalClass select 0);
                private _animal = createAgent [_animalType, _pos, [], 15, "NONE"];
                GVAR(registeredEntities) pushBack _animal;
                if ((count GVAR(registeredEntities)) >= GVAR(maxAnimalUnits)) exitWith {};
            };
        };
        deleteMarkerLocal _marker;
    };
};