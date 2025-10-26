#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks for nearby living player in multiplayer
 *
 * Arguments:
 * 0: Position (referenced by object) <OBJECT>
 * 1: Radius <NUMBER>
 *
 * Return Value:
 * 0: Near player <BOOL>
 * 1: Nearest player <OBJECT>
 *
 * Example:
 * [player, 2] call misery_common_fnc_nearPlayer;
*/

params ["_object", "_radius"];

if (!isMultiplayer) exitWith {[false, objNull]};

private _nearestObjects = nearestObjects [_object, ["CAManBase"], _radius];
private _players = _nearestObjects select { _x in (allPlayers - entities "HeadlessClient_F") && alive _x };

[_players isNotEqualTo [], if (_players isNotEqualTo []) then { _players select 0 } else { objNull }]
