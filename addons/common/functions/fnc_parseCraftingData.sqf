#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Crafting data parser / retrieval from description.ext for CfgMisery_CraftingData class
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_common_fnc_parseCraftingData;
 *
*/

GVAR(craftingRecipes) = [];

{
    private _recipeName = configName _x;
    private _requiredItems = getArray (_x >> "requiredItems");
    {
        _x set [2, (_x select 2) == 1]; // Convert RemoveAfterUse to boolean
    } forEach _requiredItems;
    private _craftingTime = getNumber (_x >> "craftingTime");
    private _outputCount = getNumber (_x >> "outputCount");
    private _toBeReplaced = getArray (_x >> "toBeReplaced");
    private _audio = getText (_x >> "audio");
    private _outputXP = getNumber (_x >> "outputXP");    // XP awarded upon completion
    private _requiredXP = getNumber (_x >> "requiredXP"); // Minimum XP required

    GVAR(craftingRecipes) pushBack [
        _recipeName,      // Index 0: Output item
        _requiredItems,   // Index 1: Required items
        _craftingTime,    // Index 2: Crafting time
        _outputCount,     // Index 3: Output quantity
        _toBeReplaced,    // Index 4: Items to replace
        _audio,           // Index 5: Crafting sound
        _outputXP,        // Index 6: XP awarded upon completion
        _requiredXP       // Index 7: Minimum XP required
    ];
} forEach ("true" configClasses (missionConfigFile >> "CfgMisery_CraftingData"));

publicVariable QGVAR(craftingRecipes);
