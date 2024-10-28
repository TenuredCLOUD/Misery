#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Cooking Framework Item processor
 * Takes inputs from GUI and processes recipe (if it exists)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: BOOL
 *
 * Example:
 * [] call misery_cooking_fnc_processRecipe
 *
 * Public: No
*/

private _dialog = findDisplay 982379;
private _selectedOutputItem = lbData[1500, (lbCurSel 1500)];
private _matchedRecipe = [];
private _playerRecipes = player getVariable "Misery_Cooking_DataSet";

private _CookB = _dialog displayCtrl 1600;
private _RecipeB = _dialog displayCtrl 1601;
private _ExitB = _dialog displayCtrl 1602;

if (MiseryDebug) then {
systemChat format ["Selected output item: %1", _selectedOutputItem]; //debug output
systemChat format ["Player's recipes: %1", _playerRecipes]; //debug output
};

{
    if (_x select 0 isEqualTo _selectedOutputItem) then {
        _matchedRecipe = _x;
    };
    if (MiseryDebug) then {
    systemChat format ["Output item of current recipe: %1", _x select 0]; //debug output
    };
} forEach _playerRecipes;

if (count _matchedRecipe > 0) then {
    private _outputItem = _matchedRecipe select 0;
    private _requirements = _matchedRecipe select 1;
    private _craftingTime = -1;
    private _cookingMethod = "";
    private _requiredItemsCounts = [];

    {
        if (_x select 0 == "CookingTime") then {
            _craftingTime = _x select 1;
        } else {
            if (_x select 0 == "CookingMethod") then {
                _cookingMethod = _x select 1;
            } else {
                _requiredItemsCounts pushBack _x;
            };
        };
    } forEach _requirements;

    if ([_requirements] call FUNC(canCookCheck)) then {

        _CookB ctrlShow false;
        _RecipeB ctrlShow false;
        _ExitB ctrlShow false;

        if !((currentWeapon player)=="") then {
        player action["SWITCHWEAPON",player,player,-1];
        };

        player playAction "Gear";

        private _itemDisplayName = getText (configFile >> "CfgWeapons" >> _outputItem >> "displayName");
        if (_itemDisplayName == "") then {
            _itemDisplayName = getText (configFile >> "CfgMagazines" >> _outputItem >> "displayName");
        };

        player setVariable ["Misery_ISCooking", true];

    _CraftInterrupt = (findDisplay 982379) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable ["Misery_ISCooking",false];
        player setVariable ["_TC_sound", false,true];
        switch (_cookingMethod) do {
            case "Cook": {
                [parseText "<t font='PuristaMedium' size='1'>Cooking interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
            };
            case "Boil": {
                [parseText "<t font='PuristaMedium' size='1'>Boiling interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
            };
        };
    };
}];

private _text = "";
private _displayedText = "";
private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
player setVariable ["_TC_sound", true,true];

switch (_cookingMethod) do {
    case "Cook": {
        [_soundDummy, ["MeatRoasted", 50]] remoteExec ["say3D", 0, _soundDummy];
        _text = "Cooking...";
    };
    case "Boil": {
        [_soundDummy, ["WaterBoiling", 50]] remoteExec ["say3D", 0, _soundDummy];
        _text = "Boiling...";
    };
};

private _delay = _craftingTime / count _text;

[{
    !(player getVariable ["_TC_sound", false])
},{
    deleteVehicle _this;
}, _soundDummy] call CBA_fnc_waitUntilAndExecute;

for "_i" from 0 to (count _text - 1) do {
    if ((player getVariable "Misery_ISCooking") isEqualTo false) exitWith {};
    _displayedText = _displayedText + (_text select [_i, 1]);
    ctrlSetText [1001, _displayedText];
    sleep _delay;
};

    if ((player getVariable "Misery_ISCooking") isEqualTo true) then {
        {
            private _requiredItem = _x select 0;
            private _requiredCount = _x select 1;
            private _removeAfterUse = if (_x select 2 isEqualType []) then {true} else {_x select 2};

            for "_j" from 1 to _requiredCount do {
                if (_requiredItem in items player && _removeAfterUse) then {
                    player removeItem _requiredItem;
                };
                if (_requiredItem in magazines player && _removeAfterUse) then {
                    player removeMagazine _requiredItem;
                };
            };
        } forEach _requiredItemsCounts;

        [player, _outputItem, true] call CBA_fnc_addItem;

        switch (_cookingMethod) do {
        case "Cook": {
            _SuccessText = format ["You successfully cooked: %1...", _itemDisplayName];
            ctrlSetText [1001, _SuccessText];
            player setVariable ["_TC_sound", false,true];
        };
        case "Boil": {
            _SuccessText = format ["You successfully boiled: %1...", _itemDisplayName];
            ctrlSetText [1001, _SuccessText];
            player setVariable ["_TC_sound", false,true];
        };
    };

    _CookB ctrlShow true;
    _RecipeB ctrlShow true;
    _ExitB ctrlShow true;

            player setVariable ["Misery_ISCooking", nil]; //terminate crafting flag
            (findDisplay 982379) displayRemoveEventHandler ["KeyDown", _CraftInterrupt]; //Remove Display EH
    };

    } else {
        ctrlSetText [1001, "You do not have all the required items for this recipe."];
        _CookB ctrlShow true;
        _RecipeB ctrlShow true;
        _ExitB ctrlShow true;
    };
} else {
    ctrlSetText [1001, "No matching recipe found."];
};
