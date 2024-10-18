#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cooking Recipe Data Adder
 *
 * Arguments:
 * 0: Recipe <ARRAY>
 *     0: recipe name <STRING>
 *     1: required item, count, remove on use <ARRAY>
 *     2: cooking time <ARRAY>
 *     3: cooking method <ARRAY>
 *
 * Return Value:
 * 0: Pushes data to cooking knowledge
 *
 * Example:
 *[[
 *   "boiled_water",
 *   [
 *       ["cast_iron_pot", 1, false],
 *       ["water", 1, true],
 *       ["CookingTime", 5],
 *       ["CookingMethod", "Boil"]
 *   ]
 *]] call misery_cooking_fnc_addCookingRecipe
 *
*/

_this params ["_recipe"];
private _playerRecipes = player getVariable ["Misery_Cooking_DataSet", []];

private _recipeName = _recipe select 0;
if (_playerRecipes findIf {_x select 0 isEqualTo _recipeName} == -1) then {
    _playerRecipes pushBack _recipe;
    player setVariable ["Misery_Cooking_DataSet", _playerRecipes];
};
