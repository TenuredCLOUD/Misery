#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Spawns vehicle and grabs mass value
 *
 * Arguments:
 * 0: Classname <STRING>
 *
 * Return Value:
 * 0: Mass <NUMBER>
 *
 * Example:
 * [] call misery_common_fnc_getObjectMass
 *
 */

params ["_classname"];

private _tempVehicle = createVehicleLocal [_classname, [0, 0, 0], [], 0, "CAN_COLLIDE"];

private _mass = getMass _tempVehicle;
deleteVehicle _tempVehicle;

_mass
