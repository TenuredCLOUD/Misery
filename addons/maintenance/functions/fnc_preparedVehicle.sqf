#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Prepares vehicle for scenario start with equipped tools based on it's type
 *
 * Arguments:
 * 0: Object <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_preparedVehicle
 *
*/

params ["_vehicle"];

private _found = false;
private _batteryType = 0;

{
    if ((_x select 0) isEqualTo typeOf _vehicle) then {
        _array = _x;
        _found = true;
        _batteryType = _x select 5;
    };
} forEach EGVAR(common,vehicleData);

private _batteryClass = [QCLASS(autoBattery), QCLASS(autoBattery_Heavy)] select (_batteryType isEqualTo 1);

[_vehicle, _batteryClass, selectRandom [0, 1], true] call CBA_fnc_addItemCargo;

if (_vehicle isKindOf "Car") then {
    [_vehicle, QCLASS(spareTire), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(tirePatchKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(glassRepairKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(electronicRepairKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(enginePartsKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(fuelSystemKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(metalFabricationKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
};

if (typeOf _vehicle in MACRO_TANK_CLASSES) then {
    [_vehicle, QCLASS(trackRepairKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(glassRepairKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(electronicRepairKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(enginePartsKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(fuelSystemKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(metalFabricationKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
};

if (_vehicle isKindOf "Air") then {
    [_vehicle, QCLASS(glassRepairKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(electronicRepairKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(enginePartsKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(fuelSystemKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(metalFabricationKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(rotorRepairKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(weaponSystemKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(winchRepairKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(transmissionRepairKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(hydraulicRepairKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(landingGearKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(aerodynamicControlKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
    [_vehicle, QCLASS(countermeasureKit), selectRandom [0, 1], true] call CBA_fnc_addItemCargo;
};
