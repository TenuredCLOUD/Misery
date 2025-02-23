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

private _playerCash = player getVariable [QEGVAR(currency,funds), MACRO_PLAYER_DEFAULTS_LOW];
private _dialog = findDisplay 982384;
private _purchaseButton = _dialog displayCtrl 1600;
private _exitButton = _dialog displayCtrl 1601;
private _vehicleName = getText (configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType) >> "displayName");
private _target = EGVAR(common,targetVehicle);
private _fuelCost = 0;
private _totalLiters = 0;
private _found = false;

{
    if ((_x select 0) isEqualTo EGVAR(common,targetVehicleType)) then {
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

if (_playerCash < _fuelCost) exitWith {
    ctrlSetText [1001, "You cannot afford this!"];
    _purchaseButton ctrlShow true;
    _exitButton ctrlShow true;
    player setVariable [QCLASS(processRefuel), nil];
    _dialog displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
};

if (fuel _target >= 1) exitWith {
    private _displayFull = format ["%1 fuel tank is full...", _vehicleName];
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
    _args params ["_target", "_dialog", "_purchaseButton", "_exitButton", "_vehicleName", "_refuelInterrupt", "_playerCash", "_totalLiters", "_fundsToDeduct", "_fuelStep"];

    private _currentFunds = player getVariable [QEGVAR(currency,funds), MACRO_PLAYER_DEFAULTS_LOW];

    if (!alive _target || !(player getVariable [QCLASS(processRefuel), false])) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (_playerCash < _fundsToDeduct) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
        ctrlSetText [1001, "You cannot afford this!"];
        _purchaseButton ctrlShow true;
        _exitButton ctrlShow true;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _currentFuel = fuel _target;
    private _fuelToAdd = _fuelStep min (1 - _currentFuel);

    _target setFuel (_currentFuel + _fuelToAdd);

    private _displayedText = format [
        "Refueling...%1%2%1Tank level: %3%4%1 Funds:%1%5%1%6",
        endl,
        _vehicleName,
        (_currentFuel + _fuelToAdd) * 100 toFixed 2,
        "%",
        EGVAR(currency,symbol),
        player getVariable [QEGVAR(currency,funds), MACRO_PLAYER_DEFAULTS_LOW]
    ];
    ctrlSetText [1001, _displayedText];

    player setVariable [QEGVAR(currency,funds), _currentFunds - _fundsToDeduct];

    if (_currentFuel + _fuelToAdd >= 1) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
        private _displayFull = format ["%1 fuel tank is full...", _vehicleName];
        ctrlSetText [1001, _displayFull];
        _purchaseButton ctrlShow true;
        _exitButton ctrlShow true;
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [
_target, _dialog, _purchaseButton, _exitButton, _vehicleName, _refuelInterrupt, _playerCash, _totalLiters, _fundsToDeduct, _fuelStep
]] call CBA_fnc_addPerFrameHandler;
