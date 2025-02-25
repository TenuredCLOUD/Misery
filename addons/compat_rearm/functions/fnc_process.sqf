#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Rearming
 * Runs rearm process, prompts loading bar, etc...
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_rearm_fnc_start;
 *
 * Public: No
*/

private _playerCash = player getVariable [QEGVAR(currency,funds), MACRO_PLAYER_DEFAULTS_LOW];
private _dialog = findDisplay 982383;
private _purchaseButton = _dialog displayCtrl 1600;
private _exitButton = _dialog displayCtrl 1601;
private _vehicleName = getText (configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType) >> "displayName");
private _target = EGVAR(common,targetVehicle);
private _resupplyPrice = 0;
private _found = false;

{
    if ((_x select 0) isEqualTo EGVAR(common,targetVehicleType)) then {
        _found = true;
        _resupplyPrice = _x select 4;
    };
} forEach EGVAR(common,vehicleData);

if (!_found) exitWith {};

player setVariable [QCLASS(processRearm), true];

private _rearmInterrupt = _dialog displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(processRearm), false];
        [parseText "<t font='PuristaMedium' size='1'>Resupply interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
    };
}];

if (_playerCash < _resupplyPrice) exitWith {
    ctrlSetText [1001, "You cannot afford this!"];
    _purchaseButton ctrlShow true;
    _exitButton ctrlShow true;
    player setVariable [QCLASS(processRearm), nil];
    _dialog displayRemoveEventHandler ["KeyDown", _rearmInterrupt];
};

private _fundsToDeductPerStep = _resupplyPrice;
private _totalFundsDeducted = 0;

private _dummyVehicle = "Land_HelipadEmpty_F" createVehicle [0,0,0];
_dummyVehicle enableSimulation false;

[{
    params ["_args", "_handle"];
    _args params ["_target", "_dialog", "_purchaseButton", "_exitButton", "_vehicleName", "_rearmInterrupt", "_fundsToDeductPerStep", "_step", "_totalFundsDeducted", "_dummyVehicle"];

    private _totalSteps = 100;
    private _progress = (_step + 1) / _totalSteps;
    private _progressPercent = (_progress * 100) toFixed 2;
    private _currentFunds = player getVariable [QEGVAR(currency,funds), MACRO_PLAYER_DEFAULTS_LOW];

    if (!alive _target || !(player getVariable [QCLASS(processRearm), false])) exitWith {
        player setVariable [QEGVAR(currency,funds), _currentFunds + _totalFundsDeducted];
        player setVariable [QCLASS(processRearm), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _rearmInterrupt];
        deleteVehicle _dummyVehicle;
        ctrlSetText [1001, "Resupply interrupted..."];
        _purchaseButton ctrlShow true;
        _exitButton ctrlShow true;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (_currentFunds < _fundsToDeductPerStep) exitWith {
        player setVariable [QEGVAR(currency,funds), _currentFunds + _totalFundsDeducted];
        player setVariable [QCLASS(processRearm), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _rearmInterrupt];
        ctrlSetText [1001, "You cannot afford this!"];
        _purchaseButton ctrlShow true;
        _exitButton ctrlShow true;
        deleteVehicle _dummyVehicle;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    player setVariable [QEGVAR(currency,funds), _currentFunds - _fundsToDeductPerStep];
    _totalFundsDeducted = _totalFundsDeducted + _fundsToDeductPerStep;

    private _progress = (_step + 1) / _totalSteps;
    private _progressPercent = (_progress * 100) toFixed 2;
    private _displayedText = format [
        "Resupplying...%1%2%1Progress: %3%%%1Funds:%1%4%1%5",
        endl,
        _vehicleName,
        _progressPercent,
        EGVAR(currency,symbol),
        [_currentFunds, 1, 2, true] call CBA_fnc_formatNumber
    ];
    ctrlSetText [1001, _displayedText];

    if (_step >= _totalSteps - 1) exitWith {
        [_dummyVehicle, _target] call ace_rearm_fnc_rearmEntireVehicleSuccess;
        player setVariable [QCLASS(processRearm), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _rearmInterrupt];
        private _displayFull = format ["%1 has been fully resupplied...", _vehicleName];
        ctrlSetText [1001, _displayFull];
        _purchaseButton ctrlShow true;
        _exitButton ctrlShow true;
        deleteVehicle _dummyVehicle;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    _args set [7, _step + 1];
    _args set [8, _totalFundsDeducted];
}, 0.5, [
    _target, _dialog, _purchaseButton, _exitButton, _vehicleName, _rearmInterrupt, _fundsToDeductPerStep, 0, _totalFundsDeducted, _dummyVehicle
]] call CBA_fnc_addPerFrameHandler;
