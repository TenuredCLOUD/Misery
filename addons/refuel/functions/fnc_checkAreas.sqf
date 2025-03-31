#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Ensures the markers defined exist and are the correct type, if not the refuel system will not function.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Marker check success <BOOL>
 *
 * Example:
 * [] call misery_refuel_fnc_checkAreas
*/

// Convert to Array.
GVAR(areas) = parseSimpleArray GVAR(areas);
GVAR(fuelCosts) = parseSimpleArray GVAR(fuelCosts);


private _failedMarkers = [];

{
    private _marker = _x;
    private _markerShape = markerShape _marker;
    if (_markerShape isNotEqualTo "RECTANGLE" && _markerShape isNotEqualTo "ELLIPSE") then {
        private _msg = format ["Refuel area marker (%1) is either not an area marker or does not exist, remove it from the list.", _marker];
        [QUOTE(COMPONENT_BEAUTIFIED), _msg] call EFUNC(common,debugMessage);
        _failedMarkers pushBackUnique _marker;
    };
} forEach GVAR(areas);

count _failedMarkers isEqualTo 0
