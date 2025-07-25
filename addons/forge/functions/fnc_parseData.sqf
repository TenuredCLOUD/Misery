#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Forge smelting data parser
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_forge_fnc_parseData
 *
*/

GVAR(data) = [];

{
    private _outputItem = configName _x;
    private _requiredItems = getArray (_x >> "requiredItems");
    private _smeltingTime = getNumber (_x >> "smeltTime");

    GVAR(data) pushBack [
        _outputItem,    // Index 0: Output ingot
        _requiredItems,  // Index 1: [Raw ore / metal, count]
        _smeltingTime    // Index 2: Smelt time
    ];
} forEach ("true" configClasses (missionConfigFile >> "CfgMisery_ForgeData"));

publicVariable QGVAR(data);
