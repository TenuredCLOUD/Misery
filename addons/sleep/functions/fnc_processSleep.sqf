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
    [QEGVAR(common,titleText), localize "STR_MISERY_CANTSLEEPFEAR"] call CBA_fnc_localEvent;
    [QUOTE(COMPONENT_BEAUTIFIED), "Sleep is blocked by fear."] call EFUNC(common,debugMessage);
};

call EFUNC(common,getPlayerVariables) params ["_hunger", "_thirst", "_energyDeficit"];
call FUNC(hourSelected) params ["_selectedHour"];

if (_selectedHour isEqualTo 0) exitWith {
    [QEGVAR(common,titleText), localize "STR_MISERY_SLEEPNOHOURSELECT"] call CBA_fnc_localEvent;
};

if (_energyDeficit < 0.15) exitWith {
    [QEGVAR(common,titleText), localize "STR_MISERY_SLEEPNOTTIRED"] call CBA_fnc_localEvent;
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
    [QEGVAR(common,titleText), format [localize "STR_MISERY_SLEPTFORHOWLONG", _this]] call CBA_fnc_localEvent;
    player setFatigue 1;
}, _selectedHour, 6] call CBA_fnc_waitAndExecute;

[{
    cutText ["", "BLACK IN", 2];
}, [], 8] call CBA_fnc_waitAndExecute;

player setVariable [QCLASS(isSleeping), false];

// Calculate hunger and thirst decrement
private _hungerThirstDecrement = (_selectedHour * 0.02) + (0 max (_selectedHour - 8)) * 0.03;
// Calculate energy reduction (reset to 0 at 8 hours, penalty after 8)
private _energyReduction = (1 min (_selectedHour * 0.125)) - (0 max (_selectedHour - 8)) * 0.05;

// Apply to player variables
[-_hungerThirstDecrement, "hunger"] call EFUNC(common,addStatusModifier);
[-_hungerThirstDecrement, "thirst"] call EFUNC(common,addStatusModifier);
[-_energyReduction, "energy"] call EFUNC(common,addStatusModifier);
