/*
Misery Crafting Framework List populater for Recipes 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

waitUntil {!isNull findDisplay 982376};

if (!isNull findDisplay 982376) exitWith { //Double make sure script exits after loot lists are populated 

 private _list = findDisplay 982376 displayCtrl 1500;  
 private _playerRecipes = player getVariable "Misery_Crafting_DataSet"; 

{ 
    private _outputItem = _x select 0; 
    private _requirements = _x select 1;
    private _displayName = getText (configFile >> "CfgWeapons" >> _outputItem >> "displayName");  
    if (_displayName == "") then {
        _displayName = getText (configFile >> "CfgMagazines" >> _outputItem >> "displayName");  
    };
    if (MiseryDebug) then {
        systemChat format ["Output item: %1", _displayName];  // Debugging hint 
    };
    private _index = _list lbAdd _displayName; 
    _list lbSetData [_index, _outputItem];  // Associate data with the item
} forEach _playerRecipes; 
};

