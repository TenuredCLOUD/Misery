#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Animal spawner initialization
 * Starts first loop iteration for spawner framework
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_animals_fnc_process;
 *
*/

if (!isServer) exitWith {};

// Process empty entity array prior to generating animals
GVAR(registeredEntities) = [];

[] call FUNC(loop);
