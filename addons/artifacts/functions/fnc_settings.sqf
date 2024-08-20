#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Module startup function (Artifact Spawner)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_artifacts_fnc_settings;
 *
 * Public: No
*/

Misery_ArtifactSpawnCheckDistance = _this select 0;
Misery_ArtifactDeleteCheckDistance = _this select 1;
Misery_ArtifactSpawnTimer = _this select 2;
Misery_ArtifactDeleteTimer = _this select 3;

if (isServer) exitWith {
[] execVM "\z\misery\addons\artifacts\functions\fnc_start.sqf";
};
