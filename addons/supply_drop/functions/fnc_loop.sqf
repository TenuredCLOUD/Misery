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

private _players = call EFUNC(common,listPlayers);

// if no players in game, rerun loop after timedown
if (_players isEqualTo []) exitWith {
    [{
        [] call FUNC(loop);
    }, [], 10] call CBA_fnc_waitAndExecute;
};

if ([GVAR(spawnChance)] call EFUNC(common,rollChance)) then {
    [] call FUNC(airSequence);
};

[{
    [] call FUNC(loop);
}, [], GVAR(cycleLength)] call CBA_fnc_waitAndExecute;
