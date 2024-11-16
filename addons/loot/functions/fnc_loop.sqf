#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Loot Server Loop 
 * Monitors Players positions relative to buildings
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_loot_fnc_loop;
 *
*/

private ["_players", "_player", "_playerPos", "_distance", "_BuildingArray", "_Building", "_buildingPositions", "_buildingPos", "_buildingType", "_isMilitary"];

// Prep Global array for already spawned loot inside buildings & share across network
if (isNil "MiseryLootBldgUsed") then {
    MiseryLootBldgUsed = [];
    publicVariable "MiseryLootBldgUsed";
};

_players = call EFUNC(common,listPlayers);

{
    _player = _x;
    _playerPos = getPos _player;

    // Get nearest terrain objects that are buildings
    _BuildingArray = nearestTerrainObjects [_playerPos, ["HOUSE", "BUILDING"], 100, false, true];

    {
        _Building = _x;

        if (!(typeOf _Building in MiseryLootBldgBlacklist) && !(_Building in MiseryLootBldgUsed)) then {
            _buildingPositions = _Building call BIS_fnc_buildingPositions;

            {
                _buildingPos = _x;

                // Check if building is military using refined filtering
                _buildingType = toLower (getText (configFile >> "CfgVehicles" >> (typeOf _Building) >> "displayName"));
                _isMilitary = false;
                _isMedical = false;
                _isStore = false;
                _isGarage = false;

                //Building checks:
                switch true do {
                //Military building:
                    case (_buildingType find "barracks" > -1): {
                        _isMilitary = true;
                    };
                    case (_buildingType find "military" > -1): {
                        _isMilitary = true;
                    };
                    case (_buildingType find "guardhouse" > -1): {
                        _isMilitary = true;
                    };
                    case (_buildingType find "terminal" > -1): {
                        _isMilitary = true;
                    };
                    case (_buildingType find "bunker" > -1): {
                        _isMilitary = true;
                    };
                //Medical building:
                    case (_buildingType find "medical" > -1): {
                        _isMedical = true;
                    };
                    case (_buildingType find "hospital" > -1): {
                        _isMedical = true;
                    };
                //Store building:
                    case (_buildingType find "store" > -1): {
                        _isStore = true;
                    };
                    case (_buildingType find "grocery" > -1): {
                        _isStore = true;
                    };
                    case (_buildingType find "shop" > -1): {
                        _isStore = true;
                    };
                //Garage building:
                    case (_buildingType find "workshop" > -1): {
                        _isGarage = true;
                    };
                    case (_buildingType find "garage" > -1): {
                        _isGarage = true;
                    };
                    case (_buildingType find "factory" > -1): {
                        _isGarage = true;
                    };
                    case (_buildingType find "hangar" > -1): {
                        _isGarage = true;
                    };
                    case (_buildingType find "shed" > -1): {
                        _isGarage = true;
                    };
                    case (_buildingType find "cowshed" > -1): {
                        _isGarage = true;
                    };
                };

                // Adjust probability for military buildings
                if (_isMilitary) then {MiseryLootChance * 2.5} else {MiseryLootChance};

                if (MiseryLootChance > random 100) then {
                    [_buildingPos, MiseryLootDebug, _isMilitary, _isMedical, _isStore, _isGarage] call FUNC(generate);
                    if !(_Building in MiseryLootBldgUsed) then {
                        MiseryLootBldgUsed pushBack _Building; // Add the building to the blacklist
                        publicVariable "MiseryLootBldgUsed"; // Broadcast the updated blacklist
                    };
                };
            } forEach _buildingPositions;
        };
    } forEach _BuildingArray;
} forEach _players;

[{
    [] call FUNC(loop); // Loop loot check & generation every 10 seconds
}, [], 10] call CBA_fnc_waitAndExecute;
