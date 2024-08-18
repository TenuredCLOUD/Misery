#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Crafting Recipe Data Adder
 *
 * Arguments:
 * 0: NONE
 *
 * Return Value:
 * 0: NONE 
 *
 * Example:
 * [[
 *   "rvg_guttingknife", 
 *   [
 *   ["Misery_pliers",1], 
 *   ["CraftingTime", 5]
 *   ]
 * ]] call misery_crafting_fnc_addCraftingRecipe;
 *
*/

_this params ["_recipe"];
private _playerRecipes = player getVariable ["Misery_Crafting_DataSet", []]; // Provide a default value
if (MiseryDebug) then {
systemchat format ["_recipe: %1", _recipe];
};
private _recipeName = _recipe select 0;
if (_playerRecipes findIf {_x select 0 isEqualTo _recipeName} == -1) then {
    _playerRecipes pushBack _recipe;
    player setVariable ["Misery_Crafting_DataSet", _playerRecipes];
};




