#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Process refueling generators with fuel can
 *
 * Arguments:
 * 0: Unit refueling <OBJECT>
 * 1: Generator <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_power_fnc_refuelGenerator
 *
*/

params ["_unit", "_generator"];

if (isNull _generator) exitWith {};

private _genFuelIndex = [_generator] call FUNC(getGeneratorFuelIndex);

private _foundCanClass = [MACRO_FUEL_CANS] select _genFuelIndex;

private _fuelStrings = [localize LSTRING(Diesel), localize LSTRING(Petrol)];
private _canFuelTypeString = _fuelStrings select _genFuelIndex;

if !([[_foundCanClass]] call EFUNC(common,hasItem)) exitWith {
    private _msg = format [localize LSTRING(NeedsJerrycan), _canFuelTypeString];
    hintSilent format ["%1", _msg];
};

private _generatorClass = typeOf _generator;
private _maxTankCapacity = switch (true) do {
    case (_generatorClass in (GVAR(generators) select [0, 4])): { 5 };
    case (_generatorClass isEqualTo "Land_MobileRadar_01_generator_F_AE3"): { 470 };
    default { 300 };
};

private _fuelChange = 1 / _maxTankCapacity;

private _lastPos = getPosATL _unit;

[{
    params ["_args", "_handle"];
    _args params ["_unit", "_generator", "_genFuelIndex","_foundCanClass", "_canFuelTypeString", "_fuelChange", "_lastPos"];

    private _currentPos = getPosATL _unit;

    hintSilent format ["%1", localize LSTRING(Refueling)];

    if ((_currentPos distance _lastPos) > 0.01 || !alive _unit || { [_generator] call AE3FUNC(power,getPowerState) isNotEqualTo "Off" }) exitWith {
        hintSilent format ["%1", localize LSTRING(RefuelingInterrupted)];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (fuel _generator >= 1) exitWith {
        hintSilent format ["%1", localize LSTRING(FullTank)];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if !([[_foundCanClass]] call EFUNC(common,hasItem)) exitWith {
        private _msg = format [localize LSTRING(NeedsJerrycan), _canFuelTypeString];
        hintSilent format ["%1", _msg];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _emptyCanClass = [MACRO_FUEL_CANS_EMPTY] select _genFuelIndex;

    if (fuel _generator < 1) then {
        [_foundCanClass, _emptyCanClass] call EFUNC(common,itemDecrement) params ["_decremented"];
        if (_decremented) then {
            _generator setFuel ((fuel _generator) + _fuelChange);
        };
    };
}, 1, [_unit, _generator, _genFuelIndex, _foundCanClass, _canFuelTypeString, _fuelChange, _lastPos]] call CBA_fnc_addPerFrameHandler;

