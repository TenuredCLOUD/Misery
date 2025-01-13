#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cooking Recipe Data Remover
 *
 * Arguments:
 * 0: Recipe name to remove <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * "boiled_water" call misery_cooking_fnc_removeCookingRecipe
 *
 * Public: No
*/

_this params ["_recipeName"];
private _playerRecipes = player getVariable [QCLASS(cookingKnowledge), []];
private _index = _playerRecipes findIf {_x select 0 isEqualTo _recipeName};
if (_index > -1) then {
    _playerRecipes deleteAt _index;
    player setVariable [QCLASS(cookingKnowledge), _playerRecipes];
};
