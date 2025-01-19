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

// Early exit if sleep is blocked.
if (EGVAR(psychosis,enabled) && {EGVAR(psychosis,sleepBlocked)}) exitWith {
    titleText [format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_CANTSLEEPFEAR"], "PLAIN DOWN", -1, true, true];
    [QUOTE(COMPONENT_BEAUTIFIED), "Sleep is blocked by fear."] call EFUNC(common,debugMessage);
};

private _energy = player getVariable [QEGVAR(survival,energyDeficit), MACRO_PLAYER_DEFAULTS_LOW];
private _hunger = player getVariable [QEGVAR(survival,hunger), MACRO_PLAYER_DEFAULTS_HIGH];
private _thirst = player getVariable [QEGVAR(survival,thirst), MACRO_PLAYER_DEFAULTS_HIGH];
private _tiredness = player getVariable [QGVAR(tiredness), 0];
//private _ailments = player getVariable QCLASS(ailments);

private _hourValue = player getVariable QCLASS(sleepValueParsed);

if (_hourValue isEqualTo 0) exitWith {
    titleText [format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_SLEEPNOHOURSELECT"], "PLAIN DOWN", -1, true, true];
    player setVariable [QCLASS(sleepValueParsed), nil];
};

if (_tiredness < 0.15) exitWith {
    titleText [format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_SLEEPNOTTIRED"], "PLAIN DOWN", -1, true, true];
    player setVariable [QCLASS(sleepValueParsed), nil];
};

if (animationState player isNotEqualTo "amovpsitmstpsnonwnondnon_ground") then {
    player playActionNow "SitDown";
};

player setVariable [QGVAR(isSleeping), true];

cutText ["", "BLACK OUT", 2];

[{
    params ["_hourValue"];
    skipTime _hourValue;
}, _hourValue, 3] call CBA_fnc_waitAndExecute;

[{
    params ["_hourValue"];
    titleText [format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_SLEPTFORHOWLONG", _hourValue]], "PLAIN DOWN", -1, true, true];
    player setFatigue 1;
}, _hourValue, 6] call CBA_fnc_waitAndExecute;

[{
    cutText ["", "BLACK IN", 2];
}, [], 8] call CBA_fnc_waitAndExecute;

[{
    player switchMove "Acts_UnconsciousStandUp_part1";
    player setVariable [QCLASS(isSleeping), false];

    // Decrement hunger, thirst and energy deficit.
    player setVariable [QEGVAR(survival,energyDeficit), GVAR(energyDeficitAfterSleep)];
    /*
    * ToDo: Add modifier function for hunger thirst and decrease them from sleep.
    */

    player setVariable [QCLASS(sleepValueParsed), nil];
}, [], 10] call CBA_fnc_waitAndExecute;
