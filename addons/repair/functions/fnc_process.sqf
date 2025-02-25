#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Mechanic Repairing Shop UI processor
 * Processes repairing with "progress bar"
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_repair_fnc_process;
 *
 * Public: No
*/

private _playerCash = player getVariable [QEGVAR(currency,funds), MACRO_PLAYER_DEFAULTS_LOW];
private _dialog = findDisplay 982386;
private _purchaseButton = _dialog displayCtrl 1600;
private _exitButton = _dialog displayCtrl 1601;
private _vehicleName = getText (configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType) >> "displayName");
private _target = EGVAR(common,targetVehicle);
private _repairPrice = 0;
private _found = false;

{
    if ((_x select 0) isEqualTo EGVAR(common,targetVehicleType)) then {
        _found = true;
        _repairPrice = _x select 3;
    };
} forEach EGVAR(common,vehicleData);

if (!_found) exitWith {};

player setVariable [QCLASS(processRepairs), true];

private _repairsInterrupt = _dialog displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(processRepairs), false];
        [parseText "<t font='PuristaMedium' size='1'>Repairs interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
    };
}];

if (_playerCash < _repairPrice) exitWith {
    ctrlSetText [1001, "You cannot afford this!"];
    _purchaseButton ctrlShow true;
    _exitButton ctrlShow true;
    player setVariable [QCLASS(processRepairs), nil];
    _dialog displayRemoveEventHandler ["KeyDown", _repairsInterrupt];
};

if (damage _target <= 0) exitWith {
    private _displayFull = format ["%1 is already fully repaired...", _vehicleName];
    ctrlSetText [1001, _displayFull];
    _purchaseButton ctrlShow true;
    _exitButton ctrlShow true;
    player setVariable [QCLASS(processRepairs), nil];
    _dialog displayRemoveEventHandler ["KeyDown", _repairsInterrupt];
};

private _totalSteps = 100;
private _repairStep = 1 / _totalSteps;
private _fundsToDeduct = _repairPrice;

[{
    params ["_args", "_handle"];
    _args params ["_target", "_dialog", "_purchaseButton", "_exitButton", "_vehicleName", "_repairsInterrupt", "_playerCash", "_repairStep", "_fundsToDeduct"];

    private _currentFunds = player getVariable [QEGVAR(currency,funds), MACRO_PLAYER_DEFAULTS_LOW];

    if (!alive _target || !(player getVariable [QCLASS(processRepairs), false])) exitWith {
        player setVariable [QCLASS(processRepairs), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _repairsInterrupt];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (_playerCash < _fundsToDeduct) exitWith {
        player setVariable [QCLASS(processRepairs), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _repairsInterrupt];
        ctrlSetText [1001, "You cannot afford this!"];
        _purchaseButton ctrlShow true;
        _exitButton ctrlShow true;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _currentDamage = damage _target;
    private _repairAmount = _repairStep min _currentDamage;

    _target setDamage (_currentDamage - _repairAmount);

    private _displayedText = format [
        "Repairing...%1%2%1Repair progress: %3%4 Funds:%1%5%1%6",
        endl,
        _vehicleName,
        (1 - (_currentDamage - _repairAmount)) * 100 toFixed 2,
        "%",
        EGVAR(currency,symbol),
        [_currentFunds, 1, 2, true] call CBA_fnc_formatNumber
    ];
    ctrlSetText [1001, _displayedText];

    player setVariable [QEGVAR(currency,funds), _currentFunds - _fundsToDeduct];

    if (damage _target <= 0) exitWith {
        player setVariable [QCLASS(processRepairs), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _repairsInterrupt];
        private _displayFull = format ["%1 has been fully repaired...", _vehicleName];
        ctrlSetText [1001, _displayFull];
        _purchaseButton ctrlShow true;
        _exitButton ctrlShow true;
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [
    _target, _dialog, _purchaseButton, _exitButton, _vehicleName, _repairsInterrupt, _playerCash, _repairStep, _fundsToDeduct
]] call CBA_fnc_addPerFrameHandler;
