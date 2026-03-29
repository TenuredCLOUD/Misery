#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Ensures the markers defined exist and are the correct type, if not the dead zone system will not function.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Marker check success <BOOL>
 *
 * Example:
 * [] call misery_dead_zone_fnc_checkZones
*/

// Convert to Array.
if (GVAR(areas) isEqualType "") then {
    GVAR(areas) = parseSimpleArray GVAR(areas);
};

private _failedMarkers = [];

{
    private _marker = _x;
    private _markerShape = markerShape _marker;
    if (_markerShape isNotEqualTo "RECTANGLE" && _markerShape isNotEqualTo "ELLIPSE") then {
        private _msg = format ["Dead zone marker (%1) is either not an area marker or does not exist, remove it from the list.", _marker];
        [QUOTE(COMPONENT_BEAUTIFIED), _msg] call EFUNC(common,debugMessage);
        _failedMarkers pushBackUnique _marker;
    };
} forEach GVAR(areas);

count _failedMarkers isEqualTo 0
