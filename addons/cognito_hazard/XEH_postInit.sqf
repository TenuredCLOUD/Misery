#include "script_component.hpp"

if (isServer) then {
    call FUNC(inArea);
};

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {
    [QGVAR(cognitoHazardEvent), FUNC(process)] call CBA_fnc_addEventHandler;
    [QGVAR(cognitoHazardAudio), FUNC(audioEffect)] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
