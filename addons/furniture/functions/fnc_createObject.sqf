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

// Remove dummy object from tracking prior to deletion
private _dummyObjectTag = vehicleVarName _object;
if (!isNil "_dummyObjectTag") then {
    private _index = GVAR(registeredPlacement) find _dummyObjectTag;

        if (_index isNotEqualTo -1) then {
        GVAR(registeredPlacement) deleteAt _index;
        publicVariableServer QGVAR(registeredPlacement);
    };
};

deleteVehicle _object;

private _serverObject = createVehicle [_className, [0,0,0], [], 0, "CAN_COLLIDE"];
_serverObject setPosASL _posASL;
_serverObject setDir _rotation;

// Track new server object, and owner (must be passed to GRAD persistence if you want to track it permanently)
private _objectTag = format ["%1_%2", _className, round(diag_tickTime * random 5)];

[_serverObject, _objectTag] remoteExec ["setVehicleVarName", 0, _serverObject];
missionNamespace setVariable [_objectTag, _serverObject, true];

_serverObject setVariable [QGVAR(placementOwner), getPlayerUID player, true];

GVAR(registeredPlacement) pushBack _objectTag;
publicVariableServer QGVAR(registeredPlacement);

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
if !(_className isKindOf "StaticWeapon") then {
    [_className, _displayName, _serverObject] call FUNC(addPickupAction);
};

// Add hold action to object for vehicle loading
if !(_className isKindOf "StaticWeapon") then {
    [_className, _displayName, _serverObject] call FUNC(addLoadAction);
};
