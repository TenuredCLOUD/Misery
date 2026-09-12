#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Clones player into a zombie entity
 * Handled on server
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Funds <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_wzc_fnc_buildPlayerZombie;
 *
*/

params ["_player", "_funds"];

private _pos = getPosATL _player;
private _dir = getDir _player;
private _loadout = getUnitLoadout _player;
private _face = face _player;
private _name = name _player;

private _zombieGroup = createGroup [independent, true];

private _zombie = _zombieGroup createUnit ["WBK_C_ExportClass", _pos, [], 0, "CAN_COLLIDE"];

_zombie setDir _dir;

_zombie setUnitLoadout _loadout;
_zombie setFace _face;
_zombie setName _name;

[_zombie, "because"] call ACEFUNC(common,muteUnit); // Mute unit (disables callouts)
_zombie setVariable [QGRADGVAR(persistence,isExcluded), true];

_zombie setVariable [QEGVAR(currency,canSearch), true, true];

// retain funds on new unit
if (_funds isNotEqualTo 0) then {
    _zombie setVariable [QEGVAR(currency,funds), _funds, true];
};

[_zombie, 5] call WBK_LoadAIThroughEden;

GVAR(registeredEntities) pushBack _zombieGroup;
