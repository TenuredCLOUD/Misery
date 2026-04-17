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

// Add marker to server object so loot doesn't spawn in or on it when session is reloaded
private _markerTAG = _className + str diag_tickTime;
private _placementMarker = createMarkerLocal [_markerTAG, getPosWorld _serverObject];
_placementMarker setMarkerShapeLocal "ELLIPSE";
_placementMarker setMarkerSizeLocal [sizeOf _className, sizeOf _className];
_placementMarker setMarkerAlpha 0;

EGVAR(loot,areas) pushBack _placementMarker;

publicVariableServer QEGVAR(loot,areas);

// Tag marker to object so if it's picked up in session it will be removed
_serverObject setVariable [QGVAR(associatedMarker), _placementMarker, true];

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
