#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

// Prestart for vehicle interaction to avoid undefined RPT logs
GVAR(targetVehicle) = objNull;
GVAR(targetVehicleType) = nil;

GVAR(checkMultiplayer) = isMultiplayer;

GVAR(checkRavage) = isClass (configFile>>"cfgPatches">>"ravage");

GVAR(ravageAtmosphere) = (count (entities "Ravage_atmosphere") > 0);

GVAR(vda) = isClass (configFile>>"cfgPatches">>"VandeansonsApocalypse");

GVAR(ace) = isClass (configFile>>"cfgPatches">>"ace_main");

GVAR(aceRefuel) = isClass (configFile>>"cfgPatches">>"ace_refuel");

GVAR(iBuild) = isClass (configFile>>"cfgPatches">>"NerdMods_iBuild");

GVAR(remnant) = isClass (configFile>>"cfgPatches">>"remnant");

GVAR(dsa) = isClass (configFile>>"cfgPatches">>"DSA_Spooks");

GVAR(ims) = isClass (configFile>>"cfgPatches">>"WBK_MeleeMechanics");

ADDON = true;
