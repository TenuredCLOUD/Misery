#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Exits rearm compat ui from exit button press, killing display events
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_rearm_fnc_exit
*/

(findDisplay 982383) closeDisplay 2;

if (!isNil {player getVariable [QCLASS(processRearm), false]}) then {
    player setVariable [QCLASS(processRearm), nil];
};
