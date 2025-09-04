#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Counts the remaining ammo of a magazine item as well as it's capacity
 *
 * Arguments:
 * 0: Item <STRING>
 *
 * Return Value:
 * 0: Ammo Count <NUMBER>
 * 1: Ammo Capacity <NUMBER>
 *
 * Example:
 * [] call misery_common_fnc_countMagazinesAmmo
 *
 */

params ["_item"];

private _magazines = magazinesAmmo player;
private _itemContainer = _magazines findIf {(_x select 0) isEqualTo _item};

if (_itemContainer isEqualTo -1) exitWith {};

private _config = [_item] call CBA_fnc_getItemConfig;

private _maxAmmo = getNumber (_config >> "count");

private _containerCount = (_magazines select _itemContainer) select 1;

[_containerCount, _maxAmmo]
