#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Starts placement system trackers for forced placement (bypassing inventory for heavy items)
 *
 * Arguments:
 * 0: Classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_forcedPlacement
 *
*/

params ["_className"];

private _furnitureCfg = missionConfigFile >> "CfgMisery_Furniture" >> _className;
private _snapToSurface = getNumber (_furnitureCfg >> "snapToSurface");

// Create object locally
private _object = createVehicleLocal [_className, [0,0,0], [], 0, "CAN_COLLIDE"];
player setVariable [QGVAR(placingObject), _object];
player setVariable [QGVAR(selectedFurniture), _className];
player setVariable [QGVAR(isForcedplacement), true];

// Disable collision & simulation locally
player disableCollisionWith _object;
_object enableSimulation false;

[_object, _snapToSurface] call FUNC(trackHeight);
[] call FUNC(trackMouse);
[] call FUNC(watchState);
player forceWalk true;

["Left mouse to place object, Right mouse to cancel, Scroll to rotate", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
