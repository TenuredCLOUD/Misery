#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Generator Syphon Action
 *
 * Arguments:
 * 0: Generator <OBJECT>
 * 1: Type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_syphon
 *
*/

params ["_generator", "_generatorType"];

private _fuelLevel = _generator getVariable [QGVAR(generatorFuel), 0];

if (_fuelLevel <= 0) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoFuel)] call CBA_fnc_localEvent;
};

private _config = configFile >> "CfgVehicles" >> _generatorType;

private _fuelCan = getText (_config >> QGVAR(fuelCan));
private _fuelCanEmpty = getText (_config >> QGVAR(fuelCanEmpty));
private _requiredFuelType = getText (_config >> QGVAR(requiredFuelType));
private _fuelToRemove = getNumber (_config >> QGVAR(fuelChange));

if !([[_fuelCan, _fuelCanEmpty]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), format [localize LSTRING(NeedJerrycanSyphon), _requiredFuelType]] call CBA_fnc_localEvent;
};

private _lastPos = getPosATL player;

[{
    params ["_args", "_handle"];
    _args params ["_fuelCan", "_fuelCanEmpty", "_requiredFuelType", "_fuelLevel", "_generator", "_generatorType", "_lastPos", "_fuelToRemove"];

    private _currentFuel = _generator getVariable [QGVAR(generatorFuel), 0];

    private _fuelTip = format [localize LSTRING(FuelLevel), [_currentFuel * 100, 1, 1, false] call CBA_fnc_formatNumber, "%"];

    [[_fuelTip, 1, [1, 1, 1, 1]], [], true] call CBA_fnc_notify;

    private _currentPos = getPosATL player;

    // Check if player is moving, immediately stop syphoning
    if (_currentPos distance _lastPos > 0.01) exitWith {
        [QEGVAR(common,tileText), [localize LSTRING(SyphoningInterrupted)]] call CBA_fnc_localEvent;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    // Add matching magazine type of fuel can to player if they have empty variant
    if !([[_fuelCan]] call EFUNC(common,hasItem)) then {
        // Remove empty can and swap with magazine (fill-able variant)
        [player, _fuelCanEmpty] call CBA_fnc_removeItem;
        [player, _fuelCan, 1, true] call CBA_fnc_addMagazine;
    };

    if (_fuelLevel <= 0) exitWith {
        [QEGVAR(common,tileText), localize LSTRING(NoFuel)] call CBA_fnc_localEvent;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    _generator setVariable [QGVAR(generatorFuel), _currentFuel - _fuelToRemove, true];

    if (_fuelLevel < 0) then {
        _generator setVariable [QGVAR(generatorFuel), 0, true];
    };

    [_fuelCan] call EFUNC(common,itemIncrement) params ["_incremented"];

    if !(_incremented) exitWith {
        [QEGVAR(common,tileText), format [localize LSTRING(NeedJerrycanSyphon), _requiredFuelType]] call CBA_fnc_localEvent;
        _handle call CBA_fnc_removePerFrameHandler;
    };

}, 1, [_fuelCan, _fuelCanEmpty, _requiredFuelType, _fuelLevel, _generator, _generatorType, _lastPos, _fuelToRemove]] call CBA_fnc_addPerFrameHandler;
