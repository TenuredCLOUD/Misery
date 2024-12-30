#include "script_component.hpp"

["CBA_settingsInitialized", {
    if (isServer) then {
        call FUNC(playersInSafeZones);
    };

if (hasInterface) then {
    [QGVAR(playerSafeZoneEvent), FUNC(playerSafeZone)] call CBA_fnc_addEventHandler;
};
}] call CBA_fnc_addEventHandler;
