/*
Misery POI Master settings module data parser
Defines performance properties for each POI module
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

Misery_POISpawnCheckDistance = _this select 0;
Misery_POIDeleteCheckDistance = _this select 1;
Misery_POISpawnTimer = _this select 2;
Misery_POIDeleteTimer = _this select 3;
Misery_POIMAXAllowed = _this select 4;

Misery_activePOIs = 0;

MiseryPOIGenerationReady = TRUE;

if (isServer) exitWith {
[] execVM "\z\misery\addons\poi\functions\fnc_ModuleCheck.sqf";
};