/*
Misery Cooking Framework List populater for Recipes 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

waitUntil {!isNull findDisplay 982379};

if (!isNull findDisplay 982379) exitWith { //Double make sure script exits after loot lists are populated 
 
 private _list = findDisplay 982379 displayCtrl 1500; 
 private _playerRecipes = player getVariable "Misery_Cooking_DataSet"; 

{ 
    private _outputItem = _x select 0; 
    private _requirements = _x select 1;
    private _displayName = getText (configFile >> "CfgWeapons" >> _outputItem >> "displayName");  
    if (_displayName == "") then {
        _displayName = getText (configFile >> "CfgMagazines" >> _outputItem >> "displayName");  
    };
    if (MiseryDebug) then {
        systemChat format ["Output item: %1", _displayName];   
    };
    private _index = _list lbAdd _displayName; 
    _list lbSetData [_index, _outputItem]; 
} forEach _playerRecipes; 
};
