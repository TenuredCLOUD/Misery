#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks the magazines ammo capacity via config check
 *
 * Arguments:
 * 0: Item <STRING>
 *
 * Return Value:
 * 0: Ammo Capacity <NUMBER>
 *
 * Example:
 * [] call misery_common_fnc_getMagazineCapacity
 *
 */

params ["_item"];

private _config = [_item] call CBA_fnc_getItemConfig;

private _maxAmmo = getNumber (_config >> "count");

_maxAmmo
