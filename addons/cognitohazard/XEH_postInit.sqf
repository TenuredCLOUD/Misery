#include "script_component.hpp"

["CBA_settingsInitialized", {
    if (isServer) then {
        call FUNC(inArea);
    };

if (hasInterface) then {
[QGVAR(cognitoHazardEvent), FUNC(process)] call CBA_fnc_addEventHandler;
[QGVAR(cognitoHazardAudio), FUNC(audioEffect)] call CBA_fnc_addEventHandler;
    };
}] call CBA_fnc_addEventHandler;
