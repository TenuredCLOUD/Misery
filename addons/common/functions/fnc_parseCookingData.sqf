#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cooking data parser / retrieval from description.ext for CfgMisery_CookingData class
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_common_fnc_parseCookingData;
 *
*/

GVAR(cookingRecipes) = [];

{
    private _recipeName = configName _x;
    private _requiredItems = getArray (_x >> "requiredItems");
    {
        _x set [2, (_x select 2) isEqualTo 1]; // Convert removeOnUse to boolean
    } forEach _requiredItems;
    private _cookingTime = getNumber (_x >> "cookingTime");
    private _outputCount = getNumber (_x >> "outputCount");
    private _toBeReplaced = getArray (_x >> "toBeReplaced");
    private _audio = getText (_x >> "audio");
    private _outputXP = getNumber (_x >> "outputXP");
    private _requiredXP = getNumber (_x >> "requiredXP");
    private _cookingMethod = getText (_x >> "cookingMethod");

    GVAR(cookingRecipes) pushBack [
        _recipeName,      // Index 0: Output item
        _requiredItems,   // Index 1: Required items
        _cookingTime,     // Index 2: Cooking time
        _outputCount,     // Index 3: Output quantity
        _toBeReplaced,    // Index 4: Items to replace
        _audio,           // Index 5: Cooking sound
        _outputXP,        // Index 6: XP awarded
        _requiredXP,      // Index 7: Minimum XP required
        _cookingMethod    // Index 8: Cooking method
    ];
} forEach ("true" configClasses (missionConfigFile >> "CfgMisery_CookingData"));

publicVariable QGVAR(cookingRecipes);
