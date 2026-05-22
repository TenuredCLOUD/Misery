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
    ctrlSetText [1001, format [localize LSTRING(InvalidVehicle)]];
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
[274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);

_refuelInterrupt = (findDisplay 274839) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(processRefuel),false];
        [QEGVAR(common,tileText), localize LSTRING(RefuelingInterrupted)] call CBA_fnc_localEvent;
    };
}];

// Determine the required fuel type and Jerry can type based on the fuelTypeIndex
private _requiredFuelType = switch (_fuelTypeIndex) do {
    case 0: {[QCLASS(diesel), localize LSTRING(FuelDiesel)]};
    case 1: {[QCLASS(petrol), localize LSTRING(FuelPetrol)]};
    case 2: {[QCLASS(jetFuel), localize LSTRING(FuelJetFuel)]};
};

private _hasRequiredFuel = [[(_requiredFuelType) select 0]] call EFUNC(common,hasItem);

if (fuel _vehicle >= 1) exitWith {
    player setVariable [QCLASS(processRefuel), nil];
    (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
    _vehicle setFuel 1;
    ctrlSetText [1001, format [localize LSTRING(FuelTankFull), [_vehicle] call EFUNC(common,getObjectData) select 0]];
    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
};

if (!_hasRequiredFuel) exitWith {
    (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
    ctrlSetText [1001, format [localize LSTRING(RequiresFuelType), [_vehicle] call EFUNC(common,getObjectData) select 0, (_requiredFuelType) select 1]];
    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
};

private _text = localize LSTRING(RefuelingProgress);
private _tanklvl = localize LSTRING(TankLevelLabel);
private _displayedText = "";

[{
    params ["_args", "_handle"];
    _args params ["_vehicle", "_refuelInterrupt", "_totalLiters", "_fuelTypeIndex", "_hasRequiredFuel", "_requiredFuelType", "_text", "_tanklvl", "_displayedText"];

    private _fuelToAdd = 1 / _totalLiters;

    if ((player getVariable QCLASS(processRefuel)) isEqualTo false) exitWith {
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (fuel _vehicle >= 1) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
        _vehicle setFuel 1;
        ctrlSetText [1001, format [localize LSTRING(FuelTankFull), [_vehicle] call EFUNC(common,getObjectData) select 0]];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _hasRequiredFuel = [[(_requiredFuelType) select 0]] call EFUNC(common,hasItem);

    if (!_hasRequiredFuel) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        (findDisplay 274839) displayRemoveEventHandler ["KeyDown", _refuelInterrupt];
        ctrlSetText [1001, format [localize LSTRING(OutOfFuel), (_requiredFuelType) select 1]];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    ctrlSetText [1001, format ["%1%2%3%2%4%2%5", _text, endl, [_vehicle] call EFUNC(common,getObjectData) select 0, _tanklvl, (fuel _vehicle) * 100]];

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





