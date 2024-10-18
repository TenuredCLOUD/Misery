#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

MiseryDebug = false;
MiseryEnabled = true;

// Loadout change will clear item cache for hasItem
["loadout", {
    GVAR(itemsCache) = nil;
}] call CBA_fnc_addPlayerEventHandler;

MiserysurvivalShowStatus = false;

MiserysurvivalItems=[];
MiserysurvivalItemEffects=[];

MiseryAllBuildings=[];

MiserySleeping = false;

// Custom inventory click actions [_itemClassName,_scriptPath]
MiseryActionsItemCustom=[];

MiseryActions=[];

MiseryActionsMode="";

//Prestart for vehicle interaction to avoid undefined RPT logs
MiseryTarget_Veh = objNull;

//Prestart for Trader varname tracking:
MiseryActiveTraders = [];

//Deleteclickcheck:
MiseryDeleteConfirm = 0;

//Psyfield preset:
MiseryinPsyfield = false;

//RadZone preset:
MiseryinRadZone = false;

// Custom player menu actions [_description,_scriptPath]
MiseryActionsCustom=[];

MiseryMP = true; // Multiplayer
if!(isMultiplayer)then{MiseryMP=false};

MiseryRavage = false;
if (isClass(configFile>>"cfgPatches">>"ravage")) then {MiseryRavage=true};

MiseryRavageAtmo = false;
if ((count(entities "Ravage_atmosphere")) > 0) then {MiseryRavageAtmo = true};

if (MiseryRavageAtmo && isServer) then {
private _atmomodule=(entities "Ravage_atmosphere")select 0;
_BreathfogisActive = _atmomodule getVariable ["breathfog_m", false];

if (_BreathfogisActive) then{
private _rvgatmofunctions = ["RVG_fnc_breathfog"];

    {
        if (!isNil _x) then {
            missionNamespace setVariable [_x, nil];
            publicVariable _x;
            missionNamespace setVariable [_x, {false}];
            publicVariable _x;
        };
    } forEach _rvgatmofunctions;
    };
};

MiseryVA = false;
if(isClass(configFile>>"cfgPatches">>"VandeansonsApocalypse"))then{MiseryVA=true};

//If VA is active disable inventory handles:
if (MiseryVA && isServer) then {
    private _VAgvars = ["VA_click_handle"];
    private _VAfunctions = ["VA_fnc_actionSelect"];

    {
        if (!isNil _x) then {
            missionNamespace setVariable [_x, false];
            publicVariable _x;
        };
    } forEach _VAgvars;

    {
        if (!isNil _x) then {
            missionNamespace setVariable [_x, nil];
            publicVariable _x;
            missionNamespace setVariable [_x, {false}];
            publicVariable _x;
        };
    } forEach _VAfunctions;
};

MiseryACE = false;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=true};

MiseryACERefuel = false;
if(isClass(configFile>>"cfgPatches">>"ace_refuel"))then{MiseryACERefuel=true};

MiseryUsingiBuild = false;
if(isClass(configFile>>"cfgPatches">>"NerdMods_iBuild"))then{MiseryUsingiBuild=true};

MiseryRemnant = false;
if(isClass(configFile>>"cfgPatches">>"remnant"))then{MiseryRemnant=true};

MiseryDSA = false;
if(isClass(configFile>>"cfgPatches">>"DSA_Spooks"))then{MiseryDSA=true};

//If GRAD persistence is active, push Remnant ODRA object holders to blacklister, so they won't save / reload (This will execute only once)
if (MiseryRemnant && isServer) then {
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
                if (MiseryDebug) then {systemChat format ["[Misery Remnant Compat] GRAD Persistence detected, Adding %1 to blacklist for saving / reloading...", _x]};
            };
        } forEach _RemnantODRA;
    };
};

ADDON = true;
