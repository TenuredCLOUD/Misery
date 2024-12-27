#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Crafting Recipe Data Adder
 *
 * Arguments:
  * 0: Recipe <ARRAY>
 *     0: Recipe name <STRING>
 *     1: Required item, count <ARRAY>
 *       0: Item <STRING>
 *       1: Count <NUMBER>
 *     2: Crafting time <NUMBER>
 *     3: Output count <NUMBER>
 *     4: Replacement chance <ARRAY>
 *        0: Item <STRING>
 *        1: Chance <NUMBER>
 *        2: Replaced With <STRING>
 *     5: Audio to play <STRING>
 *
 *
 * Return Value:
 * 0: Pushes data to crafting knowledge
 *
 * Example:
 * [[
 *   "Misery_woodplank",
 *   [
 *   ["Misery_electrichandsaw",1,false],
 *   ["Misery_woodenlog", 1, true],
 *   ["CraftingTime", 45],
 *   ["OutputCount", 4],
 *   ["ToBeReplaced","Misery_electrichandsaw", 0.5, "Misery_electrichandsawnobattery"],
 *   ["Audio","ElectricSaw"]
 *   ]
 * ]] call misery_crafting_fnc_addCraftingRecipe;
 *
*/

_this params ["_recipe"];
private _playerRecipes = player getVariable [QCLASS(craftingKnowledge), []]; // Provide a default value
if (EGVAR(common,debug)) then {
systemChat format ["_recipe: %1", _recipe];
};
private _recipeName = _recipe select 0;
if (_playerRecipes findIf {_x select 0 isEqualTo _recipeName} == -1) then {
    _playerRecipes pushBack _recipe;
    player setVariable [QCLASS(craftingKnowledge), _playerRecipes];
};




