#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Process filling fuel cans from fuel pump
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_processFuelCan
 *
*/

params ["_unit", "_matchedIndex"];

if (_matchedIndex isEqualTo -1) exitWith {};

private _allCans = [MACRO_FUEL_CANS] + [MACRO_FUEL_CANS_EMPTY];
private _foundCanClass = _allCans select _matchedIndex;

private _isEmptyCan = _foundCanClass in [MACRO_FUEL_CANS_EMPTY];

private _fuelTypeIndex = -1;

switch (true) do {
    case (_foundCanClass isEqualTo QCLASS(diesel) || _foundCanClass isEqualTo QCLASS(dieselEmpty)): { _fuelTypeIndex = 0 };
    case (_foundCanClass isEqualTo QCLASS(petrol) || _foundCanClass isEqualTo QCLASS(petrolEmpty)): { _fuelTypeIndex = 1 };
    case (_foundCanClass isEqualTo QCLASS(jetFuel) || _foundCanClass isEqualTo QCLASS(jetFuelEmpty)): { _fuelTypeIndex = 2 };
};

private _fillableCan = [MACRO_FUEL_CANS] select _fuelTypeIndex;

private _nozzle = _unit getVariable [QACEGVAR(refuel,nozzle), objNull];

private _targetPump = if (!isNull _nozzle) then { _nozzle getVariable [QACEGVAR(refuel,source), objNull] } else { objNull };

if (isNull _targetPump) exitWith {
    [[localize LSTRING(FuelPumpUnresponsive), 1, [1, 1, 1, 1]], [], true] call CBA_fnc_notify;
};

private _powerState = [_targetPump] call AE3FUNC(power,getPowerState);

private _dummyPosition = getPosATL _nozzle;
private _soundDummy = createVehicle ["Land_HelipadEmpty_F", _dummyPosition, [], 0, "CAN_COLLIDE"];
private _soundDummy_1 = createVehicle ["Land_HelipadEmpty_F", _dummyPosition, [], 0, "CAN_COLLIDE"];

if (_powerState isEqualTo "Off") exitWith {
    [[localize LSTRING(NoPowerSource), 1, [1, 1, 1, 1]], [], true] call CBA_fnc_notify;
    [QEGVAR(audio,say3D), [_soundDummy, QACEGVAR(refuel,nozzle_stop), 50]] call CBA_fnc_globalEvent;
    [{
        params ["_soundDummy", "_soundDummy_1"];
        deleteVehicle _soundDummy;
        deleteVehicle _soundDummy_1;
    }, [_soundDummy, _soundDummy_1], 0.5] call CBA_fnc_waitAndExecute;
};

private _fuelStrings = [localize LSTRING(Diesel), localize LSTRING(Petrol), localize LSTRING(JetFuel)];

private _canFuelTypeString = _fuelStrings select _fuelTypeIndex;

private _pumpAllowedFuels = _targetPump getVariable [QGVAR(fuelTypeSupported), []];

if !(_fuelTypeIndex in _pumpAllowedFuels) exitWith {
    private _msg = format [localize LSTRING(PumpDoesNotDispense), _canFuelTypeString];
    [[_msg, 1, [1, 1, 1, 1]], [], true] call CBA_fnc_notify;
    [QEGVAR(audio,say3D), [_soundDummy, QACEGVAR(refuel,nozzle_stop), 50]] call CBA_fnc_globalEvent;
    [{
        params ["_soundDummy", "_soundDummy_1"];
        {
            deleteVehicle _x;
        } forEach [_soundDummy, _soundDummy_1];
    }, [_soundDummy, _soundDummy_1], 0.5] call CBA_fnc_waitAndExecute;
};

[QEGVAR(audio,say3D), [_soundDummy, QACEGVAR(refuel,nozzle_start), 50]] call CBA_fnc_globalEvent;

if (_isEmptyCan) then {
    [_unit, _foundCanClass] call CBA_fnc_removeItem;
    [_unit, _fillableCan, 1, true] call CBA_fnc_addMagazine;
};

private _lastPos = getPosATL _unit;

private _totalSteps = 20 / (ACEGVAR(refuel,rate) min 20);
private _currentStep = 0;

[{
    params ["_args", "_handle"];
    _args params ["_nozzle", "_targetPump", "_lastPos", "_totalSteps", "_currentStep", "_unit", "_fillableCan", "_soundDummy", "_soundDummy_1", "_canFuelTypeString"];

    private _currentPos = getPosATL _unit;

    [[localize LSTRING(Refueling), 1, [1, 1, 1, 1]], [], true] call CBA_fnc_notify;

    if ((_currentPos distance _lastPos) > 0.01 || isNull _nozzle || isNull _targetPump || !alive _unit) exitWith {
        [[localize LSTRING(RefuelingInterrupted), 1, [1, 1, 1, 1]], [], true] call CBA_fnc_notify;
        deleteVehicle _soundDummy;
        [QEGVAR(audio,say3D), [_soundDummy_1, QACEGVAR(refuel,nozzle_stop), 50]] call CBA_fnc_globalEvent;
        [{
            deleteVehicle _this;
        }, [_soundDummy_1], 0.5] call CBA_fnc_waitAndExecute;

        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _incremented = false;
    private _rate = ACEGVAR(refuel,rate);

    for "_i" from 1 to _rate do {
        [_fillableCan] call EFUNC(common,itemIncrement) params [["_success", false]];
        if (_success) then { _incremented = true; };
    };

    if !(_incremented) exitWith {
        private _msg = format [localize LSTRING(CanIsFull), _canFuelTypeString];
        [[_msg, 1, [1, 1, 1, 1]], [], true] call CBA_fnc_notify;
        deleteVehicle _soundDummy;
        [QEGVAR(audio,say3D), [_soundDummy_1, QACEGVAR(refuel,nozzle_stop), 50]] call CBA_fnc_globalEvent;
        [{
            deleteVehicle _this;
        }, [_soundDummy_1], 0.5] call CBA_fnc_waitAndExecute;

        _handle call CBA_fnc_removePerFrameHandler;
    };

    _currentStep = _currentStep + 1;
    _args set [4, _currentStep];

    if (_currentStep >= _totalSteps) exitWith {
        deleteVehicle _soundDummy;
        [QEGVAR(audio,say3D), [_soundDummy_1, QACEGVAR(refuel,nozzle_stop), 50]] call CBA_fnc_globalEvent;
        [{
            deleteVehicle _this;
        }, [_soundDummy_1], 0.5] call CBA_fnc_waitAndExecute;

        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [_nozzle, _targetPump, _lastPos, _totalSteps, _currentStep, _unit, _fillableCan, _soundDummy, _soundDummy_1, _canFuelTypeString]] call CBA_fnc_addPerFrameHandler;
