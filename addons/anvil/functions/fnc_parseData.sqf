#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Anvil data parser / retrieval from description.ext for CfgMisery_AnvilData class
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_anvil_fnc_parseData;
 *
*/

GVAR(data) = [];

{
    private _outputItem = configName _x;
    private _requiredItems = getArray (_x >> "requiredItems");
    private _smithingTime = getNumber (_x >> "craftingTime");

    GVAR(data) pushBack [
        _outputItem,    // Index 0: Output ingot
        _requiredItems,  // Index 1: [Ingots, count]
        _smithingTime    // Index 2: Smithing time
    ];
} forEach ("true" configClasses (missionConfigFile >> "CfgMisery_AnvilData"));

publicVariable QGVAR(data);
