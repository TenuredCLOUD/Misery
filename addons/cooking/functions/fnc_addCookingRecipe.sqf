#include "..\script_component.hpp"
/*
Misery Cooking Recipe Data Adder
Designed specifically for Misery mod
by TenuredCLOUD

Usage ex:
[[
    "boiled_water",
    [
        ["cast_iron_pot", 1, false],
        ["water", 1, true],
        ["CookingTime", 5],
        ["CookingMethod", "Boil"]
    ]
]] call yourAdderFunctionName;

*/

_this params ["_recipe"];
private _playerRecipes = player getVariable ["Misery_Cooking_DataSet", []];

private _recipeName = _recipe select 0;
if (_playerRecipes findIf {_x select 0 isEqualTo _recipeName} == -1) then {
    _playerRecipes pushBack _recipe;
    player setVariable ["Misery_Cooking_DataSet", _playerRecipes];
};
