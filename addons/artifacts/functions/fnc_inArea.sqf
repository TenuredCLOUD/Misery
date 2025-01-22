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
        private _isPlayerHandled = _player getVariable [QGVAR(insideArea), false];

        if (!_isPlayerHandled) then {
            private _currentMarker = "";
            {
            if (_player inArea _x && {!(_x in GVAR(processedMarkers))}) exitWith {
            _currentMarker = _x;
            };
            } forEach GVAR(areas);

            if (_currentMarker isNotEqualTo "") then {
                _player setVariable [QGVAR(insideArea), true, true];
                [QGVAR(artifactSpawnEvent), [
                    getMarkerPos _currentMarker,
                    round(linearConversion [0, 500, selectMax (getMarkerSize _currentMarker), 5, 20, true]),
                    selectMax (getMarkerSize _currentMarker),
                    GVAR(debug),
                    getMarkerSize _currentMarker,
                    _currentMarker
                ], _player] call CBA_fnc_targetEvent;
            };
        };
    } forEach (call EFUNC(common,listPlayers));
}, 1] call CBA_fnc_addPerFrameHandler;
