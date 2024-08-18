#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, Dedmen, Drongo
 * Check if player is looking at & near a "Rock source"
 *
 * Arguments:
 * 0: NONE
 *
 * Return Value:
 * 0: NONE
 *
 * Example:
 * [] call misery_common_fnc_nearRockSource;
 *
*/

private ["_playerPos","_playerDir","_maxDistance","_endPos","_int","_rock","_rockSource"];

_playerPos = eyePos player;
_playerDir = eyeDirection player;
_maxDistance = 3;
_endPos = _playerPos vectorAdd (_playerDir vectorMultiply _maxDistance);
_int = lineIntersectsSurfaces [_playerPos,_endPos,player,objNull,true,-1];
_rock = _int select 0 select 3;
_rockSource = false;

if ((count _int) < 1) exitWith {false};

if (["rock", "1"] in namedProperties _rock) then {

_rockSource = true;

};
_rockSource







