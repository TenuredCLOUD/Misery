#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

/*
if (MiseryManualPData == 1 && MiserysurvivalSaveMode == 2) then {
    MiseryActions pushBack [localize "STR_MISERY_PLAYERDATA", localize "STR_MISERY_PLAYERDATA"];
};

//respawn handle for stats (Singleplayer) - incase respawns exist:
if !(MiseryMP && MiserysurvivalSaveMode == 1) then {
player addEventHandler ["Respawn",{
params ["_unit", "_corpse"];
_MiseryDebuffs = [];
_MiseryCraftingKnowledge = [];

    {
        _var = (_this select 0) getVariable [_x select 0, nil];
        if (!isNil "_var") then {
            (_this select 0) setVariable [_x select 0, _x select 1];
        };
    } forEach [
        ["hunger", 100],
        ["thirst", 100],
        ["MiseryThirst", MACRO_PLAYER_THIRST],
        ["MiseryHunger", MACRO_PLAYER_HUNGER],
        ["MiserySleepiness", MACRO_PLAYER_FATIGUE],
        ["MiseryPoison", MACRO_PLAYER_TOXICITY],
        ["MiseryInfection", MACRO_PLAYER_INFECTION],
        ["MiseryExposure", MACRO_PLAYER_EXPOSURE],
        ["MiseryFear", MACRO_PLAYER_FEAR],
        ["Zinfectionlogged", nil],
        ["Turbidwaterlogged", nil],
        ["Rawmeatlogged", nil],
        ["MiseryDebuffs", _MiseryDebuffs],
        ["Misery_Crafting_DataSet", _MiseryCraftingKnowledge],
        ["MiseryCurrency", 0],
        ["MiseryCurrency_Banked", 0],
        ["MiserySleeppillstaken", 0],
        ["Misery_IsSleeping", false],
        ["Misery_FearSleep", false],
        ["MiseryBreathFogSim", nil],
        ["MiseryBreath", false]
    ];
    }];
};
*/

ADDON = true;
