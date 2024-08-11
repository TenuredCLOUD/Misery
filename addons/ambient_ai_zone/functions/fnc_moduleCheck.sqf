/*
Misery Ambient AI Zones Master Checking loop
Consistenty checks players positions relative to module positions
Designed specifically for Misery mod
by TenuredCLOUD
*/

private _modules = allMissionObjects "Misery_Ambient_AI_Zone";

waitUntil {
    private _players = call Misery_fnc_ListPlayers;

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

                private _AI_ZoneSpawned = _module getVariable ["Misery_AI_Zone_Spawned", false];

                if (!(_AI_ZoneSpawned) && isServer) then {

                _module setVariable ["Misery_AI_Zone_Spawned", true, true];

                [
                _module,
                (_module getVariable "Misery_AI_Zone_faction"),
                (_module getVariable "Misery_AI_Zone_Class"),
                (_module getVariable "Misery_AI_Zone_GroupMAX"),
                (_module getVariable "Misery_AI_Zone_WeapPrimaryLoot"),
                (_module getVariable "Misery_AI_Zone_WeapSecondaryLoot"),
                (_module getVariable "Misery_AI_Zone_WeaplauncherLoot"),
                (_module getVariable "Misery_AI_Zone_Ammo"),
                (_module getVariable "Misery_AI_Zone_ItemLoot"),
                (_module getVariable "Misery_AI_Zone_NVGLoot"),
                (_module getVariable "Misery_AI_Zone_FacewearLoot"),
                (_module getVariable "Misery_AI_Zone_HeadgearLoot"),
                (_module getVariable "Misery_AI_Zone_UniformLoot"),
                (_module getVariable "Misery_AI_Zone_VestLoot"),
                (_module getVariable "Misery_AI_Zone_BackpackLoot"),
                (_module getVariable "Misery_AI_Zone_Accuracy"),
                (_module getVariable "Misery_AI_Zone_Shake"),
                (_module getVariable "Misery_AI_Zone_Speed"),
                (_module getVariable "Misery_AI_Zone_SpawnChance"),
                (_module getVariable "Misery_AI_Zone_ModuleSpawnDistanceMIN"),
                (_module getVariable "Misery_AI_Zone_ModuleSpawnDistanceMAX")
                ] execVM "\z\misery\addons\Ambient_AI_Zone\functions\fnc_AI_Generation.sqf";

            };
        };
    } forEach _modules;
} forEach _players;
    sleep Misery_AmbAI_SpawnTimer;
    false
};
