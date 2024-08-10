/*
Misery Ambient AI Zones Master Checking loop 
Consistenty checks players positions relative to module positions
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _modules = allMissionObjects "Misery_Ambient_AI"; 

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

                private _AISpawned = _module getVariable ["Misery_AI_Spawned", false];

                if (!(_AISpawned) && isServer) then {

                _module setVariable ["Misery_AI_Spawned", true, true];

            	[
				_module,
				(_module getVariable "Misery_AI_faction"),
				(_module getVariable "Misery_AI_Class"),
				(_module getVariable "Misery_AI_GroupMAX"),
            	(_module getVariable "Misery_AI_WeapPrimaryLoot"),
            	(_module getVariable "Misery_AI_WeapSecondaryLoot"),
            	(_module getVariable "Misery_AI_WeaplauncherLoot"),
				(_module getVariable "Misery_AI_Ammo"),
            	(_module getVariable "Misery_AI_ItemLoot"),
            	(_module getVariable "Misery_AI_NVGLoot"),
				(_module getVariable "Misery_AI_FacewearLoot"),
            	(_module getVariable "Misery_AI_HeadgearLoot"),
            	(_module getVariable "Misery_AI_UniformLoot"),
            	(_module getVariable "Misery_AI_VestLoot"),
            	(_module getVariable "Misery_AI_BackpackLoot"),
            	(_module getVariable "Misery_AI_Accuracy"),
            	(_module getVariable "Misery_AI_Shake"),
            	(_module getVariable "Misery_AI_Speed"),
				(_module getVariable "Misery_AI_SpawnChance"),
				(_module getVariable "Misery_AI_ModuleSpawnDistanceMIN"),
				(_module getVariable "Misery_AI_ModuleSpawnDistanceMAX")
				] execVM "\z\misery\addons\Ambient_AI\functions\fnc_AI_Generation.sqf";
        		
			};
        };
    } forEach _modules;
} forEach _players;
    sleep Misery_AmbAI_SpawnTimer; 
    false 
};