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

GVAR(checkMultiplayer) = true; 
if !(isMultiplayer) then {GVAR(checkMultiplayer) = false};

GVAR(checkRavage) = false;
if (isClass(configFile>>"cfgPatches">>"ravage")) then {GVAR(checkRavage) = true};

GVAR(ravageAtmosphere) = false;
if ((count(entities "Ravage_atmosphere")) > 0) then {GVAR(ravageAtmosphere) = true};

GVAR(vda) = false;
if(isClass(configFile>>"cfgPatches">>"VandeansonsApocalypse"))then{GVAR(vda) = true};

GVAR(ace) = false;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{GVAR(ace) = true};

GVAR(aceRefuel) = false;
if(isClass(configFile>>"cfgPatches">>"ace_refuel"))then{GVAR(aceRefuel) = true};

GVAR(iBuild) = false;
if(isClass(configFile>>"cfgPatches">>"NerdMods_iBuild"))then{GVAR(iBuild) = true};

GVAR(remnant) = false;
if(isClass(configFile>>"cfgPatches">>"remnant"))then{GVAR(remnant) = true};

GVAR(dsa) = false;
if(isClass(configFile>>"cfgPatches">>"DSA_Spooks"))then{GVAR(dsa) = true};

//If GRAD persistence is active, push Remnant ODRA object holders to blacklister, so they won't save / reload (This will execute only once)
if (GVAR(remnant) && isServer) then {
    if (!isNil "grad_persistence_blacklist") then {
        private _RemnantODRA = [
            "Sign_Sphere10cm_F",
            "Land_HandyCam_F",
            "Reflector_Cone_01_narrow_blue_F",
            "Reflector_Cone_01_narrow_red_F",
            "Reflector_Cone_01_wide_blue_F",
            "Reflector_Cone_01_wide_orange_F",
            "odra_l_alert",
            "odra_lamp_p",
            "odra_l_idle",
            "odra"
        ];

        {
            if ((grad_persistence_blacklist find (toLower _x) == -1) && (grad_persistence_blacklist find (toUpper _x) == -1)) then {
                [_x] call grad_persistence_fnc_blacklistClasses;
                if (EGVAR(common,debug)) then {systemChat format ["[Misery Remnant Compat] GRAD Persistence detected, Adding %1 to blacklist for saving / reloading...", _x]};
            };
        } forEach _RemnantODRA;
    };
};

ADDON = true;
