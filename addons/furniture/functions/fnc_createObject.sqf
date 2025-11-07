#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Creates placed object
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Classname <STRING>
 * 2: Position ASL <ARRAY>
 * 3: Direction <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_condition
 *
*/

params ["_object", "_className", "_posASL", "_rotation", "_displayName"];

deleteVehicle _object;

private _serverObject = createVehicle [_className, [0,0,0], [], 0, "CAN_COLLIDE"];
_serverObject setPosASL _posASL;
_serverObject setDir _rotation;

// Re-enable collision & simulation locally
player enableCollisionWith _serverObject;
_serverObject enableSimulation true;
_serverObject setPhysicsCollisionFlag true;

// If placement is a crate, remove contents
if (_serverObject isKindOf "ReammoBox_F") then {
    clearMagazineCargoGlobal _serverObject;
    clearWeaponCargoGlobal _serverObject;
    clearItemCargoGlobal _serverObject;
    clearBackpackCargoGlobal _serverObject;
};

private _placed = player getVariable [QGVAR(placedFurniture), []];
_placed pushBack _serverObject;

player setVariable [QGVAR(placedFurniture), _placed];
player setVariable [QGVAR(placingObject), nil];
player setVariable [QGVAR(isForcedplacement), nil];

// Destroy handles
["MouseZChanged", GVAR(rotationHandle)] call CBA_fnc_removeDisplayHandler;
["MouseButtonDown", GVAR(clickHandle)] call CBA_fnc_removeDisplayHandler;

// Destroy Height tracking PFH
GVAR(objectPlacementDone) = true;

// Add hold action to object for retrieval
[_className, _displayName, _serverObject] call FUNC(addPickupAction);

// Add hold action to object for vehicle loading
[_className, _displayName, _serverObject] call FUNC(addLoadAction);
