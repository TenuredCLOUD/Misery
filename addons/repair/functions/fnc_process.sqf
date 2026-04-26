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
    if ((_x select 0) isEqualTo typeOf _nearestVehicle) then {
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

private _hitData = getAllHitPointsDamage _nearestVehicle;
if (_hitData isEqualTo [] || {(_hitData select 2) findIf {_x > 0} isEqualTo -1}) exitWith {
    ctrlSetText [1001, format ["%1 is already fully repaired...", _displayName]];
    [982386, [1600, 1601], true] call EFUNC(common,displayShowControls);
    player setVariable [QCLASS(processRepairs), nil];
    _dialog displayRemoveEventHandler ["KeyDown", _repairsInterrupt];
};

private _totalSteps = 100;
private _repairStep = 0.05;
private _fundsPerTick = _repairPrice / _totalSteps;

[{
    params ["_args", "_handle"];
    _args params ["_nearestVehicle", "_dialog", "_displayName", "_repairsInterrupt", "_repairStep", "_fundsPerTick"];

    call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

    if (!alive _nearestVehicle || !(player getVariable [QCLASS(processRepairs), false])) exitWith {
        player setVariable [QCLASS(processRepairs), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _repairsInterrupt];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (_funds < _fundsPerTick) exitWith {
        player setVariable [QCLASS(processRepairs), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _repairsInterrupt];
        ctrlSetText [1001, "You cannot afford this!"];
        [982386, [1600, 1601], true] call EFUNC(common,displayShowControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _hitPoints = getAllHitPointsDamage _nearestVehicle;
    private _names = _hitPoints select 0;
    private _damages = _hitPoints select 2;

    private _targetIndex = _damages findIf { _x > 0 };

    if (_targetIndex isEqualTo -1) exitWith {
        player setVariable [QCLASS(processRepairs), nil];
        _dialog displayRemoveEventHandler ["KeyDown", _repairsInterrupt];
        ctrlSetText [1001, format ["%1 has been fully repaired...", _displayName]];
        [982386, [1600, 1601], true] call EFUNC(common,displayShowControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _partName = _names select _targetIndex;
    private _partDamage = _damages select _targetIndex;
    private _newDamage = (_partDamage - _repairStep) max 0;

    [_nearestVehicle, [_partName, _newDamage]] remoteExecCall ["setHitPointDamage", _nearestVehicle];

    [-_fundsPerTick] call EFUNC(currency,modifyMoney);

    private _displayedText = format [
        "Repairing %2...%1Fixing: %3%1Funds: %4 %5",
        endl,
        _displayName,
        _partName,
        EGVAR(currency,symbol),
        [_funds, 1, 2, true] call CBA_fnc_formatNumber
    ];
    ctrlSetText [1001, _displayedText];

}, 0.2, [
_nearestVehicle, _dialog, _displayName, _repairsInterrupt, _repairStep, _fundsPerTick
]] call CBA_fnc_addPerFrameHandler;
