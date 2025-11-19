#include "script_component.hpp"

if (!isServer) exitWith {};

if (!isClass (missionConfigFile >> "CfgMisery_RadioData")) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "CfgMisery_RadioData not found, skipping radio system."] call EFUNC(common,debugMessage);
};

GVAR(allRadios) = [];
[] call FUNC(initRadios);

// Broadcast the radio objects data across all clients
publicVariable QGVAR(allRadios);

[] call FUNC(parseData);

GVAR(allRadioSounds) = [];

call FUNC(cleanData);

[{
    call FUNC(queueTrack);
}, [selectRandom GVAR(radioTracks)], 1] call CBA_fnc_waitAndExecute;

