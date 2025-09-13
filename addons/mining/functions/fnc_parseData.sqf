#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Mining data parser
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_mining_fnc_parseData;
 *
*/

GVAR(miningObjects) = [];
GVAR(minedPositions) = [];

{
    private _modelName = configName _x;
    private _miningTime = getNumber (_x >> "miningTime");
    private _oreChance = getNumber (_x >> "oreChance");
    private _audio = getText (_x >> "audio");
    private _items = getArray (_x >> "items");
    private _oreDepletion = getNumber (_x >> "oreDepletionChance");

    // Append .p3d extension to model name
    private _actualModel = _modelName + ".p3d";

    GVAR(miningObjects) pushBack [
        _actualModel,     // Index 0: Model name (with .p3d extension)
        _miningTime,      // Index 1: Search time
        _oreChance,       // Index 2: Chance to find ore
        _audio,           // Index 3: Audio to play
        _items,           // Index 4: Items array [[classname, amount, chance]
        _oreDepletion     // Index 5: Chance to deplete ore vein
    ];
} forEach ("true" configClasses (missionConfigFile >> "CfgMisery_MiningData" >> "MiningPool"));

publicVariable QGVAR(miningObjects);
publicVariable QGVAR(minedPositions);
