#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * POI Cleanup
 * Deletes a POI when players are out of range
 *
 * Arguments:
 * 0: POI Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_poi_fnc_cleanup;
 *
 * Public: No
*/

if !(isServer) exitWith {};

params [["_poi", createHashMap, [createHashMap]]];

private _poiID = _poi get "id";

[QUOTE(COMPONENT_BEAUTIFIED), format ["Cleaning up POI %1", _poiID]] call EFUNC(common,debugMessage);

GVAR(activePositions) deleteAt _poiID;

{
    deleteVehicle _x;
} forEach (units (_poi get "group"));

{
    deleteVehicle _x;
} forEach (_poi get "spawnedObjects");

if (!isNull (_poi get "group")) then {
    deleteGroup (_poi get "group");
};

private _marker = _poi get "marker";

if (_marker isNotEqualTo "") then {
    deleteMarker _marker;
};

_poi set ["isSpawned", false];
_poi set ["spawnedObjects", []];
_poi set ["group", grpNull];
_poi set ["marker", ""];

GVAR(activeCount) = GVAR(activeCount) - 1;
