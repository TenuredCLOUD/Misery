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
if (!GVAR(safezoneAreas) isEqualType []) then {
    GVAR(safezoneAreas) = [GVAR(safezoneAreas)];
};

private _failedMarkers = [];

{
    private _markerShape = markerShape _x;
    if (_markerShape != "RECTANGLE" || _markerShape != "ELLIPSE") then {
        diag_log format ["[MISERY] - Safezone marker (%1) is not an area marker, remove it from the list.", _x];
        _failedMarkers pushBackUnique _x;
    };

    if (_markerShape == "") then {
        diag_log format ["[MISERY] - Safezone marker (%1) does not exist, remove it from the list", _x];
        _failedMarkers pushBackUnique _x;
    };
} forEach GVAR(safezoneAreas);

count _failedMarkers == 0
