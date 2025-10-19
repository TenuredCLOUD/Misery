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

if (!isServer) exitWith {};

params ["_poi"];
private _poiID = _poi select 0;
private _spawnedObjects = _poi select 36;
private _group = _poi select 37;
private _marker = if (count _poi > 38) then {_poi select 38} else {""};

[QUOTE(COMPONENT_BEAUTIFIED), format ["Cleaning up POI %1", _poiID]] call EFUNC(common,debugMessage);

GVAR(activePositions) deleteAt _poiID;
[QUOTE(COMPONENT_BEAUTIFIED), format ["Cleared active position for POI %1", _poiID]] call EFUNC(common,debugMessage);

{deleteVehicle _x} forEach units _group;
{deleteVehicle _x} forEach _spawnedObjects;
if (!isNull _group) then {deleteGroup _group};
if (_marker isNotEqualTo "") then {deleteMarker _marker};

_poi set [35, false];
_poi set [36, []];
_poi set [37, objNull];
if (count _poi > 38) then {_poi deleteAt 38};

GVAR(activeCount) = GVAR(activeCount) - 1;
