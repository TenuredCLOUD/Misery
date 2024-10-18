#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

/*
if (MiseryTemperature == 1 && hasInterface) then {
MiseryActions pushBack [localize "STR_MISERY_CheckClothing", localize "STR_MISERY_CheckClothing"];
[player] call Misery_fnc_EffectiveTemperature;

//CBA settings added for Misery BreathFog simulation (optional effect):
[
"MiseryBFEffect", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
"CHECKBOX", // setting type
["Misery BreathFog simulation", "Enables BreathFog simulation, even though a local effect, lower end PC's might lose a couple FPS when running this..."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
["Misery","Effects & Performance settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
true, // data for this setting: [min, max, default, number of shown trailing decimals]
2, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
{
params ["_value"];
MiseryBFEffect = _value;
if !(MiseryBFEffect) then {MiseryBreathFogAllowed = false} else {MiseryBreathFogAllowed = true};
} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;
};
*/

ADDON = true;
