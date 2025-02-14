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
if (EGVAR(psychosis,enabled) && EGVAR(psychosis,sleepBlocked)) exitWith {
    titleText [format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_CANTSLEEPFEAR"], "PLAIN DOWN", -1, true, true];
    [QUOTE(COMPONENT_BEAUTIFIED), "Sleep is blocked by fear."] call EFUNC(common,debugMessage);
};

call EFUNC(common,getPlayerVariables) params ["_hunger", "_thirst", "_energyDeficit"];
call FUNC(hourSelected) params ["_selectedHour"];

if (_selectedHour isEqualTo 0) exitWith {
    titleText [format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_SLEEPNOHOURSELECT"], "PLAIN DOWN", -1, true, true];
};

if (_energyDeficit < 0.15) exitWith {
    titleText [format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_SLEEPNOTTIRED"], "PLAIN DOWN", -1, true, true];
};

if (animationState player isNotEqualTo "amovpsitmstpsnonwnondnon_ground") then {
    player playActionNow "SitDown";
};

player setVariable [QGVAR(isSleeping), true];

cutText ["", "BLACK OUT", 2];

[{
    skipTime _this;
}, _selectedHour, 3] call CBA_fnc_waitAndExecute;

[{
    titleText [format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_SLEPTFORHOWLONG", _this]], "PLAIN DOWN", -1, true, true];
    player setFatigue 1;
}, _selectedHour, 6] call CBA_fnc_waitAndExecute;

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
}, [], 10] call CBA_fnc_waitAndExecute;
