#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Supply drop loop / spawn check
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_supply_drop_fnc_loop;
 *
*/

if ([GVAR(spawnChance)] call EFUNC(common,rollChance)) then {
    [] call FUNC(airSequence);
};

[{
    [] call FUNC(loop);
}, [], GVAR(cycleLength)] call CBA_fnc_waitAndExecute;
