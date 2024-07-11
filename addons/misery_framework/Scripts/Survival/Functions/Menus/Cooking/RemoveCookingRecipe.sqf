/* -----------------------------------
Misery Cooking Recipe Data Remover
Designed specifically for Misery mod 
by TenuredCLOUD 

Usage ex: "boiled_water" call Misery_fnc_RemoveCraftingRecipe; 
*/

_this params ["_recipeName"];
private _playerRecipes = player getVariable ["Misery_Cooking_DataSet", []];
private _index = _playerRecipes findIf {_x select 0 isEqualTo _recipeName};
if (_index > -1) then {
    _playerRecipes deleteAt _index;
    player setVariable ["Misery_Cooking_DataSet", _playerRecipes];
};
