#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

// Loadout change will clear item cache for hasItem
["loadout", {
    GVAR(itemsCache) = nil;
}] call CBA_fnc_addPlayerEventHandler;

// Prestart for vehicle interaction to avoid undefined RPT logs
GVAR(targetVehicle) = objNull;

GVAR(checkMultiplayer) = isMultiplayer;

GVAR(checkRavage) = isClass (configFile>>"cfgPatches">>"ravage");

GVAR(ravageAtmosphere) = (count (entities "Ravage_atmosphere") > 0);

GVAR(vda) = isClass (configFile>>"cfgPatches">>"VandeansonsApocalypse");

GVAR(ace) = isClass (configFile>>"cfgPatches">>"ace_main");

GVAR(aceRefuel) = isClass (configFile>>"cfgPatches">>"ace_refuel");

GVAR(iBuild) = isClass (configFile>>"cfgPatches">>"NerdMods_iBuild");

GVAR(remnant) = isClass (configFile>>"cfgPatches">>"remnant");

GVAR(dsa) = isClass (configFile>>"cfgPatches">>"DSA_Spooks");

ADDON = true;
