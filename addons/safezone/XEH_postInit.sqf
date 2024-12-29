#include "script_component.hpp"

["CBA_settingsInitialized", {
    if (isServer) then {
        call FUNC(playersInSafeZones);
    };
}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    [QGVAR(playerSafeZoneEvent), FUNC(playerSafeZone)] call CBA_fnc_addEventHandler;
};
