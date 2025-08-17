#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Process refueling vehicle with fuel can
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_refuel
 *
*/

[player] call EFUNC(common,nearVehicle) params ["_nearVehicle", "_vehicle"];

if (isNull _vehicle) exitWith {
    private _invalid = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "Invalid vehicle..."];
    [QEGVAR(common,tileText), _invalid] call CBA_fnc_localEvent;
};

private _found = false;
private _totalLiters = 0;
private _fuelTypeIndex = 0;

{
    if ((_x select 0) isEqualTo typeOf _vehicle) then {
        _array = _x;
        _found = true;
        _fuelTypeIndex = _x select 1;
        _totalLiters = _x select 2;
    };
} forEach EGVAR(common,vehicleData);

if !(_found) exitWith {};

player setVariable [QCLASS(processRefuel), true];

// Initial button disabler
[274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], false] call EFUNC(common,displayEnableControls);

_refuelInterrupt = (findDisplay 274839) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(processRefuel),false];
        private _refuelInterrupted = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "Refueling interrupted..."];
        [QEGVAR(common,tileText), _refuelInterrupted] call CBA_fnc_localEvent;
    };
}];

// Determine the required fuel type and Jerry can type based on the fuelTypeIndex
private _requiredFuelType = switch (_fuelTypeIndex) do {
    case 0: {[QCLASS(diesel), "Diesel"]};
    case 1: {[QCLASS(petrol), "Petrol"]};
    case 2: {[QCLASS(jetFuel), "JetFuel"]};
};

private _hasRequiredFuel = [[(_requiredFuelType) select 0]] call EFUNC(common,hasItem);

if (fuel _vehicle >= 1) exitWith {
    player setVariable [QCLASS(processRefuel), nil];
    (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
    _displayFull = format ["%1 fuel tank is full...", [_vehicle] call EFUNC(common,getObjectData) select 0];
    ctrlSetText [1001, _displayFull];
    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], true] call EFUNC(common,displayEnableControls);
};

if (!_hasRequiredFuel) exitWith {
    (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
    ctrlSetText [1001, format ["%1 requires %2...", [_vehicle] call EFUNC(common,getObjectData) select 0, (_requiredFuelType) select 1]];
    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], true] call EFUNC(common,displayEnableControls);
};

private _text = "Refueling...";
private _tanklvl = "Tank level:";
private _displayedText = "";

[{
    params ["_args", "_handle"];
    _args params ["_vehicle", "_refuelInterrupt", "_totalLiters", "_fuelTypeIndex", "_hasRequiredFuel", "_requiredFuelType", "_text", "_tanklvl", "_displayedText"];

    private _fuelToAdd = 1 / _totalLiters;

    if ((player getVariable QCLASS(processRefuel)) isEqualTo false) exitWith {
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (fuel _vehicle >= 1) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
        _displayFull = format ["%1 fuel tank is full...", [_vehicle] call EFUNC(common,getObjectData) select 0];
        ctrlSetText [1001, _displayFull];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _hasRequiredFuel = [[(_requiredFuelType) select 0]] call EFUNC(common,hasItem);

    if (!_hasRequiredFuel) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
        ctrlSetText [1001, format ["You have run out of %1...", (_requiredFuelType) select 1]];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    _displayedText = format ["%1%2%3%2%4%2%5", _text, endl, [_vehicle] call EFUNC(common,getObjectData) select 0, _tanklvl, (fuel _vehicle) * 100];
    ctrlSetText [1001, _displayedText];

    _vehicle setFuel ((fuel _vehicle) + _fuelToAdd);

    // Decrement the count of the used Jerry can type
    switch (_fuelTypeIndex) do {
        case 0: {
            [QCLASS(diesel), QCLASS(dieselEmpty)] call EFUNC(common,itemDecrement);
        };
        case 1: {
            [QCLASS(petrol), QCLASS(petrolEmpty)] call EFUNC(common,itemDecrement);
        };
        case 2: {
            [QCLASS(jetFuel), QCLASS(jetFuelEmpty)] call EFUNC(common,itemDecrement);
        };
    };
}, 0.5, [_vehicle, _refuelInterrupt, _totalLiters, _fuelTypeIndex, _hasRequiredFuel, _requiredFuelType, _text, _tanklvl, _displayedText]] call CBA_fnc_addPerFrameHandler;





