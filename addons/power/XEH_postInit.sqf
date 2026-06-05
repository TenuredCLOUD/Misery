#include "script_component.hpp"

if (isServer) then {
    call FUNC(initBatteries);
    call FUNC(initGenerators);
    call FUNC(initLightSources);

    addMissionEventHandler ["PlayerDisconnected", {
	    params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

        private _players = call EFUNC(common,listPlayers);
        if (_players isEqualTo []) exitWith {
            {
                [QGVAR(removeGeneratorFromServer), [_x]] call CBA_fnc_serverEvent;
            } forEach GVAR(runningGenerators);
        };
    }];
};

[QGVAR(addGeneratorToServer), {
    params ["_generator"];
    if (isNull _generator) exitWith {};

    if !(_generator in GVAR(runningGenerators)) then {
        _generator setVariable [QGVAR(generatorRunning), true, true];
        GVAR(runningGenerators) pushBack _generator;
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(removeGeneratorFromServer), {
    params ["_generator"];
    if (isNull _generator) exitWith {};

    _generator setVariable [QGVAR(generatorRunning), false, true];

    private _index = GVAR(runningGenerators) find _generator;
    if (_index isNotEqualTo -1) then {
        GVAR(runningGenerators) deleteAt _index;
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(processFuel), {
    params ["_generator", "_generatorType"];
    [_generator, _generatorType] call FUNC(generatorFuel);
}] call CBA_fnc_addEventHandler;

[QGVAR(processPower), {
    params ["_generator", "_generatorType"];
    [_generator, _generatorType] call FUNC(powerNearby);
}] call CBA_fnc_addEventHandler;

[QGVAR(processPowerConnection), {
    params ["_generator", "_device"];
    [_generator, _device] call FUNC(connectPower);
}] call CBA_fnc_addEventHandler;

[QGVAR(running), {
    params ["_generator", "_generatorType"];
    [_generator, _generatorType] call FUNC(runLoop);
}] call CBA_fnc_addEventHandler;

[QGVAR(watchPos), {
    params ["_generator"];
    [_generator] call FUNC(trackPos);
}] call CBA_fnc_addEventHandler;

if !(hasInterface) exitWith {};

call FUNC(generatorInteractions);

