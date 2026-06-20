#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Process syphoning generators
 *
 * Arguments:
 * 0: Unit syphoning <OBJECT>
 * 1: Generator <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_power_fnc_syphonGenerator
 *
*/

params ["_unit", "_generator"];

if (isNull _generator) exitWith {};

if !([["ToolKit"]] call EFUNC(common,hasItem)) exitWith {
    hintSilent format ["%1", localize LSTRING(NeedToolkitSyphon)];
};

private _genFuelIndex = [_generator] call FUNC(getGeneratorFuelIndex);

private _foundCanClass = [MACRO_FUEL_CANS] select _genFuelIndex;

private _emptyCanClass = [MACRO_FUEL_CANS_EMPTY] select _genFuelIndex;

private _fuelStrings = [localize LSTRING(Diesel), localize LSTRING(Petrol)];
private _canFuelTypeString = _fuelStrings select _genFuelIndex;

if !([[_foundCanClass, _emptyCanClass]] call EFUNC(common,hasItem)) exitWith {
    private _msg = format [localize LSTRING(NeedJerrycanSyphon), _canFuelTypeString];
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

private _isInitialSwapDone = false;

[{
    params ["_args", "_handle"];
    _args params ["_unit", "_generator", "_foundCanClass", "_emptyCanClass", "_canFuelTypeString", "_fuelChange", "_lastPos", "_maxTankCapacity", "_isInitialSwapDone"];

    private _currentPos = getPosATL _unit;

    if ((_currentPos distance _lastPos) > 0.01 || !alive _unit || { [_generator] call AE3FUNC(power,getPowerState) isNotEqualTo "Off" }) exitWith {
        hintSilent format ["%1", localize LSTRING(SyphoningInterrupted)];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _currentLiters = (fuel _generator) * _maxTankCapacity;

    if (_currentLiters < 1) exitWith {
        hintSilent format ["%1", localize LSTRING(NoFuel)];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (!_isInitialSwapDone && {[[_emptyCanClass]] call EFUNC(common,hasItem)}) then {
        [_unit, _emptyCanClass] call CBA_fnc_removeItem;
        [_unit, _foundCanClass, 1, true] call CBA_fnc_addMagazine;
        _generator setFuel ((fuel _generator) - _fuelChange);
        _isInitialSwapDone = true;
        _args set [8, true];
    };

    if !([[_foundCanClass, _emptyCanClass]] call EFUNC(common,hasItem)) exitWith {
        private _msg = format [localize LSTRING(NeedJerrycanSyphon), _canFuelTypeString];
        hintSilent format ["%1", _msg];
        _handle call CBA_fnc_removePerFrameHandler;
    };

    hintSilent format ["%1", localize LSTRING(Syphoning)];

    _generator setFuel ((fuel _generator) - _fuelChange);

    [_foundCanClass] call EFUNC(common,itemIncrement) params ["_incremented"];

    if !(_incremented) exitWith {
        private _msg = format [localize LSTRING(ContainerFullOrUnavailable), [_foundCanClass] call EFUNC(common,getItemData) select 0];
        hintSilent format ["%1", _msg];
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 1, [_unit, _generator, _foundCanClass, _emptyCanClass, _canFuelTypeString, _fuelChange, _lastPos, _maxTankCapacity, _isInitialSwapDone]] call CBA_fnc_addPerFrameHandler;
