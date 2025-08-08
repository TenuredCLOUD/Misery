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

params ["_spawnPosition", "_isMilitary", "_isMedical", "_isStore", "_isGarage"];

private ["_lootType", "_markerID", "_debugMarker", "_weaponCargo", "_magazineCargo", "_itemCargo", "_backpackCargo"];

_weaponCargo = [];
_magazineCargo = [];
_itemCargo = [];
_backpackCargo = [];

/*
 * Adjust loot type probabilities based on building type
 * 0 - Weapons
 * 1 - Items (Misc)
 * 2 - Items (Food)
 * 3 - Items (Medical)
 * 4 - Clothing
 * 5 - Vests
 * 6 - Backpacks
 * 7 - Headwear
 * 8 - Facewear
 * 9 - Grenades
 * 10 - Explosives
 * 11 - Specials (NVG, Map, Radio)
 */

switch (true) do {
    case _isMilitary: {
        _lootType = selectRandom [0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 10, 11];
    };
    case _isMedical: {
        _lootType = 3;
    };
    case _isStore: {
        _lootType = selectRandom [1, 2, 4, 5, 6, 7, 8];
    };
    case _isGarage: {
        _lootType = 1;
    };
    default {
        _lootType = selectRandom [0, 1, 2, 3, 4, 5, 6, 7, 8];
    };
};

if (EGVAR(common,debugMode) > 0) then {
    _markerID = format ["%1", _spawnPosition];
    _debugMarker = createMarkerLocal [_markerID, _spawnPosition];
    _debugMarker setMarkerShapeLocal "ICON";
    _debugMarker setMarkerTypeLocal "hd_dot";
    _debugMarker setMarkerColorLocal "ColorRed";
    _debugMarker setMarkerText format ["%1", _lootType];
};

switch (_lootType) do {
    case 0: {
        private _weaponChoice = if (_isMilitary && {count GVAR(weaponsM) > 0}) then {
            [GVAR(weaponsM)] call FUNC(blacklistFilter)
        } else {
            if (count GVAR(weapons) > 0) then { [GVAR(weapons)] call FUNC(blacklistFilter) } else { "" }
        };
        if (_weaponChoice != "") then {
            _weaponCargo pushBack [_weaponChoice, 1];
            private _compatibleMags = [_weaponChoice] call CBA_fnc_compatibleMagazines;
            if (count _compatibleMags > 0) then {
                private _magCount = if (_isMilitary) then { round (random 5) } else { round (random 3) };
                for "_i" from 1 to _magCount do {
                    _magazineCargo pushBack [selectRandom _compatibleMags, 1];
                };
            };
            if (_isMilitary) then {
                private _compatibleAttachments = [_weaponChoice] call CBA_fnc_compatibleItems;
                if (count _compatibleAttachments > 0) then {
                    for "_j" from 1 to round (random 2) do {
                        _itemCargo pushBack [selectRandom _compatibleAttachments, 1];
                    };
                };
            };
        };
    };
    case 1: {
        private _itemChoice = if (_isMilitary && {count GVAR(itemsMiscM) > 0}) then {
            [GVAR(itemsMiscM)] call FUNC(blacklistFilter)
        } else {
            if (count GVAR(itemsMisc) > 0) then { [GVAR(itemsMisc)] call FUNC(blacklistFilter) } else { "" }
        };
        if (_itemChoice != "") then {
            _itemCargo pushBack [_itemChoice, 1];
        };
    };
    case 2: {
        private _itemFoodChoice = if (_isMilitary && {count GVAR(itemsFoodM) > 0}) then {
            [GVAR(itemsFoodM)] call FUNC(blacklistFilter)
        } else {
            if (count GVAR(itemsFood) > 0) then { [GVAR(itemsFood)] call FUNC(blacklistFilter) } else { "" }
        };
        if (_itemFoodChoice != "") then {
            _itemCargo pushBack [_itemFoodChoice, 1];
        };
    };
    case 3: {
        private _itemMedicalChoice = if (_isMilitary && {count GVAR(itemsMedicalM) > 0}) then {
            [GVAR(itemsMedicalM)] call FUNC(blacklistFilter)
        } else {
            if (count GVAR(itemsMedical) > 0) then { [GVAR(itemsMedical)] call FUNC(blacklistFilter) } else { "" }
        };
        if (_itemMedicalChoice != "") then {
            _itemCargo pushBack [_itemMedicalChoice, 1];
        };
    };
    case 4: {
        private _clothingChoice = if (_isMilitary && {count GVAR(uniformsM) > 0}) then {
            [GVAR(uniformsM)] call FUNC(blacklistFilter)
        } else {
            if (count GVAR(uniforms) > 0) then { [GVAR(uniforms)] call FUNC(blacklistFilter) } else { "" }
        };
        if (_clothingChoice != "") then {
            _itemCargo pushBack [_clothingChoice, 1];
            if (GVAR(uniformItemChance) > random 100) then {
                private _itemAddProbabilityUniform = 0.5;
                private _uniformItems = [];
                if (_isMilitary) then {
                    {
                        if (count _x > 0) then {
                            private _item = [_x] call FUNC(blacklistFilter);
                            if (_item != "") then { _uniformItems pushBack _item };
                        };
                    } forEach [GVAR(itemsMiscM), GVAR(itemsFoodM), GVAR(itemsMedicalM)];
                } else {
                    {
                        if (count _x > 0) then {
                            private _item = [_x] call FUNC(blacklistFilter);
                            if (_item != "") then { _uniformItems pushBack _item };
                        };
                    } forEach [GVAR(itemsMisc), GVAR(itemsFood), GVAR(itemsMedical)];
                };
                {
                    if (random 1 < _itemAddProbabilityUniform) then {
                        _itemCargo pushBack [_x, 1];
                    };
                } forEach _uniformItems;
            };
        };
    };
    case 5: {
        private _vestChoice = if (_isMilitary && {count GVAR(vestsM) > 0}) then {
            [GVAR(vestsM)] call FUNC(blacklistFilter)
        } else {
            if (count GVAR(vests) > 0) then { [GVAR(vests)] call FUNC(blacklistFilter) } else { "" }
        };
        if (_vestChoice != "") then {
            _itemCargo pushBack [_vestChoice, 1];
            if (GVAR(vestsItemChance) > random 100) then {
                private _itemAddProbabilityVest = 0.5;
                private _vestItems = [];
                if (_isMilitary) then {
                    {
                        if (count _x > 0) then {
                            private _item = [_x] call FUNC(blacklistFilter);
                            if (_item != "") then { _vestItems pushBack _item };
                        };
                    } forEach [GVAR(itemsMiscM), GVAR(itemsFoodM), GVAR(itemsMedicalM)];
                } else {
                    {
                        if (count _x > 0) then {
                            private _item = [_x] call FUNC(blacklistFilter);
                            if (_item != "") then { _vestItems pushBack _item };
                        };
                    } forEach [GVAR(itemsMisc), GVAR(itemsFood), GVAR(itemsMedical)];
                };
                {
                    if (random 1 < _itemAddProbabilityVest) then {
                        _itemCargo pushBack [_x, 1];
                    };
                } forEach _vestItems;
            };
        };
    };
    case 6: {
        private _backpackChoice = if (_isMilitary && {count GVAR(packsM) > 0}) then {
            [GVAR(packsM)] call FUNC(blacklistFilter)
        } else {
            if (count GVAR(packs) > 0) then { [GVAR(packs)] call FUNC(blacklistFilter) } else { "" }
        };
        if (_backpackChoice != "") then {
            _backpackCargo pushBack [_backpackChoice, 1];
            if (GVAR(backpacksItemChance) > random 100) then {
                private _itemAddProbabilityPack = 0.5;
                private _backpackItems = [];
                if (_isMilitary) then {
                    {
                        if (count _x > 0) then {
                            private _item = [_x] call FUNC(blacklistFilter);
                            if (_item != "") then { _backpackItems pushBack _item };
                        };
                    } forEach [GVAR(itemsMiscM), GVAR(itemsFoodM), GVAR(itemsMedicalM)];
                } else {
                    {
                        if (count _x > 0) then {
                            private _item = [_x] call FUNC(blacklistFilter);
                            if (_item != "") then { _backpackItems pushBack _item };
                        };
                    } forEach [GVAR(itemsMisc), GVAR(itemsFood), GVAR(itemsMedical)];
                };
                {
                    if (random 1 < _itemAddProbabilityPack) then {
                        _itemCargo pushBack [_x, 1];
                    };
                } forEach _backpackItems;
            };
        };
    };
    case 7: {
        private _headgearChoice = if (_isMilitary && {count GVAR(headgearM) > 0}) then {
            [GVAR(headgearM)] call FUNC(blacklistFilter)
        } else {
            if (count GVAR(headgear) > 0) then { [GVAR(headgear)] call FUNC(blacklistFilter) } else { "" }
        };
        if (_headgearChoice != "") then {
            _itemCargo pushBack [_headgearChoice, 1];
        };
    };
    case 8: {
        private _facewearChoice = if (_isMilitary && {count GVAR(gogglesM) > 0}) then {
            [GVAR(gogglesM)] call FUNC(blacklistFilter)
        } else {
            if (count GVAR(goggles) > 0) then { [GVAR(goggles)] call FUNC(blacklistFilter) } else { "" }
        };
        if (_facewearChoice != "") then {
            _itemCargo pushBack [_facewearChoice, 1];
        };
    };
    case 9: {
        if (count GVAR(grenades) > 0) then {
            private _grenadeChoice = [GVAR(grenades)] call FUNC(blacklistFilter);
            if (_grenadeChoice != "") then {
                _itemCargo pushBack [_grenadeChoice, 1];
            };
        };
    };
    case 10: {
        if (count GVAR(explosives) > 0) then {
            private _explosiveChoice = [GVAR(explosives)] call FUNC(blacklistFilter);
            if (_explosiveChoice != "") then {
                _itemCargo pushBack [_explosiveChoice, 1];
            };
        };
    };
    case 11: {
        if (count GVAR(special) > 0) then {
            private _specialChoice = [GVAR(special)] call FUNC(blacklistFilter);
            if (_specialChoice != "") then {
                _itemCargo pushBack [_specialChoice, 1];
            };
        };
    };
};

[_spawnPosition, _weaponCargo, _magazineCargo, _itemCargo, _backpackCargo] call EFUNC(common,spawnLoot);
