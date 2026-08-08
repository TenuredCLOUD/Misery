#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Increments magazine type items by 1 each use, if container is maxed, it will not be incremented
 *
 * Arguments:
 * 0: Item <STRING>
 *
 * Return Value:
 * 0: Incremented <BOOL>
 *
 * Example:
 * [] call misery_common_fnc_itemIncrement
*/

params ["_item"];

private _magazines = magazinesAmmo ACE_player;

private _matches = _magazines select {(_x select 0) isEqualTo _item};

if (_matches isEqualTo []) exitWith { false };

private _config = [_item] call CBA_fnc_getItemConfig;
private _maxAmmo = getNumber (_config >> "count");

private _nonFullMatches = _matches select {(_x select 1) < _maxAmmo};

if (_nonFullMatches isEqualTo []) exitWith { false };

_nonFullMatches sort false;

private _allAmmoCounts = _matches apply {_x select 1};

ACE_player removeMagazines _item;

private _targetAmmo = (_nonFullMatches select 0) select 1;
private _targetIndex = _allAmmoCounts find _targetAmmo;

if (_targetIndex isNotEqualTo -1) then {
    _allAmmoCounts set [_targetIndex, _targetAmmo + 1];
};

{
    [ACE_player, _item, _x, true] call CBA_fnc_addMagazine;
} forEach _allAmmoCounts;

true
