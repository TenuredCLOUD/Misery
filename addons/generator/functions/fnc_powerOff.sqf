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

    _GeneratorType = typeOf MiseryTarget_Gen;

    switch (_GeneratorType) do {
        case "Misery_100KVA_Gen": {
            _soundStop = "100_KVA_Shutdown";
        };
        case "Misery_HeavilyUsedGen_Gas": {
            _soundStop = "petrolgeneratorstop";
        };
        case "Misery_HeavilyUsedGen_Diesel": {
            _soundStop = "dieselgeneratorstop";
        };
    };

    MiseryTarget_Gen setVariable ["Misery_Gen_IsRunning", false, true];

       ctrlSetText [1001, "Shutting down generator..."];

    _PowerOnB ctrlShow false;
    _RefuelB ctrlShow false;

    private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position MiseryTarget_Gen);
    MiseryTarget_Gen setVariable ["Misery_GenSound", true,true];
    [_soundDummy, [_soundStop, 500]] remoteExec ["say3D", 0, _soundDummy];
    [{
    !(MiseryTarget_Gen getVariable ["Misery_GenSound", false])
    },{
    deleteVehicle _this;
    }, _soundDummy] call CBA_fnc_waitUntilAndExecute;

    _PowerOnB ctrlShow true;
    _RefuelB ctrlShow true;

