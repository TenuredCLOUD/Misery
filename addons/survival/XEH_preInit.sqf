#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

/*
//Module startup wait check:
MiseryReady=true;
publicVariable "MiseryReady";

MiserysurvivalShowStatus=true;

if !(MiseryMP) then {
player setVariable ["MiserySleeppillstaken", 0];
player setVariable ["Misery_IsSleeping", false];
player setVariable ["Misery_FearSleep", false];
};

//MP "Tired" Debuff removal:
if(MiseryMP)then{MiserySleepinessIncrement=0};

_MDebuffs = player getVariable "MiseryDebuffs";
if (MiseryMP && {_MDebuffs find "TIRED" != -1}) then {_MDebuffs deleteAt (_MDebuffs find "TIRED"); player setVariable ["MiseryDebuffs", _MDebuffs];};

//Reload checks for sickness:
//Zedinfection:
if !(isNil {player getVariable "Zinfectionlogged"}) then {

player setVariable ["Zinfectionlogged", nil];

private _MDebuffs = player getVariable "MiseryDebuffs";

player setVariable ["MiseryInfection", (random 10)]; //add random infection status up to value of 10
_MDebuffs pushBackUnique "PARASITES"; player setVariable ["MiseryDebuffs", _MDebuffs]; //Push parasites to player
};

//Turbidwater:
if !(isNil {player getVariable "Turbidwaterlogged"}) then {

player setVariable ["Turbidwaterlogged", nil];

private _MDebuffs = player getVariable "MiseryDebuffs";
_MDebuffs pushBackUnique "PARASITES"; player setVariable ["MiseryDebuffs", _MDebuffs];
};

//Rawmeat:
if !(isNil {player getVariable "Rawmeatlogged"}) then {

player setVariable ["Rawmeatlogged", nil];

private _MDebuffs = player getVariable "MiseryDebuffs";
_MDebuffs pushBackUnique "PARASITES"; player setVariable ["MiseryDebuffs", _MDebuffs];
};

MiseryClientReady=true;
publicVariable "MiseryClientReady";

//Client execute survival loop
if (hasInterface) then {[] execVM "\z\misery\addons\survival\functions\fnc_survival_loop.sqf"};
*/

ADDON = true;
