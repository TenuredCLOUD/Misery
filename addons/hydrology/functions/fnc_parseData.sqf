#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Hydrology Data Parser
 * Loads fillable container data from CfgMisery_HydrologyData
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hydrology_fnc_parseData;
 *
 * Public: No
*/

GVAR(containers) = [];

{
    private _outputItem = configName _x;   // Class name is the filled container / output
    private _requiredItem = getText (_x >> "requiredItem");
    private _fillingTime = getNumber (_x >> "fillingTime");

    GVAR(containers) pushBack [
        _requiredItem,  // Index 0: Empty container
        _outputItem,    // Index 1: Filled container (from class name)
        _fillingTime    // Index 2: Filling time
    ];
} forEach ("true" configClasses (missionConfigFile >> "CfgMisery_HydrologyData"));

publicVariable QGVAR(containers);
