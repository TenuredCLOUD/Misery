#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ambient AI Zones Master Checking loop
 * Consistenty checks players positions relative to module positions
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_ai_fnc_moduleCheck;
 *
 * Public: No
*/

private _modules = allMissionObjects QCLASS(Ambient_AI);

waitUntil {
    private _players = call EFUNC(common,listPlayers);

    {
        private _player = _x;
        {
            private _module = _x;
            private _pos = getPos _module;

            private _distance = _player distance _pos;

            // Define the maximum spawn distance as double the spawn check distance for a "Safe buffer"
            private _maxSpawnDistance = 2 * Misery_AmbAI_SpawnCheckDistance;

            // Check if the AI is within the spawn check distance and less than the maximum spawn distance
            if (_distance > Misery_AmbAI_SpawnCheckDistance && _distance < _maxSpawnDistance) then {

                private _AISpawned = _module getVariable [QCLASS(AI_Spawned), false];

                if (!(_AISpawned) && isServer) then {

                _module setVariable [QCLASS(AI_Spawned), true, true];

                [
                _module,
                (_module getVariable QCLASS(AI_faction)),
                (_module getVariable QCLASS(AI_Class)),
                (_module getVariable QCLASS(AI_GroupMAX)),
                (_module getVariable QCLASS(AI_WeapPrimaryLoot)),
                (_module getVariable QCLASS(AI_WeapSecondaryLoot)),
                (_module getVariable QCLASS(AI_WeaplauncherLoot)),
                (_module getVariable QCLASS(AI_Ammo)),
                (_module getVariable QCLASS(AI_ItemLoot)),
                (_module getVariable QCLASS(AI_NVGLoot)),
                (_module getVariable QCLASS(AI_FacewearLoot)),
                (_module getVariable QCLASS(AI_HeadgearLoot)),
                (_module getVariable QCLASS(AI_UniformLoot)),
                (_module getVariable QCLASS(AI_VestLoot)),
                (_module getVariable QCLASS(AI_BackpackLoot)),
                (_module getVariable QCLASS(AI_Accuracy)),
                (_module getVariable QCLASS(AI_Shake)),
                (_module getVariable QCLASS(AI_Speed)),
                (_module getVariable QCLASS(AI_SpawnChance)),
                (_module getVariable QCLASS(AI_ModuleSpawnDistanceMIN)),
                (_module getVariable QCLASS(AI_ModuleSpawnDistanceMAX))
                ] call FUNC(generation);

            };
        };
    } forEach _modules;
} forEach _players;
    sleep Misery_AmbAI_SpawnTimer;
    false
};
