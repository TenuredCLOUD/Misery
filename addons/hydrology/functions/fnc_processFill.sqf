#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Hydrology Fill Processor
 * Fills selected container from GUI using PFH for scheduled execution
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_hydrology_fnc_processFill;
 *
 * Public: No
*/

private _dialog = findDisplay 982380;
private _selectedItem = lbData [1500, (lbCurSel 1500)];
private _recipe = GVAR(containers) select {(_x select 0) isEqualTo _selectedItem} select 0;

private _fillButton = _dialog displayCtrl 1600;
private _drinkButton = _dialog displayCtrl 1601;
private _exitButton = _dialog displayCtrl 1602;
private _progressBar = _dialog displayCtrl 1010;

if (isNil "_recipe") exitWith { ctrlSetText [1001, "No matching container found."]; };

private _requiredItem = _recipe select 0;
private _outputItem = _recipe select 1;
private _fillingTime = _recipe select 2;

if !([[_requiredItem]] call EFUNC(common,hasItem)) exitWith {
    ctrlSetText [1001, "You don’t have that container..."];
};

_fillButton ctrlShow false;
_drinkButton ctrlShow false;
_exitButton ctrlShow false;
_progressBar ctrlShow true;

player playAction "Gear";

[_outputItem] call EFUNC(common,getItemData) params ["_displayName"];

player setVariable [QCLASS(isFilling), true];

private _fillInterrupt = _dialog displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(isFilling), false];
        _progressBar ctrlShow false;
        [parseText "<t font='PuristaMedium' size='1'>Filling interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
    };
}];

private _totalSteps = _fillingTime * 2;
private _currentStep = 0;

[{
    params ["_args", "_handle"];
    _args params [
        "_requiredItem",
        "_outputItem",
        "_dialog",
        "_fillButton",
        "_drinkButton",
        "_exitButton",
        "_fillInterrupt",
        "_totalSteps",
        "_currentStep",
        "_displayName",
        "_progressBar"
    ];

    if (!(player getVariable [QCLASS(isFilling), false]) || !alive player) exitWith {
        player setVariable [QCLASS(isFilling), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _fillInterrupt];
        _fillButton ctrlShow true;
        _drinkButton ctrlShow true;
        _exitButton ctrlShow true;
        _progressBar ctrlShow false;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _currentStep = _currentStep + 1;
    _args set [8, _currentStep];

    private _progress = (_currentStep / _totalSteps);
    _progressBar progressSetPosition _progress;
    ctrlSetText [1001, format ["Filling Container... %1%2 complete", (_progress * 100) toFixed 0, "%"]];

    if (_currentStep >= _totalSteps) then {

        [player, _requiredItem] call CBA_fnc_removeItem;

        [player, _outputItem, true] call CBA_fnc_addItem;

        ctrlSetText [1001, format ["You filled: %1...", _displayName]];
        player setVariable [QCLASS(isFilling), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _fillInterrupt];
        _fillButton ctrlShow true;
        _drinkButton ctrlShow true;
        _exitButton ctrlShow true;
        _progressBar ctrlShow false;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [
    _requiredItem,
    _outputItem,
    _dialog,
    _fillButton,
    _drinkButton,
    _exitButton,
    _fillInterrupt,
    _totalSteps,
    _currentStep,
    _displayName,
    _progressBar
]] call CBA_fnc_addPerFrameHandler;
