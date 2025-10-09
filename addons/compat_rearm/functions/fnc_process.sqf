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

private _dialog = findDisplay 982383;
private _resupplyPrice = 0;
private _found = false;

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

[player] call EFUNC(common,nearVehicle) params ["", "_nearestVehicle"];

if (_nearestVehicle isEqualTo []) exitWith {};

[_nearestVehicle] call EFUNC(common,getObjectData) params ["_displayName"];

{
    if ((_x select 0) isEqualTo _nearestVehicle) then {
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

if (_funds < _resupplyPrice) exitWith {
    ctrlSetText [1001, "You cannot afford this!"];
    [982383, [1600, 1601], true] call EFUNC(common,displayShowControls);
    player setVariable [QCLASS(processRearm), nil];
    _dialog displayRemoveEventHandler ["KeyDown", _rearmInterrupt];
};

private _fundsToDeductPerStep = _resupplyPrice;
private _totalFundsDeducted = 0;

private _dummyVehicle = "Land_HelipadEmpty_F" createVehicle [0,0,0];
_dummyVehicle enableSimulation false;

[{
    params ["_args", "_handle"];
    _args params ["_nearestVehicle", "_dialog", "_displayName", "_rearmInterrupt", "_fundsToDeductPerStep", "_step", "_totalFundsDeducted", "_dummyVehicle"];

    private _totalSteps = 100;
    private _progress = (_step + 1) / _totalSteps;
    private _progressPercent = (_progress * 100) toFixed 2;

    call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

    if (!alive _nearestVehicle || !(player getVariable [QCLASS(processRearm), false])) exitWith {
        [_totalFundsDeducted] call EFUNC(currency,modifyMoney);
        player setVariable [QCLASS(processRearm), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _rearmInterrupt];
        deleteVehicle _dummyVehicle;
        ctrlSetText [1001, "Resupply interrupted..."];
        [982383, [1600, 1601], true] call EFUNC(common,displayShowControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (_funds < _fundsToDeductPerStep) exitWith {
        [_totalFundsDeducted] call EFUNC(currency,modifyMoney);
        player setVariable [QCLASS(processRearm), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _rearmInterrupt];
        ctrlSetText [1001, "You cannot afford this!"];
        [982383, [1600, 1601], true] call EFUNC(common,displayShowControls);
        deleteVehicle _dummyVehicle;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    [-_fundsToDeductPerStep] call EFUNC(currency,modifyMoney);
    _totalFundsDeducted = _totalFundsDeducted + _fundsToDeductPerStep;

    private _progress = (_step + 1) / _totalSteps;
    private _progressPercent = (_progress * 100) toFixed 2;
    private _displayedText = format [
        "Resupplying...%1%2%1Progress: %3%%%1Funds:%1%4%1%5",
        endl,
        _displayName,
        _progressPercent,
        EGVAR(currency,symbol),
        [_funds, 1, 2, true] call CBA_fnc_formatNumber
    ];
    ctrlSetText [1001, _displayedText];

    if (_step >= _totalSteps - 1) exitWith {
        [_dummyVehicle, _nearestVehicle] call ace_rearm_fnc_rearmEntireVehicleSuccess;
        player setVariable [QCLASS(processRearm), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _rearmInterrupt];
        private _displayFull = format ["%1 has been fully resupplied...", _displayName];
        ctrlSetText [1001, _displayFull];
        [982383, [1600, 1601], true] call EFUNC(common,displayShowControls);
        deleteVehicle _dummyVehicle;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    _args set [7, _step + 1];
    _args set [8, _totalFundsDeducted];
}, 0.5, [
    _nearestVehicle, _dialog, _displayName, _rearmInterrupt, _fundsToDeductPerStep, 0, _totalFundsDeducted, _dummyVehicle
]] call CBA_fnc_addPerFrameHandler;
