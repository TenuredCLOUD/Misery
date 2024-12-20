#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Animal spawner run order loop
 * Processes deletion of distant animals & regeneration of animals with cycle timer
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_animals_fnc_loop;
 *
*/

[] call FUNC(clean);
[] call FUNC(spawn);

[{
    [] call FUNC(loop);
}, [], GVAR(animalCycleLength)] call CBA_fnc_waitAndExecute;
