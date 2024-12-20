#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Sleep system (Singleplayer only)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_sleep_fnc_processSleep;
 *
*/

private _MSleepiness = player getVariable ["MiserySleepiness", MACRO_PLAYER_FATIGUE];
private _MHunger = player getVariable ["MiseryHunger", MACRO_PLAYER_HUNGER];
private _MThirst = player getVariable ["MiseryThirst", MACRO_PLAYER_THIRST];
private _MDebuffs = player getVariable "MiseryDebuffs";
private _MFearSleep = player getVariable "Misery_FearSleep";

private _HourVal = player getVariable "Misery_SleepDataVal";

if (_HourVal == 0) exitWith {
    titleText [format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_SLEEPNOHOURSELECT"], "PLAIN DOWN", -1, true, true];
    player setVariable ["Misery_SleepDataVal", nil];
};

if !(_MSleepiness >= 15) exitWith {titleText [format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_SLEEPNOTTIRED"], "PLAIN DOWN", -1, true, true]; player setVariable ["Misery_SleepDataVal", nil];};

if (!(isNil {player getVariable "MiseryFear"}) && ((player getVariable ["MiseryFear", MACRO_PLAYER_FEAR]) >= 5) && (!_MFearSleep)) exitWith {titleText [format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_CANTSLEEPFEAR"], "PLAIN DOWN", -1, true, true];};

_sitting = animationState player;
if (_sitting != "amovpsitmstpsnonwnondnon_ground") then {
    player playActionNow "SitDown";
};

player setVariable ["Misery_IsSleeping", true];

cutText ["", "BLACK OUT", 2];

sleep 3;

skipTime _HourVal; // Use the selected hour for the skipTime command

sleep 3;

titleText [format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_SLEPTFORHOWLONG", _HourVal]], "PLAIN DOWN", -1, true, true];

player setFatigue 1;

sleep 2;

cutText ["", "BLACK IN", 2];

player switchMove "Acts_UnconsciousStandUp_part1";
player setAnimSpeedCoef 1.5;

[{animationState player != "Acts_UnconsciousStandUp_part1"},
{
    player setAnimSpeedCoef 1;
}] call CBA_fnc_waitUntilAndExecute;

player setVariable ["MiserySleepiness", (_MSleepiness - MisSleep_sleepinessDecrease)];

player setVariable ["Misery_IsSleeping", false];

if (_MFearSleep) then {
player setVariable ["Misery_FearSleep", false];
};

if (_MHunger > 20) then {
player setVariable ["MiseryHunger", (_MHunger - MisSleep_hungerDecrease)];
} else {
if (damage player > 50) then {
player setDamage (damage player) + 0.25;
} else {
player setDamage (damage player) + 0.5;
};
};

if (_MThirst > 20) then {
player setVariable ["MiseryThirst", (_MThirst - MisSleep_thirstDecrease)];
} else {
if (damage player > 50) then {
player setDamage (damage player) + 0.25;
} else {
player setDamage (damage player) + 0.5;
};
};

player setVariable ["Misery_SleepDataVal", nil];
