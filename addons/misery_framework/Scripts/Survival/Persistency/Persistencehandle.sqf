/* -----------------------------------
Misery MP handler
Dedi + Hosted handle for respawn events: - great help from Haleks
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

private ["_miseryDebuffs"];

if (MiserySurvivalSaveMode == 2) then {

if (isServer) then {

    // Check if the event handlers have already been added
    if (isNil {missionNamespace getVariable "ServerPersistHandles"}) then {
        missionNamespace setVariable ["ServerPersistHandles", true];

        //Haleks Ravage dedi MP handle disconnect code: (removes actions and unit after leaving a server) 
        //- without handle player character dies in server after leaving
        private _disconnectIndex = addMissionEventHandler ["HandleDisconnect",{ //server only // run on dedicated server or player host
            _unit = _this select 0;
            removeAllActions _unit;
            _wpns = nearestObjects [getposATL _unit, ["weaponHolderSimulated", "weaponHolder", "groundweaponholder", "Bag_Base"], 3];
            {
                deleteVehicle _x;
            } forEach _wpns + [_unit];
            false
        }];

        //reload handle:
        private _respawnedIndex = addMissionEventHandler ["EntityRespawned",{
            [ [], "Misery\Scripts\Survival\Persistency\Persistencehandle.sqf"] remoteExec ["execVM", _this select 0, true];
        }];

        //Kill handle for Singleplayer and Multiplayer environments (enforces character data deletion when utilizing Persistent data)
        private _killedIndex = addMissionEventHandler ["EntityKilled", {
            params ["_killed", "_killer", "_instigator"];
            if (_killed == player) then {
                [_this select 0] call Misery_fnc_DeleteData;
            };
        }];
    };
};

if (!hasInterface) exitWith {}; //If not player exit

//Respawn handles (SP & MP)
if (isNil {player getVariable "PlayerRespawnHandles"}) then {
    player setVariable ["PlayerRespawnHandles", true];

    if (MiseryMP) then {
        private _respawnIndex = player addEventHandler ["Respawn",{ 
            params ["_unit", "_corpse"];
            _MiseryDebuffs = [];
            _MiseryCraftingKnowledge = [];
            _MiseryCookingKnowledge = [];
            _MiseryWContainerKnowledge = [];
            {
                _var = (_this select 0) getVariable [_x select 0, nil];
                if (!isNil "_var") then {
                    (_this select 0) setVariable [_x select 0, _x select 1];
                };
            } forEach [
                ["MiseryThirst", MIS_THIRST],
                ["MiseryHunger", MIS_HUNGER],
                ["MiserySleepiness", MIS_SLEEP],
                ["MiseryPoison", MIS_POISON],
                ["MiseryInfection", MIS_INFECTION],
                ["MiseryExposure", MIS_EXPOSURE],
                ["MiseryFear", MIS_FEAR],
                ["Zinfectionlogged", nil],
		        ["Turbidwaterlogged", nil],
		        ["Rawmeatlogged", nil],
                ["MiseryDebuffs", _MiseryDebuffs],
                ["Misery_Crafting_DataSet", _MiseryCraftingKnowledge],
                ["Misery_Cooking_DataSet", _MiseryCookingKnowledge],
                ["Misery_WaterCollect_DataSet", _MiseryWContainerKnowledge],
                ["MiseryCurrency", 0],
                ["MiseryBreathFogSim", nil],
                ["MiseryBreath", false]
            ];
        }];
    } else {
        private _respawnIndex = player addEventHandler ["Respawn",{ 
            params ["_unit", "_corpse"];
            _MiseryDebuffs = [];
            _MiseryCraftingKnowledge = [];
            _MiseryCookingKnowledge = [];
            _MiseryWContainerKnowledge = [];
            {
                _var = (_this select 0) getVariable [_x select 0, nil];
                if (!isNil "_var") then {
                    (_this select 0) setVariable [_x select 0, _x select 1];
                };
            } forEach [
                ["MiseryThirst", MIS_THIRST],
                ["MiseryHunger", MIS_HUNGER],
                ["MiserySleepiness", MIS_SLEEP],
                ["MiseryPoison", MIS_POISON],
                ["MiseryInfection", MIS_INFECTION],
                ["MiseryExposure", MIS_EXPOSURE],
                ["MiseryFear", MIS_FEAR],
                ["Zinfectionlogged", nil],
		        ["Turbidwaterlogged", nil],
		        ["Rawmeatlogged", nil],
                ["MiseryDebuffs", _MiseryDebuffs],
                ["Misery_Crafting_DataSet", _MiseryCraftingKnowledge],
                ["Misery_Cooking_DataSet", _MiseryCookingKnowledge],
                ["Misery_WaterCollect_DataSet", _MiseryWContainerKnowledge],
                ["MiseryCurrency", 0],
                ["MiseryBreathFogSim", nil],
                ["MiseryBreath", false]
            ];
        }];
    };
};

if (MiseryMPsavecycle == -1) exitwith {};

waitUntil {sleep 2; !isnull player};
while {alive player} do {
    [player] call Misery_fnc_MiserySerializeplayer;
    uiSleep MiseryMPsavecycle;
};
};