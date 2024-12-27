#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Crafting Recipe Data Remover
 *
 * Arguments:
 * 0: Recipe name to remove <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * "rvg_guttingknife" call misery_crafting_fnc_removeCraftingRecipe
 *
 * Public: No
*/

_this params ["_recipeName"];
private _playerRecipes = player getVariable QCLASS(craftingKnowledge);
private _index = _playerRecipes findIf {(_x select 0) isEqualTo _recipeName};
if (_index > -1) then {
    _playerRecipes deleteAt _index;
    player setVariable [QCLASS(craftingKnowledge), _playerRecipes];
};
