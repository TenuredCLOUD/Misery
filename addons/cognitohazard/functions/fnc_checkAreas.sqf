#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Ensures the markers defined exist and are the correct type, if not the cognitohazard system will not function.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Marker check success <BOOL>
 *
 * Example:
 * [] call misery_cognitohazard_fnc_checkZones
*/

// Convert to Array.
if (GVAR(areas) isEqualType "") then {
    GVAR(areas) = parseSimpleArray GVAR(areas);
};

private _failedMarkers = [];

{
    private _marker = _x;
    private _markerShape = markerShape _marker;
    if (_markerShape != "RECTANGLE" && _markerShape != "ELLIPSE") then {
        private _msg = format ["CognitoHazard area marker (%1) is either not an area marker or does not exist, remove it from the list.", _marker];
        [QUOTE(COMPONENT_BEAUTIFIED), _msg] call EFUNC(common,debugMessage);
        _failedMarkers pushBackUnique _marker;
    };
} forEach GVAR(areas);

count _failedMarkers == 0
