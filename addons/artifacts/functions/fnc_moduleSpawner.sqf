#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Module startup function (Artifact Spawner)
 *
 * Arguments:
 * 0: spawn check distance from module to players <NUMBER>
 * 1: deletion check distance from moduel to players <NUMBER>
 * 2: spawn timer check frequency in seconds <NUMBER>
 * 3: deletion timer check frequency in seconds <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [
 * (_module getVariable "MiseryArtifactSpawnCheckDistance"),
 * (_module getVariable "MiseryArtifactDeleteCheckDistance"),
 * (_module getVariable "MiseryArtifactSpawnTimer"),
 * (_module getVariable "MiseryArtifactDeleteTimer")
 * ] call misery_artifacts_fnc_settings;
 *
 * Public: No
*/

private["_module","_units","_activated"];
_module=_this select 0;
_units = _this select 1;
_activated=_this select 2;
waitUntil{sleep 1; !isNil "MiseryReady"};

if (_activated && isServer) then {
[
(_module getVariable "MiseryArtifactSpawnCheckDistance"),
(_module getVariable "MiseryArtifactDeleteCheckDistance"),
(_module getVariable "MiseryArtifactSpawnTimer"),
(_module getVariable "MiseryArtifactDeleteTimer")
] call FUNC(settings);
};
true


