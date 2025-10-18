#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Near foliage check
 * Returns all nearby foliage terrain objects, checks if they are damaged, also checks players equipment
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * 0: Found foliage <BOOL>
 * 1: Nearest tree <OBJECT>
 * 2: Felled <BOOL>
 * 3: Has axe <BOOL>
 * 4: Has saw <BOOL>
 *
 * Example:
 * [] call misery_common_fnc_nearTree;
 *
*/

params ["_object"];

private _found = false;
private _damaged = false;
private _hasAxe = [[QCLASS(woodaxe), MACRO_AXES]] call FUNC(hasItem);
private _hasSaw = [[QCLASS(chainsaw)]] call FUNC(hasItem);

private _nearestTree = objNull;

if (isNull objectParent _object) then {

    if (nearestTerrainObjects [_object, [MACRO_FOLIAGETYPES], 2.5, true, true] isNotEqualTo []) then {
        _found = true;
    };

    _nearestTree = nearestTerrainObjects [_object, [MACRO_FOLIAGETYPES], 2.5, true, true];

    {
        if (damage _x isEqualTo 1) then {
            _found = false;
            _damaged = true;
        };
    } forEach _nearestTree;
};

[_found, _nearestTree, _damaged, _hasAxe, _hasSaw]
