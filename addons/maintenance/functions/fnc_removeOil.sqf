#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Process removing oil to vehicles
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_removeOil
 *
*/

[player] call EFUNC(common,nearVehicle) params ["_nearVehicle", "_vehicle"];

if (isNull _vehicle) exitWith {
    private _invalid = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "Invalid vehicle..."];
    [QEGVAR(common,tileText), _invalid] call CBA_fnc_localEvent;
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
        private _oilInterrupted = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "Adding oil interrupted..."];
        [QEGVAR(common,tileText), _oilInterrupted] call CBA_fnc_localEvent;
    };
}];

private _hasOil = [[QCLASS(engineOil), QCLASS(oilEmpty)]] call EFUNC(common,hasItem);

if (_currentOilLevel <= 0) exitWith {
    player setVariable [QCLASS(processOil), nil];
    (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _oilInterrupt];
    _vehicle setVariable [QGVAR(oilLevel), 0, true];
    _displayFull = format ["%1 oil is empty...", [_vehicle] call EFUNC(common,getObjectData) select 0];
    ctrlSetText [1001, _displayFull];
    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
};

if (!_hasOil) exitWith {
    (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _oilInterrupt];
    ctrlSetText [1001, format ["You need %1 or %2 to start draining oil from %3...", [QCLASS(engineOil)] call EFUNC(common,getItemData) select 0, [QCLASS(oilEmpty)] call EFUNC(common,getItemData) select 0, [_vehicle] call EFUNC(common,getObjectData) select 0]];
    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
};

private _text = "Removing oil...";
private _oilLvl = "Oil level:";
private _displayedText = "";

[{
    params ["_args", "_handle"];
    _args params ["_vehicle", "_oilInterrupt", "_totalLiters", "_text", "_oilLvl", "_displayedText"];

    private _oilToRemove = 1 / _totalLiters;
    private _currentOilLevel = _vehicle getVariable [QGVAR(oilLevel), 0];

    if ((player getVariable QCLASS(processOil)) isEqualTo false) exitWith {
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _oilInterrupt];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (_currentOilLevel <= 0) exitWith {
        player setVariable [QCLASS(processOil), nil];
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _oilInterrupt];
        _vehicle setVariable [QGVAR(oilLevel), 0, true];
        _displayFull = format ["%1 oil is empty...", [_vehicle] call EFUNC(common,getObjectData) select 0];
        ctrlSetText [1001, _displayFull];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    _displayedText = format ["%1%2%3%2%4%2%5", _text, endl, [_vehicle] call EFUNC(common,getObjectData) select 0, _oilLvl, (_currentOilLevel) * 100];
    ctrlSetText [1001, _displayedText];

    _vehicle setVariable [QGVAR(oilLevel), _currentOilLevel - _oilToRemove, true];

    // Remove empty oil can and replace with magazine variant
    if ([[QCLASS(oilEmpty)]] call EFUNC(common,hasItem)) then {
        player removeItem QCLASS(oilEmpty);
        [player, QCLASS(engineOil), 1, true] call CBA_fnc_addMagazine;
    };

    // Increment the count of the oil can
    [QCLASS(engineOil)] call EFUNC(common,itemIncrement) params ["_incremented"];

    if !(_incremented) exitWith {
        ctrlSetText [1001, format ["%1 is full or no longer available...", [QCLASS(engineOil)] call EFUNC(common,getItemData) select 0]];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [_vehicle, _oilInterrupt, _totalLiters, _text, _oilLvl, _displayedText]] call CBA_fnc_addPerFrameHandler;
