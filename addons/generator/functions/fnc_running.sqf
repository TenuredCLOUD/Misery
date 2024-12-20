#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Running Audio loop
 *
 * Arguments:
 * 0: Object <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_running
 *
*/

_Generator = _this select 0;

while {true} do {

    _soundRunning = ["petorlgeneratorrunning", "dieselgeneratorrunning"] select (typeOf _Generator == "Land_PowerGenerator_F");

    _GeneratorType = typeOf _Generator;

    switch (_GeneratorType) do {
        case "Misery_100KVA_Gen": {
            _soundRunning = "100_KVA_Running";
        };
        case "Misery_HeavilyUsedGen_Gas": {
            _soundRunning = "petorlgeneratorrunning";
        };
        case "Misery_HeavilyUsedGen_Diesel": {
            _soundRunning = "dieselgeneratorrunning";
        };
    };

    private _soundDummyRunning = "Land_HelipadEmpty_F" createVehicle (getPosATL _Generator);
    _Generator setVariable ["Misery_GenSound", true,true];
    [_soundDummyRunning, [_soundRunning, 500]] remoteExec ["say3D", 0, _soundDummyRunning];
    [{
    !(_Generator getVariable ["Misery_GenSound", false])
    },{
    deleteVehicle _this;
    }, _soundDummyRunning] call CBA_fnc_waitUntilAndExecute;

    if (_Generator getVariable ["Misery_Gen_IsRunning", false] isEqualTo false) exitWith {
        deleteVehicle _soundDummyRunning;
    };

     if (_Generator getVariable ["Misery_Gen_FuelLVL", 100] <= 0) exitWith {
    _PowerOnB = findDisplay 573849 displayCtrl 1600;
    _PowerOffB = findDisplay 573849 displayCtrl 1601;
    _RefuelB = findDisplay 573849 displayCtrl 1602;
    deleteVehicle _soundDummyRunning;
    _Generator setVariable ["Misery_GenSound", false,true];
    _Generator setVariable ["Misery_Gen_IsRunning", false, true];
    _soundStop = ["petrolgeneratorstop", "dieselgeneratorstop"] select (typeOf _Generator == "Land_PowerGenerator_F");
    private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position _Generator);
    _Generator setVariable ["Misery_GenSoundNOFUEL", true,true];
    [_soundDummy, [_soundStop, 500]] remoteExec ["say3D", 0, _soundDummy];
    [{
    !(_Generator getVariable ["Misery_GenSoundNOFUEL", false])
    },{
    deleteVehicle _this;
    }, _soundDummy] call CBA_fnc_waitUntilAndExecute;

    _PowerOnB ctrlShow true;
    _RefuelB ctrlShow true;
    };

    sleep 11;
};

