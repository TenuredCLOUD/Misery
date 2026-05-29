#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Generator Refuel Action
 *
 * Arguments:
 * 0: Generator <OBJECT>
 * 1: Type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_refuel
 *
*/

params ["_generator", "_generatorType"];

private _fuelLevel = _generator getVariable [QGVAR(fuelLevel), 1];

if (_fuelLevel >= 1) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(FullTank)] call CBA_fnc_localEvent;
};

private _fuelCan = "";
private _requiredFuelType = "";
private _fueltoAdd = 0;

switch (_generatorType) do {
    case "Land_Portable_generator_F": {
        _fuelCan = QCLASS(petrol);
        _requiredFuelType = localize LSTRING(Petrol);
        // Simulated 40L/10.5Gal tank
        _fueltoAdd = 0.025;
    };
    case QCLASS(dieselGenerator): {
        _fuelCan = QCLASS(diesel);
        _requiredFuelType = localize LSTRING(Diesel);
        // Simulated 80L/21Gal tank
        _fueltoAdd = 0.0125;
    };
    case QCLASS(kvaGenerator): {
        _fuelCan = QCLASS(diesel);
        _requiredFuelType = localize LSTRING(Diesel);
        // Simulated 500L/132Gal tank
        _fueltoAdd = 0.002;
    };
};

if !([[_fuelCan]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), format [localize LSTRING(NeedsJerrycan), _requiredFuelType]] call CBA_fnc_localEvent;
};

private _lastPos = getPosATL player;

[{
    params ["_args", "_handle"];
    _args params ["_fuelCan", "_requiredFuelType", "_fuelLevel", "_generator", "_generatorType", "_lastPos", "_fueltoAdd"];

    private _currentFuel = _generator getVariable [QGVAR(fuelLevel), 1];

    private _fuelTip = format [localize LSTRING(FuelLevel), [_currentFuel * 100, 1, 1, false] call CBA_fnc_formatNumber, "%"];

    [[_fuelTip, 1, [1, 1, 1, 1]], [], true] call CBA_fnc_notify;

    private _currentPos = getPosATL player;

    //Check if player is moving, immediately stop refueling
    if (_currentPos distance _lastPos > 0.01) exitWith {
        [QEGVAR(common,tileText), [localize LSTRING(RefuelingInterrupted)]] call CBA_fnc_localEvent;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if !([[_fuelCan]] call EFUNC(common,hasItem)) exitWith {
        [QEGVAR(common,tileText), format [localize LSTRING(NeedsJerrycan), _requiredFuelType]] call CBA_fnc_localEvent;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (_fuelLevel >= 1) exitWith {
        [QEGVAR(common,tileText), localize LSTRING(FullTank)] call CBA_fnc_localEvent;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    _generator setVariable [QGVAR(fuelLevel), _currentFuel + _fueltoAdd, true];

    private _emptyCan = [QCLASS(petrolEmpty), QCLASS(dieselEmpty)] select (_requiredFuelType isEqualTo (localize LSTRING(Diesel)));

    [_fuelCan, _emptyCan] call EFUNC(common,itemDecrement);

}, 1, [_fuelCan, _requiredFuelType, _fuelLevel, _generator, _generatorType, _lastPos, _fueltoAdd]] call CBA_fnc_addPerFrameHandler;

