#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Cooking Framework Item Processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_cooking_fnc_processRecipe
 *
 * Public: No
*/

private _dialog = findDisplay 982379;
private _selectedOutputItem = lbData [1500, (lbCurSel 1500)];
private _recipe = GVAR(cookingRecipes) select {(_x select 0) isEqualTo _selectedOutputItem} select 0;

if (isNil "_recipe") exitWith { ctrlSetText [1001, "No matching recipe found."]; };

private _outputItem = _recipe select 0;
private _requiredItems = _recipe select 1;
private _cookingTime = _recipe select 2;
private _outputCount = _recipe select 3;
private _toBeReplaced = _recipe select 4;
private _audio = _recipe select 5;
private _outputXP = _recipe select 6;
private _requiredXP = _recipe select 7;
private _cookingMethod = _recipe select 8;

[_outputItem] call EFUNC(common,getItemData) params ["_displayName"];

private _playerXP = player getVariable [QGVAR(xp), MACRO_PLAYER_DEFAULTS_LOW];
if (_playerXP < _requiredXP) exitWith {
    ctrlSetText [1001, format ["You need %1 cooking XP to make this (you have %2).", _requiredXP, _playerXP]];
};

if (!([_requiredItems] call FUNC(canCookCheck))) exitWith {
    ctrlSetText [1001, "You don’t have the required items..."];
};

private _cookButton = _dialog displayCtrl 1600;
private _recipeButton = _dialog displayCtrl 1601;
private _exitButton = _dialog displayCtrl 1602;
private _progressBar = _dialog displayCtrl 1010;
_cookButton ctrlShow false;
_recipeButton ctrlShow false;
_exitButton ctrlShow false;
_progressBar ctrlShow true;

player playAction "Gear";

private _soundSource = objNull;
if (_audio isNotEqualTo "") then {
    _soundSource = createVehicle ["Land_HelipadEmpty_F", getPosASL player, [], 0, "CAN_COLLIDE"];
    _soundSource setPosASL (getPosASL player);
    _soundSource attachTo [player, [0, 0, 0]];
    _soundSource say3D [_audio, 50, 1];
};

player setVariable [QGVAR(isCooking), true];

private _cookInterrupt = _dialog displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QGVAR(isCooking), false];
        _progressBar ctrlShow false;
        if (_soundSource isNotEqualTo objNull) then {
            deleteVehicle _soundSource;
        };
        [parseText "<t font='PuristaMedium' size='1'>Cooking interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
    };
}];

private _totalSteps = _cookingTime * 2;
private _stepTime = _cookingTime / _totalSteps;
private _currentStep = 0;

[{
    params ["_args", "_handle"];
    _args params ["_requiredItems", "_outputItem", "_outputCount", "_toBeReplaced", "_outputXP", "_cookingMethod", "_dialog", "_cookButton", "_recipeButton", "_exitButton", "_cookInterrupt", "_totalSteps", "_currentStep", "_displayName", "_progressBar", "_soundSource"];

    if (!(player getVariable [QGVAR(isCooking), false]) || !alive player) exitWith {
        player setVariable [QGVAR(isCooking), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _cookInterrupt];
        _cookButton ctrlShow true;
        _recipeButton ctrlShow true;
        _exitButton ctrlShow true;
        _progressBar ctrlShow false;
        if (_soundSource isNotEqualTo objNull) then {
            deleteVehicle _soundSource;
        };
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _currentStep = _currentStep + 1;
    _args set [12, _currentStep];

    private _progress = (_currentStep / _totalSteps);
    _progressBar progressSetPosition _progress;
    ctrlSetText [1001, format ["%1ing %2... %3%4 complete", _cookingMethod, _displayName, (_progress * 100) toFixed 0, "%"]];

    if (_currentStep >= _totalSteps) exitWith {
        {
            private _item = _x select 0;
            private _count = _x select 1;
            private _removeAfterUse = _x select 2;
            if (_removeAfterUse) then {
                for "_j" from 1 to _count do {
                    [player, _item] call CBA_fnc_removeItem;
                };
            };
        } forEach _requiredItems;

        for "_i" from 1 to _outputCount do {
            [player, _outputItem, true] call CBA_fnc_addItem;
        };

        if (count _toBeReplaced > 0) then {
            private _itemToReplace = _toBeReplaced select 0;
            private _chance = _toBeReplaced select 1;
            private _replacementItem = _toBeReplaced select 2;
            if ([_chance] call EFUNC(common,rollChance)) then {
                [player, _itemToReplace] call CBA_fnc_removeItem;
                [player, _replacementItem, true] call CBA_fnc_addItem;
            };
        };

        private _currentXP = player getVariable [QGVAR(xp), MACRO_PLAYER_DEFAULTS_LOW];
        player setVariable [QGVAR(xp), _currentXP + _outputXP, true];
        [parseText format ["<t font='PuristaMedium' size='1'>You gained %1 XP from %2ing %3.</t>", _outputXP, toLower _cookingMethod, _displayName], true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;

        ctrlSetText [1001, format ["You %1ed %2 %3!", toLower _cookingMethod, _outputCount, _displayName]];
        player setVariable [QGVAR(isCooking), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _cookInterrupt];
        _cookButton ctrlShow true;
        _recipeButton ctrlShow true;
        _exitButton ctrlShow true;
        _progressBar ctrlShow false;
        if (_soundSource isNotEqualTo objNull) then {
            deleteVehicle _soundSource;
        };

        // Refresh cooking list
        [] call FUNC(recipesListed);

        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [
    _requiredItems, _outputItem, _outputCount, _toBeReplaced, _outputXP, _cookingMethod,
    _dialog, _cookButton, _recipeButton, _exitButton, _cookInterrupt,
    _totalSteps, _currentStep, _displayName, _progressBar, _soundSource
]] call CBA_fnc_addPerFrameHandler;
