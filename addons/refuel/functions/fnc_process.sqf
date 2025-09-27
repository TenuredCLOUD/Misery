#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Refuel Processing
 * Processes refueling as well as prompts and progress bar
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_refuel_fnc_refuelZoneStart;
 *
 * Public: No
*/

private _dialog = findDisplay 982384;
private _purchaseButton = _dialog displayCtrl 1600;
private _exitButton = _dialog displayCtrl 1601;
private _fuelCost = 0;
private _totalLiters = 0;
private _found = false;

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

[player] call EFUNC(common,nearVehicle) params ["", "_nearestVehicle"];

if (_nearestVehicle isEqualTo []) exitWith {};

[_nearestVehicle] call EFUNC(common,getObjectData) params ["_displayName"];

{
    if ((_x select 0) isEqualTo _nearestVehicle) then {
        _found = true;
        private _fuelTypeIndex = _x select 1;
        _fuelCost = GVAR(fuelCosts) select _fuelTypeIndex;
        _totalLiters = _x select 2;
    };
} forEach EGVAR(common,vehicleData);

if (!_found) exitWith {};

player setVariable [QCLASS(processRefuel), true];

private _refuelInterrupt = _dialog displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(processRefuel), false];
        [parseText "<t font='PuristaMedium' size='1'>Refueling interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
    };
}];

if (_funds < _fuelCost) exitWith {
    ctrlSetText [1001, "You cannot afford this!"];
    _purchaseButton ctrlShow true;
    _exitButton ctrlShow true;
    player setVariable [QCLASS(processRefuel), nil];
    _dialog displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
};

if (fuel _nearestVehicle >= 1) exitWith {
    private _displayFull = format ["%1 fuel tank is full...", _displayName];
    ctrlSetText [1001, _displayFull];
    _purchaseButton ctrlShow true;
    _exitButton ctrlShow true;
    player setVariable [QCLASS(processRefuel), nil];
    _dialog displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
};

private _totalSteps = 100;
private _fuelStep = 1 / _totalSteps;
private _fundsToDeduct = _fuelCost;

[{
    params ["_args", "_handle"];
    _args params ["_nearestVehicle", "_dialog", "_purchaseButton", "_exitButton", "_displayName", "_refuelInterrupt", "_totalLiters", "_fundsToDeduct", "_fuelStep"];

    call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

    if (!alive _nearestVehicle || !(player getVariable [QCLASS(processRefuel), false])) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (_funds < _fundsToDeduct) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
        ctrlSetText [1001, "You cannot afford this!"];
        _purchaseButton ctrlShow true;
        _exitButton ctrlShow true;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _currentFuel = fuel _nearestVehicle;
    private _fuelToAdd = _fuelStep min (1 - _currentFuel);

    _nearestVehicle setFuel (_currentFuel + _fuelToAdd);

    private _displayedText = format [
        "Refueling...%1%2%1Tank level: %3%4%1 Funds:%1%5%1%6",
        endl,
        _displayName,
        (_currentFuel + _fuelToAdd) * 100 toFixed 2,
        "%",
        EGVAR(currency,symbol),
        [_funds, 1, 2, true] call CBA_fnc_formatNumber
    ];
    ctrlSetText [1001, _displayedText];

    [-_fundsToDeduct] call EFUNC(currency,modifyMoney);

    if (_currentFuel + _fuelToAdd >= 1) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
        private _displayFull = format ["%1 fuel tank is full...", _displayName];
        ctrlSetText [1001, _displayFull];
        _purchaseButton ctrlShow true;
        _exitButton ctrlShow true;
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [
_nearestVehicle, _dialog, _purchaseButton, _exitButton, _displayName, _refuelInterrupt, _totalLiters, _fundsToDeduct, _fuelStep
]] call CBA_fnc_addPerFrameHandler;
