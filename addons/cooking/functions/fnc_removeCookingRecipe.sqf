#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cooking Recipe Data Remover
 *
 * Arguments:
 * 0: Recipe name to remove <STRING>
 *
 * Return Value:
 * 0: NONE 
 *
 * Example:
 * "boiled_water" call misery_cooking_fnc_removeCookingRecipe
 *
 * Public: No
*/

_this params ["_recipeName"];
private _playerRecipes = player getVariable ["Misery_Cooking_DataSet", []];
private _index = _playerRecipes findIf {_x select 0 isEqualTo _recipeName};
if (_index > -1) then {
    _playerRecipes deleteAt _index;
    player setVariable ["Misery_Cooking_DataSet", _playerRecipes];
};
