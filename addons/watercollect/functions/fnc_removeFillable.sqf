#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * WaterCollection Data Remover
 * Removes specific filling recipe knowledge from players
 *
 * Arguments:
 * 0: Empty container in recipe <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * "rvg_plasticBottleEmpty" call misery_watercollect_fnc_removeFillable;
 *
 * Public: No
*/

_this params ["_recipeName"];
private _playerRecipes = player getVariable ["Misery_WaterCollect_DataSet", []];
private _index = _playerRecipes findIf {_x select 0 isEqualTo _recipeName};
if (_index > -1) then {
    _playerRecipes deleteAt _index;
    player setVariable ["Misery_WaterCollect_DataSet", _playerRecipes];
};
