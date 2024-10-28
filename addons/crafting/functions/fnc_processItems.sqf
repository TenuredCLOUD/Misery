#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Crafting Framework Item processor
 * Takes inputs from GUI and process recipe (if it exists)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: BOOL
 *
 * Example:
 * [] call misery_crafting_fnc_processItems
 *
 * Public: No
*/

private _dialog = findDisplay 982376;
private _selectedOutputItem = lbData[1500, (lbCurSel 1500)];
private _matchedRecipe = [];
private _playerRecipes = player getVariable "Misery_Crafting_DataSet";

private _CraftB = _dialog displayCtrl 1600;
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
     if (MiseryDebug) then {
    systemChat format ["Requirements: %1, Type: %2", _requirements, typeName _requirements]; //debug output
    };
    private _craftingTime = -1;
    private _requiredItemsCounts = [];
    private _toBeReplaced = [];
    private _audio = "";
    private _outputCount = 1;

    {
        if (_x select 0 == "CraftingTime") then {
            _craftingTime = _x select 1;
        } else {
            if (_x select 0 == "ToBeReplaced") then {
                _toBeReplaced = _x;
            } else {
                if (_x select 0 == "Audio") then {
                    _audio = _x select 1;
                } else {
                    if (_x select 0 == "OutputCount") then {
                    _outputCount = _x select 1;
                } else {
                    _requiredItemsCounts pushBack _x;
                };
            };
        };
    };
    } forEach _requirements;

    if ([_requirements] call FUNC(canCraftCheck)) then {

        _CraftB ctrlShow false;
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

        player setVariable ["Misery_ISCrafting", true];

        _CraftInterrupt = (findDisplay 982376) displayAddEventHandler ["KeyDown", {
            params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
            if (_key isEqualTo DIK_ESCAPE) then {
                player setVariable ["Misery_ISCrafting",false];
                if (player getVariable ["_TC_sound", false]) then {
                    player setVariable ["_TC_sound", false,true];
                };
                [parseText "<t font='PuristaMedium' size='1'>Crafting interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
            };
        }];

        if (!isNil "_audio" && _audio != "") then {
        private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
        player setVariable ["_TC_sound", true,true];
        [_soundDummy, [_audio, 50]] remoteExec ["say3D", 0, _soundDummy];
        [{
        !(player getVariable ["_TC_sound", false])
        },{
        deleteVehicle _this;
        }, _soundDummy] call CBA_fnc_waitUntilAndExecute;
        };

        private _text = "Crafting...";
        private _displayedText = "";
        private _delay = _craftingTime / count _text;

        for "_i" from 0 to (count _text - 1) do {
            if ((player getVariable "Misery_ISCrafting") isEqualTo false) exitWith {};
            _displayedText = _displayedText + (_text select [_i, 1]);
            ctrlSetText [1001, _displayedText];
            sleep _delay;
        };

        if ((player getVariable "Misery_ISCrafting") isEqualTo true) then {
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

        for "_i" from 1 to _outputCount do {
        [player, _outputItem, true] call CBA_fnc_addItem;
        };

            if (!isNil "_toBeReplaced" && {count _toBeReplaced > 0}) then {
            private _itemToReplace = _toBeReplaced select 1;
            private _chance = _toBeReplaced select 2;
            private _replacementItem = _toBeReplaced select 3;
            if (random 1 < _chance) then {
             if (_itemToReplace in items player) then {
                player removeItem _itemToReplace;
            };
            if (_itemToReplace in magazines player) then {
                player removeMagazine _itemToReplace;
            };
            [player, _replacementItem, true] call CBA_fnc_addItem;
                };
            };

            _SuccessText = format ["You successfully crafted: %1...", _itemDisplayName];
            ctrlSetText [1001, _SuccessText];

            if (player getVariable ["_TC_sound", false]) then {
                player setVariable ["_TC_sound", false,true];
            };

        _CraftB ctrlShow true;
        _RecipeB ctrlShow true;
        _ExitB ctrlShow true;

            player setVariable ["Misery_ISCrafting", nil]; //terminate crafting flag
            (findDisplay 982376) displayRemoveEventHandler ["KeyDown", _CraftInterrupt]; //Remove Display EH
        };

    } else {
        ctrlSetText [1001, "You do not have all the required items for this recipe."];
        _CraftB ctrlShow true;
        _RecipeB ctrlShow true;
        _ExitB ctrlShow true;
    };
} else {
    ctrlSetText [1001, "No matching recipe found."];
};



