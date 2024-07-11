/* -----------------------------------
Misery WaterCollection Data Adder 
Designed specifically for Misery mod 
by TenuredCLOUD 

Usage ex: 
[["rvg_plasticBottleEmpty","rvg_plasticBottle",5]] call Misery_fnc_AddFillable;
*/

_this params ["_recipe"];
private _playerRecipes = player getVariable ["Misery_WaterCollect_DataSet", []]; 

private _recipeName = _recipe select 0;
if (_playerRecipes findIf {_x select 0 isEqualTo _recipeName} == -1) then {
    _playerRecipes pushBack _recipe;
    player setVariable ["Misery_WaterCollect_DataSet", _playerRecipes];
};
