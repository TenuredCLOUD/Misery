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
if (isNil QGVAR(Building_used)) then {
    GVAR(Building_used) = [];
    publicVariable QGVAR(Building_used);
};

_players = call EFUNC(common,listPlayers);

{
    _player = _x;
    _playerPos = getPos _player;

    // Get nearest terrain objects that are buildings
    _BuildingArray = nearestTerrainObjects [_playerPos, ["HOUSE", "BUILDING"], 100, false, true];

    {
        _Building = _x;

        if (!(typeOf _Building in GVAR(buildingBlacklist)) && !(_Building in GVAR(Building_used))) then {
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
                    case ("barracks" in _buildingType): {
                        _isMilitary = true;
                    };
                    case ("military" in _buildingType): {
                        _isMilitary = true;
                    };
                    case ("guardhouse" in _buildingType): {
                        _isMilitary = true;
                    };
                    case ("terminal" in _buildingType): {
                        _isMilitary = true;
                    };
                    case ("bunker" in _buildingType): {
                        _isMilitary = true;
                    };
                //Medical building:
                    case ("medical" in _buildingType): {
                        _isMedical = true;
                    };
                    case ("hospital" in _buildingType): {
                        _isMedical = true;
                    };
                //Store building:
                    case ("store" in _buildingType): {
                        _isStore = true;
                    };
                    case ("grocery" in _buildingType): {
                        _isStore = true;
                    };
                    case ("shop" in _buildingType): {
                        _isStore = true;
                    };
                //Garage building:
                    case ("workshop" in _buildingType): {
                        _isGarage = true;
                    };
                    case ("garage" in _buildingType): {
                        _isGarage = true;
                    };
                    case ("factory" in _buildingType): {
                        _isGarage = true;
                    };
                    case ("hangar" in _buildingType): {
                        _isGarage = true;
                    };
                    case ("shed" in _buildingType): {
                        _isGarage = true;
                    };
                    case ("cowshed" in _buildingType): {
                        _isGarage = true;
                    };
                };

                // Adjust probability for military buildings
                if (_isMilitary) then {GVAR(chance) * 2.5} else {GVAR(chance)};

                if (GVAR(chance) > random 100) then {
                    [_buildingPos, GVAR(debug), _isMilitary, _isMedical, _isStore, _isGarage] call FUNC(generate);
                    if !(_Building in GVAR(Building_used)) then {
                        GVAR(Building_used) pushBack _Building; // Add the building to the blacklist
                        publicVariable QGVAR(Building_used); // Broadcast the updated blacklist
                    };
                };
            } forEach _buildingPositions;
        };
    } forEach _BuildingArray;
} forEach _players;

[{
    [] call FUNC(loop); // Loop loot check & generation every 10 seconds
}, [], 10] call CBA_fnc_waitAndExecute;
