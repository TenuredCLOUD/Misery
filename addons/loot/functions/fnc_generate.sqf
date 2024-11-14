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

// Align with the terrain
_holder setVectorUp (surfaceNormal (getPosASL _holder));

// Perform a raycast to find the ground level
private _fromPos = getPosASL _holder;
private _toPos = [_fromPos select 0, _fromPos select 1, (_fromPos select 2) - 2]; // Cast 2 meters down

private _raycastResult = lineIntersectsSurfaces [_fromPos, _toPos, _holder, objNull, true, 1, "GEOM", "NONE"];
if (count _raycastResult > 0) then {
    private _collisionPos = _raycastResult select 0 select 0;
    private _adjustedPos = _collisionPos;
    _adjustedPos set [2, (_adjustedPos select 2) + 0.05]; // Adjust slightly above the ground to avoid clipping
    _holder setPosASL _adjustedPos;
} else {
    // Fallback if no collision detected
    private _fallbackPos = getPosATL _holder;
    _fallbackPos set [2, (_fallbackPos select 2) + 0.1]; // Adjust slightly above the ground
    _holder setPosATL _fallbackPos;
};

// Adjust loot type probabilities based on building type 
switch true do { 
case _isMilitary: { 
// Higher probability for weapons and explosives 
_lootType = selectRandom [0, 0, 1, 1]; 
}; 
// Higher probability for medical supplies and clothing 
case _isMedical: { 
_lootType = selectRandom [2, 2, 3]; 
}; 
// Higher probability for general items and food 
case _isStore: { 
_lootType = selectRandom [4, 4, 5, 5]; 
}; 
// Higher probability for tools and equipment 
case _isGarage: { 
_lootType = selectRandom [6, 6, 7, 7]; 
}; 
default { 
// General loot for other buildings
_lootType = selectRandom [2, 3, 4, 5]; 
};
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