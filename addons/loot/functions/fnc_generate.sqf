#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Loot Generation
 *
 * Arguments:
 * 0: Building Positions <ARRAY>
 * 1: Debug Enabled <BOOL>
 * 2: Is Military building <BOOL>
 * 3: Is Medical building <BOOL>
 * 4: Is Store building <BOOL>
 * 5: Is Garage building <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_loot_fnc_generate;
 *
*/

private ["_spawnPosition", "_enableDebug", "_isMilitary", "_holder", "_lootType", "_markerID", "_debugMarker", "_weaponChoice", "_magChoice", "_itemChoice", "_clothingChoice", "_vestChoice", "_backpackChoice", "_explosiveChoice", "_maxAllowedItems", "_compatibleMags", "_compatibleAttachments"];

params ["_spawnPosition", "_enableDebug", "_isMilitary", "_isMedical", "_isStore", "_isGarage"];

_holder = createVehicle ["GroundWeaponHolder", _spawnPosition, [], 0, "CAN_COLLIDE"];
removeFromRemainsCollector [_holder]; //Remove _holders from Garbage system to prevent deletion
_holder setVectorUp surfaceNormal getPosASL _holder; //Align object with the terrain underneath 

// Adjust loot type probabilities based on building type
if (_isMilitary) then {
    _lootType = selectRandom [0, 0, 1, 1]; // Higher probability for weapons and explosives
} else {
    // Adjusted loot types for non-military buildings
    _lootType = selectRandom []; // Slim chance for weapons
};

if (_enableDebug) then {
    _markerID = format ["%1", _spawnPosition];
    _debugMarker = createMarker [_markerID, getPos _holder];
    _debugMarker setMarkerShape "ICON";
    _debugMarker setMarkerType "hd_dot";
    _debugMarker setMarkerColor "ColorRed";
    _debugMarker setMarkerText format ["%1", _lootType];
};

// Assign loot based on type and military status
switch (_lootType) do {
    case 0: {
        _weaponChoice = MiseryLootWeapons call BIS_fnc_selectRandom;
        _holder addWeaponCargoGlobal [_weaponChoice, 1];

        // Add magazines and attachments based on building type
        if (_isMilitary) then {
            // High-quality magazines and attachments for military buildings
            _compatibleMags = getArray (configFile >> "CfgWeapons" >> _weaponChoice >> "magazines");
            if (count _compatibleMags > 0) then {
                for "_i" from 1 to 2 do {
                    _holder addMagazineCargoGlobal [selectRandom _compatibleMags, 1];
                };
            };

            _compatibleAttachments = compatibleItems _weaponChoice;
            if (count _compatibleAttachments > 0) then {
                    _holder addItemCargoGlobal [selectRandom _compatibleAttachments, 1];
            };
        } else {
            // Basic magazines and no attachments for non-military buildings
            _compatibleMags = getArray (configFile >> "CfgWeapons" >> _weaponChoice >> "magazines");
            if (count _compatibleMags > 0) then {
                for "_i" from 1 to _maxAllowedItems do {
                    _holder addMagazineCargoGlobal [_compatibleMags select 0, 1];
                };
            };
        };
    };
    case 1: {
        _weaponChoice = MiseryLootWeapons call BIS_fnc_selectRandom;
        _compatibleMags = getArray (configFile >> "CfgWeapons" >> _weaponChoice >> "magazines");
        _holder addMagazineCargoGlobal [_compatibleMags select 0, 2];
    };
    
    //Need to add more cases for loot types --- WIP
};