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

private _dialog = findDisplay 982386;
private _repairPrice = 0;
private _found = false;

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

[player] call EFUNC(common,nearVehicle) params ["", "_nearestVehicle"];

if (_nearestVehicle isEqualTo []) exitWith {};

[_nearestVehicle] call EFUNC(common,getObjectData) params ["_displayName"];

{
    if ((_x select 0) isEqualTo _nearestVehicle) then {
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

if (_funds < _repairPrice) exitWith {
    ctrlSetText [1001, "You cannot afford this!"];
    [982386, [1600, 1601], true] call EFUNC(common,displayShowControls);
    player setVariable [QCLASS(processRepairs), nil];
    _dialog displayRemoveEventHandler ["KeyDown", _repairsInterrupt];
};

if (damage _nearestVehicle <= 0) exitWith {
    private _displayFull = format ["%1 is already fully repaired...", _displayName];
    ctrlSetText [1001, _displayFull];
    [982386, [1600, 1601], true] call EFUNC(common,displayShowControls);
    player setVariable [QCLASS(processRepairs), nil];
    _dialog displayRemoveEventHandler ["KeyDown", _repairsInterrupt];
};

private _totalSteps = 100;
private _repairStep = 1 / _totalSteps;
private _fundsToDeduct = _repairPrice;

[{
    params ["_args", "_handle"];
    _args params ["_nearestVehicle", "_dialog", "_displayName", "_repairsInterrupt", "_playerCash", "_repairStep", "_fundsToDeduct"];

    call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

    if (!alive _nearestVehicle || !(player getVariable [QCLASS(processRepairs), false])) exitWith {
        player setVariable [QCLASS(processRepairs), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _repairsInterrupt];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (_funds < _fundsToDeduct) exitWith {
        player setVariable [QCLASS(processRepairs), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _repairsInterrupt];
        ctrlSetText [1001, "You cannot afford this!"];
        [982386, [1600, 1601], true] call EFUNC(common,displayShowControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _currentDamage = damage _nearestVehicle;
    private _repairAmount = _repairStep min _currentDamage;

    _nearestVehicle setDamage (_currentDamage - _repairAmount);

    private _displayedText = format [
        "Repairing...%1%2%1Repair progress: %3%4 Funds:%1%5%1%6",
        endl,
        _displayName,
        (1 - (_currentDamage - _repairAmount)) * 100 toFixed 2,
        "%",
        EGVAR(currency,symbol),
        [_funds, 1, 2, true] call CBA_fnc_formatNumber
    ];
    ctrlSetText [1001, _displayedText];

    [-_fundsToDeduct] call EFUNC(currency,modifyMoney);

    if (damage _nearestVehicle <= 0) exitWith {
        player setVariable [QCLASS(processRepairs), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _repairsInterrupt];
        private _displayFull = format ["%1 has been fully repaired...", _displayName];
        ctrlSetText [1001, _displayFull];
        [982386, [1600, 1601], true] call EFUNC(common,displayShowControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [
    _nearestVehicle, _dialog, _displayName, _repairsInterrupt, _playerCash, _repairStep, _fundsToDeduct
]] call CBA_fnc_addPerFrameHandler;
