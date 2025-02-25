#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Exits refuel ui from exit button press, killing display events
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_refuel_fnc_exit
*/

(findDisplay 982384) closeDisplay 2;

if (!isNil {player getVariable [QCLASS(processRefuel), false]}) then {
    player setVariable [QCLASS(processRefuel), nil];
};
