/*
Misery POI Master Checking loop 
Consistenty checks players positions relative to module positions
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _modules = allMissionObjects "Misery_POI"; 

waitUntil {
    private _players = call Misery_fnc_ListPlayers;
    {
        private _player = _x;
        {
            private _module = _x;
            private _pos = getPos _module;

            private _distance = _player distance _pos;

			// Define the maximum spawn distance as double the spawn check distance for a "Safe buffer"
            private _maxSpawnDistance = 2 * Misery_POISpawnCheckDistance;

            // Check if the POI is within the spawn check distance and less than the maximum spawn distance
            if (_distance > Misery_POISpawnCheckDistance && _distance < _maxSpawnDistance) then {

                private _poiType = _module getVariable "Misery_POI_Type"; //STRING

                private _poiSpawned = _module getVariable ["Misery_POI_Spawned", false];

                if (!(_poiSpawned) && isServer) then {

                _module setVariable ["Misery_POI_Spawned", true, true];

    			switch (_poiType) do {
        		case "CAMP": {
            	[
				_module,
				(_module getVariable "Misery_POI_faction"),
				(_module getVariable "Misery_POI_AIClass"),
				(_module getVariable "Misery_POI_AICountMAX"),
				(_module getVariable "Misery_POI_AICountMIN"),
				(_module getVariable "Misery_POI_AISpawnDistance"),
            	(_module getVariable "MiseryPOIAIWeapPrimaryLoot"),
            	(_module getVariable "MiseryPOIAIWeapSecondaryLoot"),
            	(_module getVariable "MiseryPOIAIWeaplauncherLoot"),
				(_module getVariable "MiseryPOIAIAmmo"),
            	(_module getVariable "MiseryPOIAIItemLoot"),
            	(_module getVariable "MiseryPOIAINVGLoot"),
				(_module getVariable "MiseryPOIAIFacewearLoot"),
            	(_module getVariable "MiseryPOIAIHeadgearLoot"),
            	(_module getVariable "MiseryPOIAIUniformLoot"),
            	(_module getVariable "MiseryPOIAIVestLoot"),
            	(_module getVariable "MiseryPOIAIBackpackLoot"),
            	(_module getVariable "MiseryPOICrateWeaponLoot"),
            	(_module getVariable "MiseryPOICrateWeaponMagLoot"),
            	(_module getVariable "MiseryPOICrateWeaponAttachmentLoot"),
            	(_module getVariable "MiseryPOICrateItemLoot"),
            	(_module getVariable "MiseryPOICrateUniformLoot"),
            	(_module getVariable "MiseryPOICrateVestLoot"),
            	(_module getVariable "MiseryPOICrateBackpackLoot"),
            	(_module getVariable "MiseryPOICrateItemsMAX"),
				(_module getVariable "MiseryPOICrateItemsMIN"),
            	(_module getVariable "MiseryPOIObjectsMAX"),
				(_module getVariable "MiseryPOIObjectsMIN"),
            	(_module getVariable "MiseryPOICratesMAX"),
				(_module getVariable "MiseryPOICratesMIN"),
            	(_module getVariable "MiseryPOITenttypes"),
            	(_module getVariable "MiseryPOICratetypes"),
            	(_module getVariable "MiseryPOIAIAccuracy"),
            	(_module getVariable "MiseryPOIAIShake"),
            	(_module getVariable "MiseryPOIAISpeed"),
            	(_module getVariable "MiseryPOISpawnChance")
				] execVM "\z\misery\addons\poi\functions\fnc_Campground.sqf";
        		};
       			 case "HELIWRECK": {
            	[
				_module,
				(_module getVariable "MiseryPOICratesMAX"),
				(_module getVariable "MiseryPOICratesMIN"),
				(_module getVariable "MiseryPOICratetypes"),
				(_module getVariable "MiseryPOICrateItemsMAX"),
				(_module getVariable "MiseryPOICrateItemsMIN"),
            	(_module getVariable "MiseryPOIHeliwrecktypes"),
				(_module getVariable "MiseryPOISpawnChance"),
            	(_module getVariable "MiseryPOICrateWeaponLoot"),
            	(_module getVariable "MiseryPOICrateWeaponMagLoot"),
            	(_module getVariable "MiseryPOICrateWeaponAttachmentLoot"),
            	(_module getVariable "MiseryPOICrateItemLoot"),
            	(_module getVariable "MiseryPOICrateUniformLoot"),
            	(_module getVariable "MiseryPOICrateVestLoot"),
            	(_module getVariable "MiseryPOICrateBackpackLoot")
				] execVM "\z\misery\addons\poi\functions\fnc_HeliWreck.sqf";
        		};
        		case "SHORELOOT": {
            	[
				_module,
				(_module getVariable "MiseryPOICratesMAX"),
				(_module getVariable "MiseryPOICratesMIN"),
				(_module getVariable "MiseryPOICratetypes"),
				(_module getVariable "MiseryPOICrateItemsMAX"),
				(_module getVariable "MiseryPOICrateItemsMIN"),
            	(_module getVariable "MiseryPOIShorelootwrecktypes"),
				(_module getVariable "MiseryPOISpawnChance"),
            	(_module getVariable "MiseryPOICrateWeaponLoot"),
            	(_module getVariable "MiseryPOICrateWeaponMagLoot"),
            	(_module getVariable "MiseryPOICrateWeaponAttachmentLoot"),
            	(_module getVariable "MiseryPOICrateItemLoot"),
            	(_module getVariable "MiseryPOICrateUniformLoot"),
            	(_module getVariable "MiseryPOICrateVestLoot"),
            	(_module getVariable "MiseryPOICrateBackpackLoot")
				] execVM "\z\misery\addons\poi\functions\fnc_ShoreLoot.sqf";
        		};
        		case "PMCRAID": {
            	[
				_module,
				(_module getVariable "Misery_POI_faction"),
				(_module getVariable "Misery_POI_AIClass"),
				(_module getVariable "Misery_POI_AICountMAX"),
				(_module getVariable "Misery_POI_AICountMIN"),
				(_module getVariable "Misery_POI_AISpawnDistance"),
            	(_module getVariable "MiseryPOIAIWeapPrimaryLoot"),
            	(_module getVariable "MiseryPOIAIWeapSecondaryLoot"),
            	(_module getVariable "MiseryPOIAIWeaplauncherLoot"),
				(_module getVariable "MiseryPOIAIAmmo"),
            	(_module getVariable "MiseryPOIAIItemLoot"),
            	(_module getVariable "MiseryPOIAINVGLoot"),
				(_module getVariable "MiseryPOIAIFacewearLoot"),
            	(_module getVariable "MiseryPOIAIHeadgearLoot"),
            	(_module getVariable "MiseryPOIAIUniformLoot"),
            	(_module getVariable "MiseryPOIAIVestLoot"),
            	(_module getVariable "MiseryPOIAIBackpackLoot"),
            	(_module getVariable "MiseryPOICrateWeaponLoot"),
            	(_module getVariable "MiseryPOICrateWeaponMagLoot"),
            	(_module getVariable "MiseryPOICrateWeaponAttachmentLoot"),
            	(_module getVariable "MiseryPOICrateItemLoot"),
            	(_module getVariable "MiseryPOICrateUniformLoot"),
            	(_module getVariable "MiseryPOICrateVestLoot"),
            	(_module getVariable "MiseryPOICrateBackpackLoot"),
            	(_module getVariable "MiseryPOICrateItemsMAX"),
				(_module getVariable "MiseryPOICrateItemsMIN"),
            	(_module getVariable "MiseryPOIObjectsMAX"),
				(_module getVariable "MiseryPOIObjectsMIN"),
            	(_module getVariable "MiseryPOICratesMAX"),
				(_module getVariable "MiseryPOICratesMIN"),
            	(_module getVariable "MiseryPOITenttypes"),
            	(_module getVariable "MiseryPOIFlagTypes"),
            	(_module getVariable "MiseryPOICratetypes"),
            	(_module getVariable "MiseryPOIAIAccuracy"),
            	(_module getVariable "MiseryPOIAIShake"),
            	(_module getVariable "MiseryPOIAISpeed"),
            	(_module getVariable "MiseryPOISpawnChance")
				] execVM "\z\misery\addons\poi\functions\fnc_Raid.sqf";
        	};
        default {
            systemChat format ["Unknown POI type: %1", _poiType];
        			
					};
    			};
			};
        };
    } forEach _modules;
} forEach _players;
    sleep Misery_POISpawnTimer; 
    false // This loop will run indefinitely
};