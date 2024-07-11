/*
Misery Module startup function (Artifact Spawner)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private["_module","_units","_activated"];
_module=_this select 0;
_units = _this select 1;
_activated=_this select 2;
waitUntil{sleep 1; !isNil "MiseryReady"};

if (_activated && isServer) then {
[
(_module getVariable"MiseryArtifactSpawnCheckDistance"),
(_module getVariable"MiseryArtifactDeleteCheckDistance"),
(_module getVariable"MiseryArtifactSpawnTimer"),
(_module getVariable"MiseryArtifactDeleteTimer")
] execVM"Misery\Scripts\Modules\Loot\Artifacts\Settings.sqf";
};
TRUE


