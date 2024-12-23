#include "script_component.hpp"

if (isServer) then {
    call FUNC(playersInSafeZones);
};

if (hasInterface) then {
    [QGVAR(playerSafeZoneEvent), FUNC(playerSafeZone)] call CBA_fnc_addEventHandler;
};
