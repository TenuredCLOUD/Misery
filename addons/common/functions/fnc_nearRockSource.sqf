#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, Dedmen, Drongo
 * Check if player is looking at & near a "Rock source"
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_common_fnc_nearRockSource;
 *
*/

private _playerPos = eyePos ACE_player;
private _playerDir = eyeDirection ACE_player;
private _maxDistance = 3;
private _endPos = _playerPos vectorAdd (_playerDir vectorMultiply _maxDistance);
private _int = lineIntersectsSurfaces [_playerPos, _endPos, ACE_player, objNull, true, -1];
private _rock = _int select 0 select 3;
private _rockSource = false;

if ((count _int) < 1) exitWith {false};

if (["rock", "1"] in namedProperties _rock) then {

_rockSource = true;

};
_rockSource







