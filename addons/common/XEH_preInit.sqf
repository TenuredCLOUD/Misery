#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

MiseryDebug=FALSE;
MiseryEnabled=TRUE;

MiserysurvivalShowStatus=FALSE;

MiserysurvivalItems=[];
MiserysurvivalItemEffects=[];

MiseryAllBuildings=[];

MiserySleeping=FALSE;

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
MiseryinPsyfield = FALSE; 

//RadZone preset:
MiseryinRadZone = FALSE;

// Custom player menu actions [_description,_scriptPath]
MiseryActionsCustom=[];

MiseryMP=TRUE; // Multiplayer
if!(isMultiplayer)then{MiseryMP=FALSE};

MiseryRavage=FALSE;
if (isClass(configFile>>"cfgPatches">>"ravage")) then {MiseryRavage=TRUE};

MiseryRavageAtmo = FALSE;
if ((count(entities "Ravage_atmosphere")) > 0) then {MiseryRavageAtmo = TRUE};

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

MiseryVA=FALSE;
if(isClass(configFile>>"cfgPatches">>"VandeansonsApocalypse"))then{MiseryVA=TRUE};

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

MiseryACE=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=TRUE};

MiseryACERefuel=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_refuel"))then{MiseryACERefuel=TRUE};

MiseryUsingiBuild=FALSE; 
if(isClass(configFile>>"cfgPatches">>"NerdMods_iBuild"))then{MiseryUsingiBuild=TRUE};

MiseryRemnant=FALSE; 
if(isClass(configFile>>"cfgPatches">>"remnant"))then{MiseryRemnant=TRUE};

MiseryDSA=FALSE; 
if(isClass(configFile>>"cfgPatches">>"DSA_Spooks"))then{MiseryDSA=TRUE};

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
