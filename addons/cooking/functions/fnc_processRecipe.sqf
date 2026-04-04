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

if (isNil "_recipe") exitWith { ctrlSetText [1001, localize ECSTRING(common,NoRecipeMatch)]; };

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
    ctrlSetText [1001, format [localize LSTRING(LowXP), _requiredXP, _playerXP]];
};

if (!([_requiredItems] call FUNC(canCookCheck))) exitWith {
    ctrlSetText [1001, localize ECSTRING(common,MissingItems)];
};

private _progressBar = _dialog displayCtrl 1010;

[982379, [1600, 1601, 1602], false] call EFUNC(common,displayShowControls);
[982379, [1010], true] call EFUNC(common,displayShowControls);

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
        [982379, [1010], false] call EFUNC(common,displayShowControls);
        [QEGVAR(common,tileText), localize LSTRING(Interrupted)] call CBA_fnc_localEvent;
    };
}];

private _totalSteps = _cookingTime * 2;
private _stepTime = _cookingTime / _totalSteps;
private _currentStep = 0;

[{
    params ["_args", "_handle"];
    _args params ["_requiredItems", "_outputItem", "_outputCount", "_toBeReplaced", "_outputXP", "_cookingMethod", "_dialog", "_cookInterrupt", "_totalSteps", "_currentStep", "_displayName", "_progressBar", "_soundSource"];

    if (!(player getVariable [QGVAR(isCooking), false]) || !alive player) exitWith {
        player setVariable [QGVAR(isCooking), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _cookInterrupt];
        [982379, [1600, 1601, 1602], true] call EFUNC(common,displayShowControls);
        [982379, [1010], false] call EFUNC(common,displayShowControls);
        if (_soundSource isNotEqualTo objNull) then {
            deleteVehicle _soundSource;
        };
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _currentStep = _currentStep + 1;
    _args set [9, _currentStep];

    private _progress = (_currentStep / _totalSteps);
    _progressBar progressSetPosition _progress;
    ctrlSetText [1001, format [localize LSTRING(Progress), _cookingMethod, _displayName, (_progress * 100) toFixed 0, "%"]];

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
        [QEGVAR(common,tileText), format [localize LSTRING(GainXP), _outputXP, toLower _cookingMethod, _displayName]] call CBA_fnc_localEvent;

        ctrlSetText [1001, format [localize LSTRING(Success), toLower _cookingMethod, _outputCount, _displayName]];
        player setVariable [QGVAR(isCooking), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _cookInterrupt];
        [982379, [1600, 1601, 1602], true] call EFUNC(common,displayShowControls);
        [982379, [1010], false] call EFUNC(common,displayShowControls);
        if (_soundSource isNotEqualTo objNull) then {
            deleteVehicle _soundSource;
        };

        // Refresh cooking list
        [] call FUNC(recipesListed);

        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [
    _requiredItems, _outputItem, _outputCount, _toBeReplaced, _outputXP, _cookingMethod,
    _dialog, _cookInterrupt,
    _totalSteps, _currentStep, _displayName, _progressBar, _soundSource
]] call CBA_fnc_addPerFrameHandler;
