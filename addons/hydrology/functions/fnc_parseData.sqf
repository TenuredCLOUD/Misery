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

if !(isServer) exitWith {};

GVAR(data) = createHashMap;

private _poolCfg = missionConfigFile >> "CfgMisery_HydrologyData" >> "Sources";

{
    private _className = configName _x;
    private _defaultCapacity = getNumber (_x >> "capacity");

    private _zOffset = getNumber (_x >> "zOffset");

    private _recipesCfg = _x >> "Recipes";

    private _containersMap = createHashMap;

    {
        private _outputItem = configName _x;
        private _requiredItem = getText (_x >> "requiredItem");
        private _fillingTime = getNumber (_x >> "fillingTime");
        private _audio = getText (_x >> "audio");
        private _waterAmount = getNumber (_x >> "waterAmount");

        _containersMap set [_requiredItem, createHashMapFromArray [
            ["required", _requiredItem],
            ["output", _outputItem],
            ["waterAmount", [1, _waterAmount] select (_waterAmount > 0)],
            ["fillingTime", _fillingTime],
            ["audio", _audio]
        ]];
    } forEach ("isClass _x" configClasses _recipesCfg);

    GVAR(data) set [_className, createHashMapFromArray [
        ["capacity", _defaultCapacity],
        ["zOffset", _zOffset],
        ["recipes", _containersMap]
    ]];

} forEach ("isClass _x" configClasses _poolCfg);

publicVariable QGVAR(data);
