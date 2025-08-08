#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Loot data parser / retrieval from description.ext for CfgMisery_LootData class
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_loot_fnc_parseData;
 *
*/

private _config = missionConfigFile >> "CfgMisery_LootData" >> "LootPool";

GVAR(building_used) = [];

GVAR(chance) = getNumber (_config >> "chance");
GVAR(uniformItemChance) = getNumber (_config >> "uniformItemChance");
GVAR(vestsItemChance) = getNumber (_config >> "vestsItemChance");
GVAR(backpacksItemChance) = getNumber (_config >> "BackpacksItemChance");
GVAR(buildingBlacklist) = getArray (_config >> "buildingBlacklist");
GVAR(itemsBlacklist) = getArray (_config >> "itemsBlacklist");
GVAR(weapons) = getArray (_config >> "weapons");
GVAR(weaponsM) = getArray (_config >> "weaponsM");
GVAR(itemsMisc) = getArray (_config >> "itemsMisc");
GVAR(itemsMiscM) = getArray (_config >> "itemsMiscM");
GVAR(itemsFood) = getArray (_config >> "itemsFood");
GVAR(itemsFoodM) = getArray (_config >> "itemsFoodM");
GVAR(itemsMedical) = getArray (_config >> "itemsMedical");
GVAR(itemsMedicalM) = getArray (_config >> "itemsMedicalM");
GVAR(uniforms) = getArray (_config >> "uniforms");
GVAR(uniformsM) = getArray (_config >> "uniformsM");
GVAR(vests) = getArray (_config >> "vests");
GVAR(vestsM) = getArray (_config >> "vestsM");
GVAR(backpacks) = getArray (_config >> "backpacks");
GVAR(backpacksM) = getArray (_config >> "backpacksM");
GVAR(headgear) = getArray (_config >> "headgear");
GVAR(headgearM) = getArray (_config >> "headgearM");
GVAR(goggles) = getArray (_config >> "goggles");
GVAR(gogglesM) = getArray (_config >> "gogglesM");
GVAR(grenades) = getArray (_config >> "grenades");
GVAR(explosives) = getArray (_config >> "explosives");
GVAR(special) = getArray (_config >> "special");

{
    publicVariable _x;
} forEach [
    QGVAR(chance),
    QGVAR(uniformItemChance),
    QGVAR(vestsItemChance),
    QGVAR(backpacksItemChance),
    QGVAR(buildingBlacklist),
    QGVAR(itemsBlacklist),
    QGVAR(weapons),
    QGVAR(weaponsM),
    QGVAR(itemsMisc),
    QGVAR(itemsMiscM),
    QGVAR(itemsFood),
    QGVAR(itemsFoodM),
    QGVAR(itemsMedical),
    QGVAR(itemsMedicalM),
    QGVAR(uniforms),
    QGVAR(uniformsM),
    QGVAR(vests),
    QGVAR(vestsM),
    QGVAR(backpacks),
    QGVAR(backpacksM),
    QGVAR(headgear),
    QGVAR(headgearM),
    QGVAR(goggles),
    QGVAR(gogglesM),
    QGVAR(grenades),
    QGVAR(explosives),
    QGVAR(special)
];
