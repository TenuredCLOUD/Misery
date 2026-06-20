#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Pump turn on logic
 * Handles power logic & ACE refuel API hook
 *
 * Arguments:
 * 0: Source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_turnOnPump
*/

params ["_source"];

[{
    params ["_source"];

    [_source, -10] call ACEFUNC(refuel,makeSource);
}, [_source], 1] call CBA_fnc_waitAndExecute;

true
