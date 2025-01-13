#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

// Prestart for vehicle interaction to avoid undefined RPT logs
GVAR(targetVehicle) = objNull;
GVAR(targetVehicleType) = nil;
GVAR(checkMultiplayer) = isMultiplayer;
GVAR(modLoadedCache) = createHashMap;

call FUNC(modLoadedPrep);

ADDON = true;
