#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * WaterCollection fill processor
 * Takes inputs from GUI and processes recipe (if it exists)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_watercollect_fnc_processFill;
 *
 * Public: No
*/

private _dialog = findDisplay 982380;
private _selectedOutputItem = lbData[1500, (lbCurSel 1500)];
private _matchedRecipe = [];
private _playerRecipes = player getVariable "Misery_WaterCollect_DataSet";

private _FillB = _dialog displayCtrl 1600;
private _DrinkFSB = _dialog displayCtrl 1601;
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
    systemChat format ["Filled Container Output item of current recipe: %1", _x select 1]; //debug output
    };
} forEach _playerRecipes;

if (count _matchedRecipe > 0) then {
    private _requiredItem = _matchedRecipe select 0;
    private _outputItem = _matchedRecipe select 1;
    private _FillingTime = _matchedRecipe select 2;

    private _playerItems = (items player) + (magazines player);
    private _playerCount = {_x isEqualTo _requiredItem} count _playerItems;
    private _hasAll = _playerCount > 0;

    if (_hasAll) then {

        _FillB ctrlShow false;
        _DrinkFSB ctrlShow false;
        _ExitB ctrlShow false;

        if !((currentWeapon player)=="") then {
        player action["SWITCHWEAPON",player,player,-1];
        };

        player playAction "Gear";

        private _itemDisplayName = getText (configFile >> "CfgWeapons" >> _outputItem >> "displayName");
        if (_itemDisplayName == "") then {
            _itemDisplayName = getText (configFile >> "CfgMagazines" >> _outputItem >> "displayName");
        };

        player setVariable ["Misery_ISFilling", true];

    _FillInterrupt = (findDisplay 982380) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable ["Misery_ISFilling",false];
                [parseText "<t font='PuristaMedium' size='1'>Filling interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
        };
}];

private _text = "Filling Container...";
private _displayedText = "";
private _delay = _FillingTime / count _text;

for "_i" from 0 to (count _text - 1) do {
    if ((player getVariable "Misery_ISFilling") isEqualTo false) exitWith {};
    _displayedText = _displayedText + (_text select [_i, 1]);
    ctrlSetText [1001, _displayedText];
    sleep _delay;
};

    if ((player getVariable "Misery_ISFilling") isEqualTo true) then {

                if (_requiredItem in items player) then {
                    player removeItem _requiredItem;
                };
                if (_requiredItem in magazines player) then {
                    player removeMagazine _requiredItem;
                };

        [player, _outputItem, true] call CBA_fnc_addItem;


    _SuccessText = format ["You successfully Filled: %1...", _itemDisplayName];
    ctrlSetText [1001, _SuccessText];

    _FillB ctrlShow true;
    _DrinkFSB ctrlShow true;
    _ExitB ctrlShow true;

            player setVariable ["Misery_ISFilling", nil]; //terminate crafting flag
            (findDisplay 982380) displayRemoveEventHandler ["KeyDown", _FillInterrupt]; //Remove Display EH
    };

    } else {
        ctrlSetText [1001, "You do not have the required Container..."];
        _FillB ctrlShow true;
        _DrinkFSB ctrlShow true;
        _ExitB ctrlShow true;
    };
} else {
    ctrlSetText [1001, "No matching recipe found."];
};
