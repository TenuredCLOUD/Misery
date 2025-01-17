#include "..\script_component.hpp"
/*
Misery MP handler
Dedi + Hosted handle for respawn events: - great help from Haleks
Designed specifically for Misery mod
by TenuredCLOUD
*/

private ["_miseryDebuffs"];

private _MiseryaddMissionEHs = {
    if (isNil {missionNamespace getVariable "ServerPersistHandles"}) then {
        missionNamespace setVariable ["ServerPersistHandles", true];

        // Handle disconnect
         private _disconnectIndex = addMissionEventHandler ["PlayerDisconnected", {
            params ["_unit"];
            systemChat format ["PlayerDisconnected Event Triggered: Unit: %1", _unit];
            removeAllActions _unit;
            deleteVehicle _unit;
        }];

        // Handle respawn
        private _respawnedIndex = addMissionEventHandler ["EntityRespawned", {
            [ [], "\z\misery\addons\Persistency\functions\fnc_Persistencehandle.sqf"] remoteExec ["call ", _this select 0, true];
        }];

        // Handle killed
        private _killedIndex = addMissionEventHandler ["EntityKilled", {
            params ["_killed", "_killer", "_instigator"];
            systemChat format ["EntityKilled Event Triggered: Killed: %1, Killer: %2, Instigator: %3", _killed, _killer, _instigator];
            if (_killed == player) then {
                systemChat "Player killed. Calling Misery_fnc_DeleteData.";
                [_this select 0] call FUNC(DeleteData);
            };
        }];
    };
};

private _MiseryaddRespawnEHs = {
    if (isNil {player getVariable "PlayerRespawnHandles"}) then {
        player setVariable ["PlayerRespawnHandles", true];

        private _respawnIndex = player addEventHandler ["Respawn", {
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
                [QEGVAR(survival,thirst), MACRO_PLAYER_THIRST],
                [QEGVAR(survival,hunger), MACRO_PLAYER_HUNGER],
                [QEGVAR(survival,energyDeficit), MACRO_PLAYER_FATIGUE],
                [QEGVAR(survival,toxicity), MACRO_PLAYER_TOXICITY],
                [QEGVAR(survival,infection), MACRO_PLAYER_INFECTION],
                [QEGVAR(survival,exposure), MACRO_PLAYER_EXPOSURE],
                [QCLASS(psycosis), MACRO_PLAYER_FEAR],
                [QCLASS(infectionLogged), nil],
                [QCLASS(turbidWaterLogged), nil],
                [QCLASS(rawMeatLogged), nil],
                [QCLASS(ailments), _MiseryDebuffs],
                [QCLASS(craftingKnowledge), _MiseryCraftingKnowledge],
                [QCLASS(cookingKnowledge), _MiseryCookingKnowledge],
                [QCLASS(hydrologyKnowledge), _MiseryWContainerKnowledge],
                [QCLASS(currency), 0],
                [QCLASS(breathCondensationEffect), nil],
                [QCLASS(breathCondensation), false]
            ];
        }];
    };
};

if (MiserysurvivalSaveMode == 2) then {
    if (isServer) then {
        call _MiseryaddMissionEHs;
    };

    if (!hasInterface) exitWith {};

    call _MiseryaddRespawnEHs;

    if (EGVAR(common,checkMultiplayer)savecycle == -1) exitWith {};

    waitUntil {sleep 2; !isNull player};
    while {alive player} do {
        [player] call FUNC(Serializeplayer);
        uiSleep EGVAR(common,checkMultiplayer)savecycle;
    };
};


// private ["_miseryDebuffs"];

// if (MiserysurvivalSaveMode == 2) then {

// if (isServer) then {

//     // Check if the event handlers have already been added
//     if (isNil {missionNamespace getVariable "ServerPersistHandles"}) then {
//         missionNamespace setVariable ["ServerPersistHandles", true];

//         //Haleks Ravage dedi MP handle disconnect code: (removes actions and unit after leaving a server)
//         //- without handle player character dies in server after leaving corpse is left
//         private _disconnectIndex = addMissionEventHandler ["HandleDisconnect",{ //server only // run on dedicated server or player host
//             _unit = _this select 0;
//             removeAllActions _unit;
//             _wpns = nearestObjects [getposATL _unit, ["weaponHolderSimulated", "weaponHolder", "groundweaponholder", "Bag_Base"], 3];
//             {
//                 deleteVehicle _x;
//             } forEach _wpns + [_unit];
//             false
//         }];

//         //reload handle:
//         private _respawnedIndex = addMissionEventHandler ["EntityRespawned",{
//             [ [], "Persistency\Persistencehandle.sqf"] remoteExec ["call ", _this select 0, true];
//         }];

//         //Kill handle for Singleplayer and Multiplayer environments (enforces character data deletion when utilizing Persistent data)
//         private _killedIndex = addMissionEventHandler ["EntityKilled", {
//             params ["_unit", "_killer", "_instigator", "_useEffects"];
//             if (_unit == player) then {
//                 [_this select 0] call Misery_fnc_DeleteData;
//             };
//         }];
//     };
// };

// if (!hasInterface) exitWith {}; //If not player exit

// //Respawn handles (SP & MP)
// if (isNil {player getVariable "PlayerRespawnHandles"}) then {
//     player setVariable ["PlayerRespawnHandles", true];

//     if (EGVAR(common,checkMultiplayer)) then {
//         private _respawnIndex = player addEventHandler ["Respawn",{
//             params ["_unit", "_corpse"];
//             _MiseryDebuffs = [];
//             _MiseryCraftingKnowledge = [];
//             _MiseryCookingKnowledge = [];
//             _MiseryWContainerKnowledge = [];
//             {
//                 _var = (_this select 0) getVariable [_x select 0, nil];
//                 if (!isNil "_var") then {
//                     (_this select 0) setVariable [_x select 0, _x select 1];
//                 };
//             } forEach [
//                 [QEGVAR(survival,thirst), MACRO_PLAYER_THIRST],
//                 [QEGVAR(survival,hunger), MACRO_PLAYER_HUNGER],
//                 [QEGVAR(survival,energyDeficit), MACRO_PLAYER_FATIGUE],
//                 [QEGVAR(survival,toxicity), MACRO_PLAYER_TOXICITY],
//                 [QEGVAR(survival,infection), MACRO_PLAYER_INFECTION],
//                 [QEGVAR(survival,exposure), MACRO_PLAYER_EXPOSURE],
//                 [QCLASS(psycosis), MACRO_PLAYER_FEAR],
//                 [QCLASS(infectionLogged), nil],
//                 [QCLASS(turbidWaterLogged), nil],
//                 [QCLASS(rawMeatLogged), nil],
//                 [QCLASS(ailments), _MiseryDebuffs],
//                 [QCLASS(craftingKnowledge), _MiseryCraftingKnowledge],
//                 [QCLASS(cookingKnowledge), _MiseryCookingKnowledge],
//                 [QCLASS(hydrologyKnowledge), _MiseryWContainerKnowledge],
//                 [QCLASS(currency), 0],
//                 [QCLASS(breathCondensationEffect), nil],
//                 [QCLASS(breathCondensation), false]
//             ];
//         }];
//     } else {
//         private _respawnIndex = player addEventHandler ["Respawn",{
//             params ["_unit", "_corpse"];
//             _MiseryDebuffs = [];
//             _MiseryCraftingKnowledge = [];
//             _MiseryCookingKnowledge = [];
//             _MiseryWContainerKnowledge = [];
//             {
//                 _var = (_this select 0) getVariable [_x select 0, nil];
//                 if (!isNil "_var") then {
//                     (_this select 0) setVariable [_x select 0, _x select 1];
//                 };
//             } forEach [
//                 [QEGVAR(survival,thirst), MACRO_PLAYER_THIRST],
//                 [QEGVAR(survival,hunger), MACRO_PLAYER_HUNGER],
//                 [QEGVAR(survival,energyDeficit), MACRO_PLAYER_FATIGUE],
//                 [QEGVAR(survival,toxicity), MACRO_PLAYER_TOXICITY],
//                 [QEGVAR(survival,infection), MACRO_PLAYER_INFECTION],
//                 [QEGVAR(survival,exposure), MACRO_PLAYER_EXPOSURE],
//                 [QCLASS(psycosis), MACRO_PLAYER_FEAR],
//                 [QCLASS(infectionLogged), nil],
//                 [QCLASS(turbidWaterLogged), nil],
//                 [QCLASS(rawMeatLogged), nil],
//                 [QCLASS(ailments), _MiseryDebuffs],
//                 [QCLASS(craftingKnowledge), _MiseryCraftingKnowledge],
//                 [QCLASS(cookingKnowledge), _MiseryCookingKnowledge],
//                 [QCLASS(hydrologyKnowledge), _MiseryWContainerKnowledge],
//                 [QCLASS(currency), 0],
//                 [QCLASS(breathCondensationEffect), nil],
//                 [QCLASS(breathCondensation), false]
//             ];
//         }];
//     };
// };

// if (EGVAR(common,checkMultiplayer)savecycle == -1) exitWith {};

// waitUntil {sleep 2; !isNull player};
// while {alive player} do {
//     [player] call Misery_fnc_MiserySerializeplayer;
//     uiSleep EGVAR(common,checkMultiplayer)savecycle;
// };
// };
