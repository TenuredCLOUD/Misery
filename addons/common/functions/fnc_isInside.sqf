#include "..\script_component.hpp"
/*
Misery Isinside of building check
Checks for Roof over player, as well as 2 or more walls (player must be "boxed in")
Designed specifically for Misery mod
By TenuredCLOUD
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






