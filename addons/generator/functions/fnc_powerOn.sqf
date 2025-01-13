#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Power On
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_powerOn
 *
*/

private ["_PowerOnB","_PowerOffB","_RefuelB","_GeneratorType","_soundStart","_fuelLevel","_soundDummy"];

    _PowerOnB = findDisplay 573849 displayCtrl 1600;
    _PowerOffB = findDisplay 573849 displayCtrl 1601;
    _RefuelB = findDisplay 573849 displayCtrl 1602;

    _GeneratorType = typeOf GVAR(targetGenerator);

    switch (_GeneratorType) do {
        case QCLASS(100KVA_Generator): {
            _soundStart = "100_KVA_Startup";
        };
        case QCLASS(heavilyUsedGas_Generator): {
            _soundStart = "petorlgeneratorstart";
        };
        case QCLASS(heavilyUsedDiesel_Generator): {
            _soundStart = "dieselgeneratorstart";
        };
    };

    _fuelLevel = GVAR(targetGenerator) getVariable [QCLASS(generatorFuelLevel), 100];

    if (_fuelLevel <= 0) exitWith {
        ctrlSetText [1001, "This generator is out of fuel..."];
    };

    GVAR(targetGenerator) setVariable [QCLASS(generatorRunning), true, true];

    ctrlSetText [1001, "Starting generator..."];

    _PowerOnB ctrlShow false;
    _PowerOffB ctrlShow false;
    _RefuelB ctrlShow false;

    private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position GVAR(targetGenerator));
    GVAR(targetGenerator) setVariable [QCLASS(generatorSound), true,true];
    [_soundDummy, [_soundStart, 500]] remoteExec ["say3D", 0, _soundDummy];
    [{
    !(GVAR(targetGenerator) getVariable [QCLASS(generatorSound), false])
    },{
    deleteVehicle _this;
    }, _soundDummy] call CBA_fnc_waitUntilAndExecute;

    sleep 1.5;

    ctrlSetText [1001, nil];

    _PowerOffB ctrlShow true;

    [GVAR(targetGenerator)] call FUNC(running);
    [GVAR(targetGenerator)] call FUNC(fuel);
    [GVAR(targetGenerator)] call FUNC(powerNearby);
    [GVAR(targetGenerator)] call FUNC(trackPos);

