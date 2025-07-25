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
 * [] call misery_maintenance_fnc_refillStart
 *
*/

private ["_dialog","_PurchaseB","_ExitB","_Vehiclename","_target","_Found","_totalLiters","_RefuelInterrupt","_text","_displayedText","_delay"];

_dialog = findDisplay 982385;
_PurchaseB = _dialog displayCtrl 1600;
_ExitB = _dialog displayCtrl 1601;

_Vehiclename = getText (configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType) >> "displayName");

_target = EGVAR(common,targetVehicle);

_Found = false;
_totalLiters = 0;
_fuelTypeIndex = 0;

{
    if ((_x select 0) isEqualTo EGVAR(common,targetVehicleType)) then {
        _Array=_x;
        _Found = true;
        _fuelTypeIndex = _x select 1;

        _totalLiters = _x select 2;
    };
} forEach Misery_Veh_Type;

if !(_Found) exitWith {};

player setVariable [QCLASS(processRefuel), true];

_RefuelInterrupt = (findDisplay 982385) displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QCLASS(processRefuel),false];
        [parseText "<t font='PuristaMedium' size='0.7'>Refueling interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
    };
}];

// Get the count of each Jerry can type in the player's inventory
private _dieselCount = 0;
private _petrolCount = 0;
private _jetFuelCount = 0;

{
    private _magazineType = _x select 0;
    private _ammoCount = _x select 1;

    switch (_magazineType) do {
        case QCLASS(diesel): {_dieselCount = _dieselCount + _ammoCount;};
        case QCLASS(petrol): {_petrolCount = _petrolCount + _ammoCount;};
        case QCLASS(jetFuel): {_jetFuelCount = _jetFuelCount + _ammoCount;};
    };
} forEach magazinesAmmo player;

// Determine the required fuel type and Jerry can type based on the fuelTypeIndex
private _requiredFuelType = switch (_fuelTypeIndex) do {
    case 0: {"Diesel"};
    case 1: {"Petrol"};
    case 2: {"JetFuel"};
};

// Check if the player has the required Jerry can type with at least 1 use
private _hasRequiredFuel = switch (_requiredFuelType) do {
    case "Diesel": {_dieselCount > 0};
    case "Petrol": {_petrolCount > 0};
    case "JetFuel": {_jetFuelCount > 0};
};

if (!_hasRequiredFuel) exitWith {
    ctrlSetText [1001, format ["%1 requires %2...", _Vehiclename, _requiredFuelType]];
    _PurchaseB ctrlShow true;
    _ExitB ctrlShow true;
};

_text = "Refueling...";
_tanklvl = "Tank level:";
_displayedText = "";
_delay = 29 / 100;

for "_i" from 0 to (_totalLiters + 50) do {
    if ((player getVariable QCLASS(processRefuel)) isEqualTo false) exitWith {};

    _fuelToAdd = 1 / _totalLiters;

    if (fuel _target >= 1) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        (findDisplay 982385) displayRemoveEventHandler ["KeyDown", _RefuelInterrupt];
        _displayFull = format ["%1 fuel tank is full...", _Vehiclename];
        ctrlSetText [1001, _displayFull];
        _PurchaseB ctrlShow true;
        _ExitB ctrlShow true;
    };

    // Check if the player still has the required Jerry can type with at least 1 use
    _hasRequiredFuel = switch (_requiredFuelType) do {
        case "Diesel": {_dieselCount > 0};
        case "Petrol": {_petrolCount > 0};
        case "JetFuel": {_jetFuelCount > 0};
    };

    if (!_hasRequiredFuel) exitWith {
        player setVariable [QCLASS(processRefuel), nil];
        (findDisplay 982385) displayRemoveEventHandler ["KeyDown", _RefuelInterrupt];
        ctrlSetText [1001, format ["You have run out of %1...", _requiredFuelType]];
        _PurchaseB ctrlShow true;
        _ExitB ctrlShow true;
    };

    _displayedText = format ["%1%2%3%2%4%2%5", _text, endl, _Vehiclename, _tanklvl,(fuel _target) * 100];
    ctrlSetText [1001, _displayedText];
    sleep _delay;

    _target setFuel ((fuel _target) + _fuelToAdd);

    // Decrement the count of the used Jerry can type
    switch (_requiredFuelType) do {
        case "Diesel": {
            [QCLASS(diesel), QCLASS(dieselJerryCan_Empty)] call EFUNC(common,itemDecrement);
            _dieselCount = _dieselCount - 1;
        };
        case "Petrol": {
            [QCLASS(petrol), QCLASS(petrolJerryCan_Empty)] call EFUNC(common,itemDecrement);
            _petrolCount = _petrolCount - 1;
        };
        case "JetFuel": {
            [QCLASS(jetFuel), QCLASS(jetFuelJerryCan_Empty)] call EFUNC(common,itemDecrement);
            _jetFuelCount = _jetFuelCount - 1;
        };
    };
};





