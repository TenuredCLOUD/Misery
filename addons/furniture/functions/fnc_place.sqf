#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Starts placement system trackers & parses object data to trackers
 *
 * Arguments:
 * 0: Classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_place
 *
*/

params ["_className"];

private _furnitureCfg = missionConfigFile >> "CfgMisery_Furniture" >> _className;

// Remove from inventory
private _inventory = player getVariable [QGVAR(furnitureInventory), []];
private _index = _inventory find _className;
if (_index isEqualTo -1) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Item not in inventory!"] call EFUNC(common,debugMessage);
};

_inventory deleteAt _index;
player setVariable [QGVAR(furnitureInventory), _inventory];

// Create object locally
private _object = createVehicleLocal [_className, [0,0,0], [], 0, "CAN_COLLIDE"];
player setVariable [QGVAR(placingObject), _object];
player setVariable [QGVAR(selectedFurniture), _className];
player setVariable [QGVAR(isForcedplacement), false];

// Disable collision & simulation locally
player disableCollisionWith _object;
_object enableSimulation false;
_object setPhysicsCollisionFlag false;

// Force holster of weapon
call EFUNC(holster,action);

[_object, GVAR(snapToSurface)] call FUNC(trackHeight);
[] call FUNC(trackMouse);
[] call FUNC(watchState);
player forceWalk true;

["Left mouse to place object, Right mouse to cancel, Scroll to rotate", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
