#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Hides objects with lights that cannot be damaged or used with switchLight
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fnc_blackout_switchLights
*/

private _terrainObjects = call FUNC(nearObjects);

{
    _x switchLight "OFF";
} forEach _terrainObjects;
