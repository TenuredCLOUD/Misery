#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Artifact spawner startup
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_artifacts_fnc_start;
 *
 * Public: No
*/

private _modules = allMissionObjects "Misery_ArtifactSpawner";

waitUntil {
    private _players = call EFUNC(common,listPlayers);
    _players = _players - (entities "HeadlessClient_F");

    {
        private _player = _x;
        {
            private _module = _x;
            private _pos = getPos _module;

            private _distance = _player distance _pos;

            private _maxSpawnDistance = 1.5 * Misery_ArtifactSpawnCheckDistance;

            if (_distance > Misery_ArtifactSpawnCheckDistance && _distance < _maxSpawnDistance) then {

                private _ArtifactsSpawned = _module getVariable ["Misery_Artifacts_Spawned", false];

                if (!(_ArtifactsSpawned) && isServer) then {

                _module setVariable ["Misery_Artifacts_Spawned", true, true];

                [
                _module,
                (_module getVariable "Misery_ArtifactSpawnnumber"),
                (_module getVariable "Misery_ArtifactSpawnradius")
                ] execVM "\z\misery\addons\artifacts\functions\fnc_generate.sqf";
            };
        };
    } forEach _modules;
} forEach _players;

    sleep Misery_ArtifactSpawnTimer;
    false // This loop will run indefinitely
};




