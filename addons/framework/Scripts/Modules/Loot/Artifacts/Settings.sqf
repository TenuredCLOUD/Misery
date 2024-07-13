/*
Misery Module startup function (Artifact Spawner)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

Misery_ArtifactSpawnCheckDistance = _this select 0;
Misery_ArtifactDeleteCheckDistance = _this select 1;
Misery_ArtifactSpawnTimer = _this select 2;
Misery_ArtifactDeleteTimer = _this select 3;

if (isServer) exitWith {
[] execVM "\z\misery\addons\framework\scripts\Modules\Loot\Artifacts\Start.sqf";
};
