#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Ensures the markers defined exist and are the correct type, if not the radiation system will not function.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Marker check success <BOOL>
 *
 * Example:
 * [] call misery_radiation_fnc_checkRadZones
*/

// Convert to Array.
if (GVAR(radiationAreas) isEqualType "") then {
    GVAR(radiationAreas) = parseSimpleArray GVAR(radiationAreas);
};

private _failedMarkers = [];

{
    private _marker = _x;
    private _markerShape = markerShape _marker;
    if (_markerShape != "RECTANGLE" && _markerShape != "ELLIPSE") then {
        private _msg = format ["Radiation zone marker (%1) is either not an area marker or does not exist, remove it from the list.", _marker];
        [QUOTE(COMPONENT_BEAUTIFIED), _msg] call EFUNC(common,debugMessage);
        _failedMarkers pushBackUnique _marker;
    };
} forEach GVAR(radiationAreas);

count _failedMarkers == 0
