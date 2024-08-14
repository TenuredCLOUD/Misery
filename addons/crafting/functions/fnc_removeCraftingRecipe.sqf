#include "..\script_component.hpp"
/*
Misery Crafting Recipe Data Remover
Designed specifically for Misery mod
by TenuredCLOUD

Usage ex: "rvg_guttingknife" call Misery_fnc_RemoveCraftingRecipe;
*/

_this params ["_recipeName"];
private _playerRecipes = player getVariable "Misery_Crafting_DataSet";
private _index = _playerRecipes findIf {(_x select 0) isEqualTo _recipeName};
if (_index > -1) then {
    _playerRecipes deleteAt _index;
    player setVariable ["Misery_Crafting_DataSet", _playerRecipes];
};
