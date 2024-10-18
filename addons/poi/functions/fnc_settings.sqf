#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * POI Master settings module data parser
 * Defines performance properties for each POI module
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_poi_fnc_settings;
 *
 * Public: No
*/

Misery_POISpawnCheckDistance = _this select 0;
Misery_POIDeleteCheckDistance = _this select 1;
Misery_POISpawnTimer = _this select 2;
Misery_POIDeleteTimer = _this select 3;
Misery_POIMAXAllowed = _this select 4;

Misery_activePOIs = 0;

MiseryPOIGenerationReady = true;

if (isServer) exitWith {
[] execVM "\z\misery\addons\poi\functions\fnc_ModuleCheck.sqf";
};
