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

private _incrementedSuccess = false;

private _magazines = magazinesAmmo player;

{
    if ((_x select 0) isEqualTo _item) then {
        private _containerCount = _x select 1;
        private _config = [_item] call CBA_fnc_getItemConfig;
        private _maxAmmo = getNumber (_config >> "count");

        if (_containerCount < _maxAmmo) then {
            player removeMagazine _item;
            [player, _item, _containerCount + 1, true] call CBA_fnc_addMagazine;
            _incrementedSuccess = true;
            break;
        };
    };
} forEach _magazines;

_incrementedSuccess
