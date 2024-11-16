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

private ["_spawnPosition", "_enableDebug", "_isMilitary", "_isMedical", "_isStore", "_isGarage", "_holder", "_lootType", "_markerID", "_debugMarker", "_weaponChoice", "_magChoice", "_itemChoice", "_clothingChoice", "_vestChoice", "_backpackChoice", "_explosiveChoice", "_maxAllowedItems", "_compatibleMags", "_compatibleAttachments", "_fromPos", "_toPos", "_raycastResult", "_collisionPos", "_adjustedPos", "_fallbackPos", "_itemAddProbabilityUniform", "_uniformItems", "_itemFoodChoice", "_itemFoodChoiceM", "_itemMedicalChoice", "_itemMedicalChoiceM", "_itemChoiceM", "_itemAddProbabilityVest", "_vestItems", "_itemAddProbabilityPack", "_backpackItems", "_headgearChoice", "_facewearChoice"];

params ["_spawnPosition", "_enableDebug", "_isMilitary", "_isMedical", "_isStore", "_isGarage"];

_holder = createVehicle ["GroundWeaponHolder", _spawnPosition, [], 0, "CAN_COLLIDE"];
removeFromRemainsCollector [_holder]; //Remove _holders from Garbage system to prevent deletion

// Align with the terrain
_holder setVectorUp (surfaceNormal (getPosASL _holder));

// Perform a raycast to find the ground level
_fromPos = getPosASL _holder;
_toPos = [_fromPos select 0, _fromPos select 1, (_fromPos select 2) - 2]; // Cast 2 meters down

_raycastResult = lineIntersectsSurfaces [_fromPos, _toPos, _holder, objNull, true, 1, "GEOM", "NONE"];
if (count _raycastResult > 0) then {
    _collisionPos = _raycastResult select 0 select 0;
    _adjustedPos = _collisionPos;
    _adjustedPos set [2, (_adjustedPos select 2) + 0.05]; // Adjust slightly above the ground to avoid clipping
    _holder setPosASL _adjustedPos;
} else {
    // Fallback if no collision detected
    _fallbackPos = getPosATL _holder;
    _fallbackPos set [2, (_fallbackPos select 2) + 0.1]; // Adjust slightly above the ground
    _holder setPosATL _fallbackPos;
};

// Adjust loot type probabilities based on building type 
/*
0 - Weapoms
1 - Items (Misc)
2 - Items (Food)
3 - Items (Medical)
4 - Clothing 
5 - Vests
6 - Backpacks
7 - Headwear
8 - Facewear
9 - Specials (NVG, Map, Radio)
10 - Explosives
*/

switch true do { 
case _isMilitary: { 
// Higher probability for weapons and explosives 
_lootType = selectRandom [0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]; 
}; 
// Higher probability for medical supplies 
case _isMedical: { 
_lootType = 3; 
}; 
// Higher probability for general items and food 
case _isStore: { 
_lootType = selectRandom [1, 2, 4, 5, 6, 7, 8]; 
}; 
// Higher probability for tools and equipment 
case _isGarage: { 
_lootType = 1; 
}; 
default { 
// General loot for other buildings
_lootType = selectRandom [0, 1, 2, 3, 4, 5, 6, 7, 8]; 
};
    };

if (_enableDebug) then {
    _markerID = format ["%1", _spawnPosition];
    _debugMarker = createMarkerLocal [_markerID, getPos _holder];
    _debugMarker setMarkerShapeLocal "ICON";
    _debugMarker setMarkerTypeLocal "hd_dot";
    _debugMarker setMarkerColorLocal "ColorRed";
    _debugMarker setMarkerText format ["%1", _lootType];
};

switch (_loottype) do {
    case 0: {
        if (_isMilitary) then {
            if (count MiseryLootWeaponsM > 0) then {
                _weaponChoice = [MiseryLootWeaponsM] call FUNC(blacklistFilter);
                _holder addWeaponCargoGlobal [_weaponChoice, 1];
                _compatibleMags = getArray (configFile >> "CfgWeapons" >> _weaponChoice >> "magazines");
                if (count _compatibleMags > 0) then {
                    for "_i" from 1 to random (round 5) do {
                        _holder addMagazineCargoGlobal [selectRandom _compatibleMags, 1];
                    };
                };
                _compatibleAttachments = [_weaponChoice] call FUNC(compatibleAttachments);
                if (count _compatibleAttachments > 0) then {
                    for "_j" from 1 to random (round 2) do {
                        _holder addItemCargoGlobal [selectRandom _compatibleAttachments, 1];
                    };
                };
            };
        } else {
            if (count MiseryLootWeapons > 0) then {
                _weaponChoice = [MiseryLootWeapons] call FUNC(blacklistFilter);
                _holder addWeaponCargoGlobal [_weaponChoice, 1];
                _compatibleMags = getArray (configFile >> "CfgWeapons" >> _weaponChoice >> "magazines");
                if (count _compatibleMags > 0) then {
                    for "_i" from 1 to random (round 3) do {
                        _holder addMagazineCargoGlobal [_compatibleMags select 0, 1];
                    };
                };
            };
        };
    };
    case 1: {
        if (_isMilitary) then {
            if (count MiseryLootItemsMiscM > 0) then {
                _itemChoiceM = [MiseryLootItemsMiscM] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_itemChoiceM, 1];
            };
        } else {
            if (count MiseryLootItemsMisc > 0) then {    
                _itemChoice = [MiseryLootItemsMisc] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_itemChoice, 1];    
            };
        };
    };
    case 2: {
        if (_isMilitary) then {
            if (count MiseryLootItemsFoodM > 0) then {
                _itemFoodChoiceM = [MiseryLootItemsFoodM] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_itemFoodChoiceM, 1];
            };
        } else {
            if (count MiseryLootItemsFood > 0) then {
                _itemFoodChoice = [MiseryLootItemsFood] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_itemFoodChoice, 1];    
            };
        };
    };
    case 3: {
        if (_isMilitary) then {
            if (count MiseryLootItemsMedicalM > 0) then {
                _itemMedicalChoiceM = [MiseryLootItemsMedicalM] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_itemMedicalChoiceM, 1];
            };
        } else {
            if (count MiseryLootItemsMedical > 0) then {
                _itemMedicalChoice = [MiseryLootItemsMedical] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_itemMedicalChoice, 1];    
            };
        };
    };
    case 4: {
        if (_isMilitary) then {
            if (count MiseryLootUniformsM > 0) then {
                _clothingChoice = [MiseryLootUniformsM] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_clothingChoice, 1];
            };
        } else {
            if (count MiseryLootUniforms > 0) then {
                _clothingChoice = [MiseryLootUniforms] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_clothingChoice, 1];    
            };
        };

        if (MiseryLootUniformItemChance > random 100) then {
            _itemAddProbabilityUniform = 0.5;
            _uniformItems = [];
            if (_isMilitary) then {
                {
                    if (count _x > 0) then {
                        _uniformItems pushBack ([_x] call FUNC(blacklistFilter));
                    };
                } forEach [MiseryLootItemsM, MiseryLootItemsMiscM, MiseryLootItemsFoodM, MiseryLootItemsMedicalM];
            } else {
                {
                    if (count _x > 0) then {
                        _uniformItems pushBack ([_x] call FUNC(blacklistFilter));
                    };
                } forEach [MiseryLootItems, MiseryLootItemsMisc, MiseryLootItemsFood, MiseryLootItemsMedical];
            };
            {
                if (random 1 < _itemAddProbabilityUniform) then { 
                    _holder addItemToUniform [_clothingChoice, _x, 1]; 
                };
            } forEach _uniformItems;
        };
    };
    case 5: {
        if (_isMilitary) then {
            if (count MiseryLootVestsM > 0) then {
                _vestChoice = [MiseryLootVestsM] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_vestChoice, 1];    
            };
        } else {
            if (count MiseryLootVests > 0) then {
                _vestChoice = [MiseryLootVests] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_vestChoice, 1];        
            };
        };

        if (MiseryLootVestsItemChance > random 100) then {
            _itemAddProbabilityVest = 0.5;
            _vestItems = [];
            if (_isMilitary) then {
                {
                    if (count _x > 0) then {
                        _vestItems pushBack ([_x] call FUNC(blacklistFilter));
                    };
                } forEach [MiseryLootItemsM, MiseryLootItemsMiscM, MiseryLootItemsFoodM, MiseryLootItemsMedicalM];
            } else {
                {
                    if (count _x > 0) then {
                        _vestItems pushBack ([_x] call FUNC(blacklistFilter));
                    };
                } forEach [MiseryLootItems, MiseryLootItemsMisc, MiseryLootItemsFood, MiseryLootItemsMedical];
            };
            {
                if (random 1 < _itemAddProbabilityVest) then { 
                    _holder addItemToVest [_vestChoice, _x, 1]; 
                };
            } forEach _vestItems;
        };
    };
    case 6: {
        if (_isMilitary) then {
            if (count MiseryLootPacksM > 0) then {
                _backpackChoice = [MiseryLootPacksM] call FUNC(blacklistFilter);
                _holder addBackpackCargoGlobal [_backpackChoice, 1];
            };
        } else {
            if (count MiseryLootPacks > 0) then {
                _backpackChoice = [MiseryLootPacks] call FUNC(blacklistFilter);
                _holder addBackpackCargoGlobal [_backpackChoice, 1];    
            };
        };
        if (MiseryLootBackpacksItemChance > random 100) then {
            _itemAddProbabilityPack = 0.5;
            _backpackItems = [];
            if (_isMilitary) then {
                {
                    if (count _x > 0) then {
                        _backpackItems pushBack ([_x] call FUNC(blacklistFilter));
                    };
                } forEach [MiseryLootItemsM, MiseryLootItemsMiscM, MiseryLootItemsFoodM, MiseryLootItemsMedicalM];
            } else {
                {
                    if (count _x > 0) then {
                        _backpackItems pushBack ([_x] call FUNC(blacklistFilter));
                    };
                } forEach [MiseryLootItems, MiseryLootItemsMisc, MiseryLootItemsFood, MiseryLootItemsMedical];
            };
            {
                if (random 1 < _itemAddProbabilityPack) then {
                    _holder addItemToBackpack [_backpackChoice, _x, 1];
                };
            } forEach _backpackItems;
        };
    };
    case 7: {
        if (_isMilitary) then {
            if (count MiseryLootHeadgearM > 0) then {
                _headgearChoice = [MiseryLootHeadgearM] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_headgearChoice, 1];
            };
        } else {
            if (count MiseryLootHeadgear > 0) then {
                _headgearChoice = [MiseryLootHeadgear] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_headgearChoice, 1];    
            };
        };
    };
    case 8: {
        if (_isMilitary) then {
            if (count MiseryLootGogglesM > 0) then {
                _facewearChoice = [MiseryLootGogglesM] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_facewearChoice, 1];
            };
        } else {
            if (count MiseryLootGoggles > 0) then {
                _facewearChoice = [MiseryLootGoggles] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_facewearChoice, 1];    
            };
        };
    };
    //TODO: Add explosives & grenades 
};