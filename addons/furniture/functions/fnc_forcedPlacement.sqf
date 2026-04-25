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

if ([_className] call FUNC(isStructure)) exitWith {
    [_className] call EFUNC(common,getObjectData) params ["_itemName"];
    private _cannotMoveBuilding = format ["%1 is a structure... You cannot place it...", _itemName];
    [_cannotMoveBuilding, 1, [1, 1, 1, 1]] call CBA_fnc_notify;
};

// private _furnitureCfg = missionConfigFile >> "CfgMisery_Furniture" >> _className;
// private _snapToSurface = getNumber (_furnitureCfg >> "snapToSurface");

// Create object locally
private _object = createVehicleLocal [_className, [0,0,0], [], 0, "CAN_COLLIDE"];
player setVariable [QGVAR(placingObject), _object];
player setVariable [QGVAR(selectedFurniture), _className];
player setVariable [QGVAR(isForcedplacement), true];

// Track dummy object
private _objectTag = format ["dummy_%1_%2", _className, round(diag_tickTime * random 5)];

[_object, _objectTag] remoteExec ["setVehicleVarName", 0, _object];
missionNamespace setVariable [_objectTag, _object, true];

GVAR(registeredPlacement) pushBack _objectTag;
publicVariableServer QGVAR(registeredPlacement);

// Disable collision & simulation locally
player disableCollisionWith _object;
_object enableSimulation false;
_object setPhysicsCollisionFlag false;

[_object, GVAR(snapToSurface)] call FUNC(trackHeight);
[] call FUNC(trackMouse);
[] call FUNC(watchState);
player forceWalk true;

["Left mouse to place object, Right mouse to cancel, Scroll to rotate", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
