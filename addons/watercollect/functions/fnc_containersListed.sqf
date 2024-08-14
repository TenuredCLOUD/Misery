#include "..\script_component.hpp"
/*
Misery WaterCollection List populater for containers
Designed specifically for Misery mod
by TenuredCLOUD
*/

waitUntil {!isNull findDisplay 982380};

if (!isNull findDisplay 982380) exitWith {
    private _list = findDisplay 982380 displayCtrl 1500;
    private _playerRecipes = player getVariable "Misery_WaterCollect_DataSet";

    {
        private _requiredItem = _x select 0;
        private _outputItem = _x select 1;
        private _fillingTime = _x select 2;
        private _displayName = getText (configFile >> "CfgWeapons" >> _requiredItem >> "displayName");
        if (_displayName == "") then {
            _displayName = getText (configFile >> "CfgMagazines" >> _requiredItem >> "displayName");
        };
        if (MiseryDebug) then {
            systemChat format ["Filling %1 requires: %2 and takes %3 seconds", _requiredItem, _requiredItem, _fillingTime];
        };
        private _index = _list lbAdd _displayName;
        _list lbSetData [_index, _requiredItem];  // Associate data with the item
    } forEach _playerRecipes;
};


