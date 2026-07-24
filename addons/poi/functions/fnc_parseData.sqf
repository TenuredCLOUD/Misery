#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * POI Settings Initialization & Parser
 * Reads POI definitions from description.ext and structures them into Hashmaps
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_poi_fnc_parseData;
 *
 * Public: No
*/

if !(isServer) exitWith {};

GVAR(data) = [];

private _pois = missionConfigFile >> "CfgMisery_POI" >> "Areas";

{
    private _poiConfig = _pois >> (configName _x);

    private _composition = getArray (_poiConfig >> "composition");

    if (!(_composition isEqualType []) || {count _composition mod 3 isNotEqualTo 0}) then {
        [QUOTE(COMPONENT_BEAUTIFIED), format ["Invalid composition configuration for POI %1", configName _x]] call EFUNC(common,debugMessage);
        _composition = [];
    };

    private _poiMap = createHashMapFromArray [

        ["id", configName _x],
        ["composition", _composition],
        ["position", getArray (_poiConfig >> "position")],
        ["nearShore", getNumber (_poiConfig >> "nearShore") isEqualTo 1],
        ["groundLoot", getNumber (_poiConfig >> "groundLoot") isEqualTo 1],
        ["faction", getText (_poiConfig >> "faction")],
        ["aiClass", getText (_poiConfig >> "aiClass")],
        ["aiCountMax", getNumber (_poiConfig >> "aiCountMax")],
        ["aiCountMin", getNumber (_poiConfig >> "aiCountMin")],
        ["aiSpawnDistance", getNumber (_poiConfig >> "aiSpawnDistance")],
        ["aiWeapPrimaryLoot", getArray (_poiConfig >> "aiWeapPrimaryLoot")],
        ["aiWeapSecondaryLoot", getArray (_poiConfig >> "aiWeapSecondaryLoot")],
        ["aiWeapLauncherLoot", getArray (_poiConfig >> "aiWeapLauncherLoot")],
        ["aiAmmo", getNumber (_poiConfig >> "aiAmmo")],
        ["aiItemLoot", getArray (_poiConfig >> "aiItemLoot")],
        ["aiNVGLoot", getArray (_poiConfig >> "aiNVGLoot")],
        ["aiFacewearLoot", getArray (_poiConfig >> "aiFacewearLoot")],
        ["aiHeadgearLoot", getArray (_poiConfig >> "aiHeadgearloot")],
        ["aiUniformLoot", getArray (_poiConfig >> "aiUniformLoot")],
        ["aiVestLoot", getArray (_poiConfig >> "aiVestLoot")],
        ["aiBackpackLoot", getArray (_poiConfig >> "aiBackpackLoot")],
        ["crateWeaponLoot", getArray (_poiConfig >> "crateWeaponLoot")],
        ["crateWeaponMagLoot", getText (_poiConfig >> "crateWeaponMagLoot")],
        ["crateWeaponAttachmentLoot", getText (_poiConfig >> "crateWeaponAttachmentLoot")],
        ["crateItemLoot", getArray (_poiConfig >> "crateItemLoot")],
        ["crateUniformLoot", getArray (_poiConfig >> "crateUniformLoot")],
        ["crateVestLoot", getArray (_poiConfig >> "crateVestLoot")],
        ["crateBackpackLoot", getArray (_poiConfig >> "crateBackpackLoot")],
        ["crateLootCount", getNumber (_poiConfig >> "crateLootCount")],
        ["groundLootItems", getArray (_poiConfig >> "groundLootItems")],
        ["groundLootCount", getNumber (_poiConfig >> "groundLootCount")],
        ["aiAccuracy", getNumber (_poiConfig >> "aiAccuracy")],
        ["aiShake", getNumber (_poiConfig >> "aiShake")],
        ["aiSpeed", getNumber (_poiConfig >> "aiSpeed")],
        ["spawnChance", getNumber (_poiConfig >> "spawnChance")],

        // Tracking Keys
        ["isSpawned", false],
        ["spawnedObjects", []],
        ["group", grpNull],
        ["marker", ""]
    ];

    GVAR(data) pushBack _poiMap;
} forEach configProperties [_pois, "isClass _x"];

publicVariable QGVAR(data);

[] call FUNC(manager);
