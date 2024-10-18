#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks if the player has an item, player loadout is cached to reduce how often unique items are called.
 * Items check includes everything, even weapons.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * 0: Under roof [1,0] <ARRAY>
 * 1: Boxed in [0,1] <ARRAY>
 *
 * Example:
 * (([player] call misery_common_fnc_isInside) select 0) 
 * (([player] call misery_common_fnc_isInside) select 1)
*/

private ["_playerPos","_isUnderRoof","_wallCount","_playerDir","_maxDistance","_endPos","_introof","_intwalls","_wall","_roof"];

_playerPos = getPosWorld player;
_isUnderRoof = false;
_wallCount = 0;

// Check for roof
_playerDir = [0, 0, 1];
_maxDistance = 10; //in meters 10 = 30ft
_endPos = _playerPos vectorAdd (_playerDir vectorMultiply _maxDistance);
_introof = lineIntersectsSurfaces [_playerPos,_endPos,player,objNull,true,1,"GEOM","NONE"];
_roof = _introof select 0 select 3;

if ((count _introof) > 0) then {
    if (_roof isKindOf "House" || _roof isKindOf "Building") then {
        _isUnderRoof = true;
    };
};

private _directions = [[1, 0, 0], [-1, 0, 0], [0, 1, 0], [0, -1, 0]];

// Check for walls in four directions
for "_i" from 0 to 3 do {
    _playerDir = _directions select _i;
    _endPos = _playerPos vectorAdd (_playerDir vectorMultiply _maxDistance);
    _intwalls = lineIntersectsSurfaces [_playerPos,_endPos,player,objNull,true,1,"GEOM","NONE"];
    _wall = _intwalls select 0 select 3;

    if ((count _intwalls) > 0) then {
        if (_wall isKindOf "House" || _wall isKindOf "Building") then {
            _wallCount = _wallCount + 1;
        };
    };
};

[_isUnderRoof,_wallCount >= 4]






