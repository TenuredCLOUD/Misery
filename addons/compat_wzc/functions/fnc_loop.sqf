#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ai spawner run order loop
 * Processes deletion of distant ai & regeneration of ai with cycle timer
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_wzc_fnc_loop;
 *
*/

[] call FUNC(clean);
[] call FUNC(spawn);

[{
    [] call FUNC(loop);
}, [], GVAR(cycleLength)] call CBA_fnc_waitAndExecute;
