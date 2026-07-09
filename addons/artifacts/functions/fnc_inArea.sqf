#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Checks if players are inside a artifact spawning area.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_artifacts_fnc_inArea
*/

// If artifact area check fails, system will not function.
if !(call FUNC(checkAreas)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Marker check system failed"] call EFUNC(common,debugMessage);
};

[{
    params ["_args", "_handle"];
    {
        private _player = _x;
        private _currentTrackingMarker = _player getVariable [QGVAR(insideArea), ""];

        private _markerPlayerIsInside = "";
        {
            if (_player inArea _x) exitWith {
                _markerPlayerIsInside = _x;
            };
        } forEach GVAR(areas);

        if (_markerPlayerIsInside isEqualTo "" && _currentTrackingMarker isNotEqualTo "") then {
            _player setVariable [QGVAR(insideArea), "", true];
        };

        if (_markerPlayerIsInside isNotEqualTo "" && {_markerPlayerIsInside isNotEqualTo _currentTrackingMarker}) then {

            _player setVariable [QGVAR(insideArea), _markerPlayerIsInside, true];

            if !(_markerPlayerIsInside in GVAR(processedMarkers)) then {
                [QGVAR(artifactSpawnEvent), [
                    getMarkerPos _markerPlayerIsInside,
                    round(linearConversion [0, 500, selectMax (getMarkerSize _markerPlayerIsInside), 5, 20, true]),
                    selectMax (getMarkerSize _markerPlayerIsInside),
                    getMarkerSize _markerPlayerIsInside,
                    _markerPlayerIsInside
                ]] call CBA_fnc_globalEvent;
            };
        };
    } forEach (call EFUNC(common,listPlayers));
}, 1] call CBA_fnc_addPerFrameHandler;
