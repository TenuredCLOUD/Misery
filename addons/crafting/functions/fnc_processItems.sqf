#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Crafting Framework Item Processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_crafting_fnc_processItems
 *
 * Public: No
*/

private _dialog = findDisplay 982376;
private _selectedOutputItem = lbData [1500, (lbCurSel 1500)];
private _recipe = GVAR(craftingRecipes) select {(_x select 0) isEqualTo _selectedOutputItem} select 0;

if (isNil "_recipe") exitWith { ctrlSetText [1001, "No matching recipe found."]; };

private _outputItem = _recipe select 0;
private _requiredItems = _recipe select 1;
private _craftingTime = _recipe select 2;
private _outputCount = _recipe select 3;
private _toBeReplaced = _recipe select 4;
private _audio = _recipe select 5;
private _outputXP = _recipe select 6;

[_outputItem] call EFUNC(common,getItemData) params ["_displayName"];

if (!([_requiredItems] call FUNC(canCraftCheck))) exitWith {
    ctrlSetText [1001, "You don’t have the required items..."];
};

private _progressBar = _dialog displayCtrl 1010;

[982376, [1600, 1601, 1602], false] call EFUNC(common,displayShowControls);
[982376, [1010], true] call EFUNC(common,displayShowControls);

player playAction "Gear";

private _soundSource = objNull;
if (_audio isNotEqualTo "") then {
    _soundSource = createVehicle ["Land_HelipadEmpty_F", getPosASL player, [], 0, "CAN_COLLIDE"];
    _soundSource setPosASL (getPosASL player);
    _soundSource attachTo [player, [0, 0, 0]];
    _soundSource say3D [_audio, 50, 1];
};

player setVariable [QGVAR(isCrafting), true];

private _craftInterrupt = _dialog displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QGVAR(isCrafting), false];
        [982376, [1010], false] call EFUNC(common,displayShowControls);
        if (_soundSource isNotEqualTo objNull) then {
            deleteVehicle _soundSource;
        };
        [parseText "<t font='PuristaMedium' size='1'>Crafting interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
    };
}];

private _totalSteps = _craftingTime * 2;
private _stepTime = _craftingTime / _totalSteps;
private _currentStep = 0;

[{
    params ["_args", "_handle"];
    _args params ["_requiredItems", "_outputItem", "_outputCount", "_toBeReplaced", "_outputXP", "_dialog", "_craftInterrupt", "_totalSteps", "_currentStep", "_displayName", "_progressBar", "_soundSource"];

    if (!(player getVariable [QGVAR(isCrafting), false]) || !alive player) exitWith {
        player setVariable [QGVAR(isCrafting), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _craftInterrupt];
        [982376, [1600, 1601, 1602], true] call EFUNC(common,displayShowControls);
        [982376, [1010], false] call EFUNC(common,displayShowControls);
        if (_soundSource isNotEqualTo objNull) then {
            deleteVehicle _soundSource;
        };
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _currentStep = _currentStep + 1;
    _args set [11, _currentStep];

    private _progress = (_currentStep / _totalSteps);
    _progressBar progressSetPosition _progress;
    ctrlSetText [1001, format ["Crafting %1... %2%3 complete", _displayName, (_progress * 100) toFixed 0, "%"]];

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
            if (random 1 < _chance) then {
                [player, _itemToReplace] call CBA_fnc_removeItem;
                [player, _replacementItem, true] call CBA_fnc_addItem;
            };
        };

        private _currentXP = player getVariable [QGVAR(xp), MACRO_PLAYER_DEFAULTS_LOW];
        player setVariable [QGVAR(xp), _currentXP + _outputXP, true];
        [parseText format ["<t font='PuristaMedium' size='1'>You gained %1 XP from crafting %2.</t>", _outputXP, _displayName], true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;

        ctrlSetText [1001, format ["You crafted %1 %2!", _outputCount, _displayName]];
        _progressBar progressSetPosition 1;
        player setVariable [QGVAR(isCrafting), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _craftInterrupt];
        [982376, [1600, 1601, 1602], true] call EFUNC(common,displayShowControls);
        [982376, [1010], false] call EFUNC(common,displayShowControls);
        if (_soundSource isNotEqualTo objNull) then {
            deleteVehicle _soundSource;
        };

        // Refresh the crafting list
        [] call FUNC(recipesListed);

        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [
    _requiredItems, _outputItem, _outputCount, _toBeReplaced, _outputXP,
    _dialog, _craftInterrupt, _totalSteps, _currentStep, _displayName, _progressBar, _soundSource
]] call CBA_fnc_addPerFrameHandler;
