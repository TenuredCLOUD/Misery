#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Delete corpse and replace it with a bloodpool.
 *
 * Arguments:
 * 0: Entity <OBJECT>
 *
 * Return Value:
 * 0: NONE
 *
 * Example:
 * [] call misery_ballistics_fnc_destroy;
 *
*/

params ["_entity"];

private _randomPool = selectRandom [MACRO_BLOODPOOL_TYPES];
private _bloodpool = createVehicle [_randomPool, getPosATL _entity, [], 0, "CAN_COLLIDE"];
deleteVehicle _entity;

[{
    params ["_bloodpool"];
    deleteVehicle _bloodpool;
}, _bloodpool, 30] call CBA_fnc_waitAndExecute;
