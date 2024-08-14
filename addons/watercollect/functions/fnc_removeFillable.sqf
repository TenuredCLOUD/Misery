#include "..\script_component.hpp"
/*
Misery WaterCollection Data Remover
Designed specifically for Misery mod
by TenuredCLOUD

Usage ex: "rvg_plasticBottleEmpty" call Misery_fnc_RemoveFillable;
*/

_this params ["_recipeName"];
private _playerRecipes = player getVariable ["Misery_WaterCollect_DataSet", []];
private _index = _playerRecipes findIf {_x select 0 isEqualTo _recipeName};
if (_index > -1) then {
    _playerRecipes deleteAt _index;
    player setVariable ["Misery_WaterCollect_DataSet", _playerRecipes];
};

