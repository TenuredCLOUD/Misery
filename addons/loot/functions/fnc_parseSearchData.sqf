#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Searchable objects data parser / retrieval from description.ext for CfgMisery_SearchableObjects class
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_loot_fnc_parseSearchableObjects;
 *
*/

GVAR(searchableObjects) = [];
GVAR(searchedPositions) = [];

{
    private _modelName = configName _x;
    private _searchTime = getNumber (_x >> "searchTime");
    private _searchChance = getNumber (_x >> "searchChance");
    private _requiredTools = getArray (_x >> "requiredTools");
    private _audio = getText (_x >> "audio");
    private _weapons = getArray (_x >> "weapons");
    private _magazines = getArray (_x >> "magazines");
    private _items = getArray (_x >> "items");
    private _backpacks = getArray (_x >> "backpacks");

    // Append .p3d extension to model name
    private _actualModel = _modelName + ".p3d";

    GVAR(searchableObjects) pushBack [
        _actualModel,     // Index 0: Model name (with .p3d extension)
        _searchTime,      // Index 1: Search time
        _searchChance,    // Index 2: Chance to find loot
        _requiredTools,   // Index 3: Required tools to search
        _audio,           // Index 4: Audio to play
        _weapons,         // Index 5: Weapons array [[classname, amount, chance]
        _magazines,       // Index 6: Magazines array [[classname, amount, chance]
        _items,           // Index 7: Items array [[classname, amount, chance]
        _backpacks        // Index 8: Backpacks array [[classname, amount, chance]
    ];
} forEach ("true" configClasses (missionConfigFile >> "CfgMisery_SearchableObjects" >> "ObjectPool"));

publicVariable QGVAR(searchableObjects);
publicVariable QGVAR(searchedPositions);
