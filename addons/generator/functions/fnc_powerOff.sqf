#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Power Off
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_powerOff
 *
*/

    _PowerOnB = findDisplay 573849 displayCtrl 1600;
    _PowerOffB = findDisplay 573849 displayCtrl 1601;
    _RefuelB = findDisplay 573849 displayCtrl 1602;

    _GeneratorType = typeOf GVAR(targetGenerator);

    switch (_GeneratorType) do {
        case QCLASS(100KVA_Generator): {
            _soundStop = "100_KVA_Shutdown";
        };
        case QCLASS(heavilyUsedGas_Generator): {
            _soundStop = "petrolgeneratorstop";
        };
        case QCLASS(heavilyUsedDiesel_Generator): {
            _soundStop = "dieselgeneratorstop";
        };
    };

    GVAR(targetGenerator) setVariable [QCLASS(generatorRunning), false, true];

       ctrlSetText [1001, "Shutting down generator..."];

    _PowerOnB ctrlShow false;
    _RefuelB ctrlShow false;

    private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position GVAR(targetGenerator));
    GVAR(targetGenerator) setVariable [QCLASS(generatorSound), true,true];
    [_soundDummy, [_soundStop, 500]] remoteExec ["say3D", 0, _soundDummy];
    [{
    !(GVAR(targetGenerator) getVariable [QCLASS(generatorSound), false])
    },{
    deleteVehicle _this;
    }, _soundDummy] call CBA_fnc_waitUntilAndExecute;

    _PowerOnB ctrlShow true;
    _RefuelB ctrlShow true;

