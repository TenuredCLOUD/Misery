#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Search object action with CBA progress bar
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Object data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_loot_fnc_searchObject;
 *
*/

params ["_object", "_objectData"];

if (isNull _object) exitWith {};

private _searchTime = _objectData select 1;
private _searchChance = _objectData select 2;
private _requiredTools = _objectData select 3;
private _audio = _objectData select 4;
private _weapons = _objectData select 5;
private _magazines = _objectData select 6;
private _items = _objectData select 7;
private _backpacks = _objectData select 8;

private _pos = getPosWorld _object;
if (GVAR(searchedPositions) findIf {_x distance _pos < 0.4} isNotEqualTo -1) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(AlreadySearched)] call CBA_fnc_localEvent;
};

private _canSearch = true;
if (_requiredTools isNotEqualTo []) then {
    if !([_requiredTools] call EFUNC(common,hasItem)) exitWith {
        _canSearch = false;
    };
};

if (!_canSearch) exitWith {
    private _toolNames = [];
    {
        ([_x] call EFUNC(common,getItemData)) params ["_displayName"];
        _toolNames pushBack _displayName;
    } forEach _requiredTools;

    private _listString = _toolNames joinString "+ ";
    [QEGVAR(common,tileText), format [localize LSTRING(ToolRequired), _listString]] call CBA_fnc_localEvent;
};

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (getPosWorld player);
_soundDummy attachTo [player, [0, 0, 0], "Pelvis"];

if (_audio isNotEqualTo "") then {
    _soundDummy say3D [_audio, 50];
};

[
    localize LSTRING(ProgressSearching),
    _searchTime,
    {true},
    {
        params ["_args"];
        _args params ["_object", "_objectData", "_soundDummy"];
        private _searchChance = _objectData select 2;
        private _weapons = _objectData select 5;
        private _magazines = _objectData select 6;
        private _items = _objectData select 7;
        private _backpacks = _objectData select 8;

        if (_soundDummy isNotEqualTo objNull) then {
            deleteVehicle _soundDummy;
        };

        [_object] call FUNC(cacheSearched);

        if ([_searchChance] call EFUNC(common,rollChance)) exitWith {
            [QEGVAR(common,tileText), localize LSTRING(NothingFound)] call CBA_fnc_localEvent;
        };

        private _weaponCargo = [];
        private _magazineCargo = [];
        private _itemCargo = [];
        private _backpackCargo = [];

        {
            _x params ["_classname", "_amount", "_chance"];
            if ([_chance] call EFUNC(common,rollChance)) then {
                _weaponCargo pushBack [_classname, _amount];
            };
        } forEach _weapons;

        {
            _x params ["_classname", "_amount", "_chance"];
            if ([_chance] call EFUNC(common,rollChance)) then {
                _magazineCargo pushBack [_classname, _amount];
            };
        } forEach _magazines;

        {
            _x params ["_classname", "_amount", "_chance"];
            if ([_chance] call EFUNC(common,rollChance)) then {
                _itemCargo pushBack [_classname, _amount];
            };
        } forEach _items;

        {
            _x params ["_classname", "_amount", "_chance"];
            if ([_chance] call EFUNC(common,rollChance)) then {
                _backpackCargo pushBack [_classname, _amount];
            };
        } forEach _backpacks;

        if (_weaponCargo isNotEqualTo [] || _magazineCargo isNotEqualTo [] || _itemCargo isNotEqualTo [] || _backpackCargo isNotEqualTo []) then {
            private _holder = [getPosATL player, _weaponCargo, _magazineCargo, _itemCargo, _backpackCargo] call EFUNC(common,spawnLoot);
            [QEGVAR(common,tileText), localize LSTRING(ItemsFound)] call CBA_fnc_localEvent;
        } else {
            [QEGVAR(common,tileText), localize LSTRING(NothingFound)] call CBA_fnc_localEvent;
        };
    },
    {
        params ["_args"];
        _args params ["_object", "_objectData", "_soundDummy"];
        private _searchChance = _objectData select 2;
        private _weapons = _objectData select 5;
        private _magazines = _objectData select 6;
        private _items = _objectData select 7;
        private _backpacks = _objectData select 8;

        [QEGVAR(common,tileText), localize LSTRING(SearchCancelled)] call CBA_fnc_localEvent;

        if (_soundDummy isNotEqualTo objNull) then {
            deleteVehicle _soundDummy;
        };
    },
    [_object, _objectData, _soundDummy]
] call CBA_fnc_progressBar;
