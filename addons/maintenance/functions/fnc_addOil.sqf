#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Process adding oil to vehicles
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_addOil
 *
*/

[player] call EFUNC(common,nearVehicle) params ["_nearVehicle", "_vehicle"];

if (isNull _vehicle) exitWith {
    ctrlSetText [1001, format ["Invalid vehicle..."]];
};

private _currentOilLevel = _vehicle getVariable [QGVAR(oilLevel), 0];

private _found = false;
private _totalLiters = 0;

{
    if ((_x select 0) isEqualTo typeOf _vehicle) then {
        _array = _x;
        _found = true;
        _totalLiters = _x select 8;
    };
} forEach EGVAR(common,vehicleData);

if !(_found) exitWith {};

player setVariable [QCLASS(processOil), true];

// Initial button disabler
[274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);

_oilInterrupt = (findDisplay 274839) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(processOil),false];
        [QEGVAR(common,tileText), format ["Adding oil interrupted..."]] call CBA_fnc_localEvent;
    };
}];

private _hasOil = [[QCLASS(engineOil)]] call EFUNC(common,hasItem);

if (_currentOilLevel >= 1) exitWith {
    player setVariable [QCLASS(processOil), nil];
    (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _oilInterrupt];
    _vehicle setVariable [QGVAR(oilLevel), 1, true];
    ctrlSetText [1001, format ["%1 oil is full...", [_vehicle] call EFUNC(common,getObjectData) select 0]];
    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
};

if (!_hasOil) exitWith {
    (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _oilInterrupt];
    ctrlSetText [1001, format ["You need engine oil to refill %1...", [_vehicle] call EFUNC(common,getObjectData) select 0]];
    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
};

private _text = "Adding oil...";
private _oilLvl = "Oil level:";
private _displayedText = "";

[{
    params ["_args", "_handle"];
    _args params ["_vehicle", "_oilInterrupt", "_totalLiters", "_text", "_oilLvl", "_displayedText"];

    private _oilToAdd = 1 / _totalLiters;
    private _currentOilLevel = _vehicle getVariable [QGVAR(oilLevel), 0];

    if ((player getVariable QCLASS(processOil)) isEqualTo false) exitWith {
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _oilInterrupt];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (_currentOilLevel >= 1) exitWith {
        player setVariable [QCLASS(processOil), nil];
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _oilInterrupt];
        _vehicle setVariable [QGVAR(oilLevel), 1, true];
        ctrlSetText [1001, format ["%1 oil is full...", [_vehicle] call EFUNC(common,getObjectData) select 0]];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _hasOil = [[QCLASS(engineOil)]] call EFUNC(common,hasItem);

    if (!_hasOil) exitWith {
        player setVariable [QCLASS(processOil), nil];
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _oilInterrupt];
        ctrlSetText [1001, format ["You have run out of %1...", "Engine oil"]];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    ctrlSetText [1001, format ["%1%2%3%2%4%2%5", _text, endl, [_vehicle] call EFUNC(common,getObjectData) select 0, _oilLvl, (_currentOilLevel) * 100]];

    _vehicle setVariable [QGVAR(oilLevel), _currentOilLevel + _oilToAdd, true];

    [QCLASS(engineOil), QCLASS(oilEmpty)] call EFUNC(common,itemDecrement);
}, 0.5, [_vehicle, _oilInterrupt, _totalLiters, _text, _oilLvl, _displayedText]] call CBA_fnc_addPerFrameHandler;
