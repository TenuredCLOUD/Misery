#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Ensures the markers defined exist and are the correct type, if not the safezone system will not function.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Marker check success <BOOL>
 *
 * Example:
 * [] call misery_safezone_fnc_checkSafeZones
*/

// Convert to Array.
if (GVAR(safezoneAreas) isEqualType "") then {
    GVAR(safezoneAreas) = parseSimpleArray GVAR(safezoneAreas);
};

private _failedMarkers = [];

{
    private _marker = _x;
    private _markerShape = markerShape _marker;
    if (_markerShape != "RECTANGLE" && _markerShape != "ELLIPSE") then {
        private _msg = format ["Safezone marker (%1) is either not an area marker or does not exist, remove it from the list.", _marker];
        [QUOTE(COMPONENT_BEAUTIFIED), _msg] call EFUNC(common,debugMessage);
        _failedMarkers pushBackUnique _marker;
    };
} forEach GVAR(safezoneAreas);

count _failedMarkers == 0
