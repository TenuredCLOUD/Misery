#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Running Audio loop
 *
 * Arguments:
 * 0: Generator <OBJECT>
 * 1: Type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_processAction
 *
*/

params ["_generator", "_generatorType"];

private _fuelLevel = _generator getVariable [QGVAR(generatorFuel), 0];

if (_fuelLevel <= 0) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoFuel)] call CBA_fnc_localEvent;
};

private _config = configFile >> "CfgVehicles" >> _generatorType;

private _soundStart   = getText (_config >> QGVAR(soundStart));
private _startupDelay = getNumber (_config >> QGVAR(startupDelay));
private _soundRadius  = getNumber (_config >> QGVAR(soundRadius));

private _dummyPosition = getPosATL _generator;
private _soundDummy = createVehicle ["Land_HelipadEmpty_F", _dummyPosition, [], 0, "CAN_COLLIDE"];

[QEGVAR(audio,say3D), [_soundDummy, _soundStart, _soundRadius]] call CBA_fnc_globalEvent;

// Failure to start RNG logic since most Generators do not start with one pull etc...
if ([50] call EFUNC(common,rollChance) && _generatorType isEqualTo QCLASS(petrolGenerator)) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(FailedStart)] call CBA_fnc_localEvent;
    [{
        deleteVehicle _this;
    }, [_soundDummy], _startupDelay] call CBA_fnc_waitAndExecute;
};

[QGVAR(addGeneratorToServer), [_generator]] call CBA_fnc_serverEvent;

[{
    params ["_generator", "_generatorType", "_soundDummy"];

    if (!isNull _soundDummy) then {
        deleteVehicle _soundDummy;
    };

    [QGVAR(processFuel), [_generator, _generatorType]] call CBA_fnc_globalEvent;
    [QGVAR(processPower), [_generator, _generatorType]] call CBA_fnc_globalEvent;
    [QGVAR(running), [_generator, _generatorType]] call CBA_fnc_globalEvent;
    [QGVAR(watchPos), [_generator]] call CBA_fnc_globalEvent;
}, [_generator, _generatorType, _soundDummy], _startupDelay] call CBA_fnc_waitAndExecute;

