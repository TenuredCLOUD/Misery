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

private ["_spawnPosition", "_enableDebug", "_isMilitary", "_isMedical", "_isStore", "_isGarage", "_holder", "_lootType", "_markerID", "_debugMarker", "_weaponChoice", "_magChoice", "_itemChoice", "_clothingChoice", "_vestChoice", "_backpackChoice", "_explosiveChoice", "_maxAllowedItems", "_compatibleMags", "_compatibleAttachments", "_fromPos", "_toPos", "_raycastResult", "_collisionPos", "_adjustedPos", "_fallbackPos", "_itemAddProbabilityUniform", "_uniformItems", "_itemFoodChoice", "_itemFoodChoiceM", "_itemMedicalChoice", "_itemMedicalChoiceM", "_itemChoiceM", "_itemAddProbabilityVest", "_vestItems", "_itemAddProbabilityPack", "_backpackItems", "_headgearChoice", "_facewearChoice", "_grenadeChoice", "_explosiveChoice", "_specialChoice"];

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
_lootType = selectRandom [0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 10, 11];
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
            if (count GVAR(weaponsM) > 0) then {
                _weaponChoice = [GVAR(weaponsM)] call FUNC(blacklistFilter);
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
            if (count GVAR(weapons) > 0) then {
                _weaponChoice = [GVAR(weapons)] call FUNC(blacklistFilter);
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
            if (count GVAR(itemsMiscM) > 0) then {
                _itemChoiceM = [GVAR(itemsMiscM)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_itemChoiceM, 1];
            };
        } else {
            if (count GVAR(itemsMisc) > 0) then {
                _itemChoice = [GVAR(itemsMisc)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_itemChoice, 1];
            };
        };
    };
    case 2: {
        if (_isMilitary) then {
            if (count GVAR(itemsFoodM) > 0) then {
                _itemFoodChoiceM = [GVAR(itemsFoodM)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_itemFoodChoiceM, 1];
            };
        } else {
            if (count GVAR(itemsFood) > 0) then {
                _itemFoodChoice = [GVAR(itemsFood)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_itemFoodChoice, 1];
            };
        };
    };
    case 3: {
        if (_isMilitary) then {
            if (count GVAR(itemsMedicalM) > 0) then {
                _itemMedicalChoiceM = [GVAR(itemsMedicalM)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_itemMedicalChoiceM, 1];
            };
        } else {
            if (count GVAR(itemsMedical) > 0) then {
                _itemMedicalChoice = [GVAR(itemsMedical)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_itemMedicalChoice, 1];
            };
        };
    };
    case 4: {
        if (_isMilitary) then {
            if (count GVAR(uniformsM) > 0) then {
                _clothingChoice = [GVAR(uniformsM)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_clothingChoice, 1];
            };
        } else {
            if (count GVAR(uniforms) > 0) then {
                _clothingChoice = [GVAR(uniforms)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_clothingChoice, 1];
            };
        };

        if (GVAR(uniformItemChance) > random 100) then {
            _itemAddProbabilityUniform = 0.5;
            _uniformItems = [];
            if (_isMilitary) then {
                {
                    if (count _x > 0) then {
                        _uniformItems pushBack ([_x] call FUNC(blacklistFilter));
                    };
                } forEach [GVAR(itemsMiscM), GVAR(itemsFoodM), GVAR(itemsMedicalM)];
            } else {
                {
                    if (count _x > 0) then {
                        _uniformItems pushBack ([_x] call FUNC(blacklistFilter));
                    };
                } forEach [GVAR(itemsMisc), GVAR(itemsFood), GVAR(itemsMedical)];
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
            if (count GVAR(vestsM) > 0) then {
                _vestChoice = [GVAR(vestsM)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_vestChoice, 1];
            };
        } else {
            if (count GVAR(vests) > 0) then {
                _vestChoice = [GVAR(vests)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_vestChoice, 1];
            };
        };

        if (GVAR(vestsItemChance) > random 100) then {
            _itemAddProbabilityVest = 0.5;
            _vestItems = [];
            if (_isMilitary) then {
                {
                    if (count _x > 0) then {
                        _vestItems pushBack ([_x] call FUNC(blacklistFilter));
                    };
                } forEach [GVAR(itemsMiscM), GVAR(itemsFoodM), GVAR(itemsMedicalM)];
            } else {
                {
                    if (count _x > 0) then {
                        _vestItems pushBack ([_x] call FUNC(blacklistFilter));
                    };
                } forEach [GVAR(itemsMisc), GVAR(itemsFood), GVAR(itemsMedical)];
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
            if (count GVAR(packsM) > 0) then {
                _backpackChoice = [GVAR(packsM)] call FUNC(blacklistFilter);
                _holder addBackpackCargoGlobal [_backpackChoice, 1];
            };
        } else {
            if (count GVAR(packs) > 0) then {
                _backpackChoice = [GVAR(packs)] call FUNC(blacklistFilter);
                _holder addBackpackCargoGlobal [_backpackChoice, 1];
            };
        };
        if (GVAR(backpacksItemChance) > random 100) then {
            _itemAddProbabilityPack = 0.5;
            _backpackItems = [];
            if (_isMilitary) then {
                {
                    if (count _x > 0) then {
                        _backpackItems pushBack ([_x] call FUNC(blacklistFilter));
                    };
                } forEach [GVAR(itemsMiscM), GVAR(itemsFoodM), GVAR(itemsMedicalM)];
            } else {
                {
                    if (count _x > 0) then {
                        _backpackItems pushBack ([_x] call FUNC(blacklistFilter));
                    };
                } forEach [GVAR(itemsMisc), GVAR(itemsFood), GVAR(itemsMedical)];
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
            if (count GVAR(headgearM) > 0) then {
                _headgearChoice = [GVAR(headgearM)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_headgearChoice, 1];
            };
        } else {
            if (count GVAR(headgear) > 0) then {
                _headgearChoice = [GVAR(headgear)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_headgearChoice, 1];
            };
        };
    };
    case 8: {
        if (_isMilitary) then {
            if (count GVAR(gogglesM) > 0) then {
                _facewearChoice = [GVAR(gogglesM)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_facewearChoice, 1];
            };
        } else {
            if (count GVAR(goggles) > 0) then {
                _facewearChoice = [GVAR(goggles)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_facewearChoice, 1];
            };
        };
    };
    case 9: {
            if (count GVAR(grenades) > 0) then {
                _grenadeChoice = [GVAR(grenades)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_grenadeChoice, 1];
        };
    };
    case 10: {
            if (count GVAR(explosives) > 0) then {
                _explosiveChoice = [GVAR(explosives)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_explosiveChoice, 1];
        };
    };
    case 11: {
            if (count GVAR(special) > 0) then {
                _specialChoice = [GVAR(special)] call FUNC(blacklistFilter);
                _holder addItemCargoGlobal [_specialChoice, 1];
        };
    };
};
