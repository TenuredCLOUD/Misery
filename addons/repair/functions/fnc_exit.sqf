#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Exits repair ui from exit button press, killing display events
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_repair_fnc_exit
*/

(findDisplay 982386) closeDisplay 2;

if (!isNil {player getVariable [QCLASS(processRepairs), false]}) then {
    player setVariable [QCLASS(processRepairs), nil];
};
