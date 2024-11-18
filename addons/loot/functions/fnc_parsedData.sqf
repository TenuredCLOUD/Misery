#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Settings data parser
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_loot_fnc_parsedData;
 *
*/

// Process each data setting
{
    private _globalVar = missionNamespace getVariable [_x, "[]"];
    private _parsedArray = parseSimpleArray _globalVar;
    missionNamespace setVariable [_x, _parsedArray, true];
} forEach [
GVAR(itemsFood), 
GVAR(itemsFoodM), 
GVAR(itemsMedical), 
GVAR(itemsMedicalM), 
GVAR(itemsMisc), 
GVAR(itemsMiscM), 
GVAR(weapons), 
GVAR(weaponsM), 
GVAR(uniforms), 
GVAR(uniformsM), 
GVAR(vests), 
GVAR(vestsM), 
GVAR(headgear), 
GVAR(headgearM), 
GVAR(packs), 
GVAR(packsM), 
GVAR(goggles), 
GVAR(gogglesM), 
GVAR(grenades), 
GVAR(explosives), 
GVAR(special), 
GVAR(itemsBlacklist), 
GVAR(buildingBlacklist)
];

[] call FUNC(loop);

