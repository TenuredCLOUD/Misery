#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Artifact spawner
 *
 * Arguments:
 * 0: Center Position <POSITION>
 * 1: Artifact Number <NUMBER>
 * 2: Radius <NUMBER>
 * 3: Marker Size <NUMBER>
 * 4: Current Marker <MARKER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_artifacts_fnc_spawn;
 *
 * Public: No
*/

params ["_centerPos", "_numArtifacts", "_radius", "_markerSize", "_currentMarker"];

if (!isServer) exitWith {};

if (_currentMarker in GVAR(processedMarkers)) exitWith {};

for "_i" from 1 to _numArtifacts do {
    private _randomPos = [_currentMarker] call CBA_fnc_randPosArea;

    private _positionLogic = createVehicle ["ACE_LogicDummy", _randomPos, [], 0, "CAN_COLLIDE"];

    // Make sure spawns are uncovered / outside positions only
    if !([_positionLogic, 20] call EFUNC(common,hasOverheadCover)) then {
        private _detectorProxy = createVehicle [QCLASS(detectorProxy), _randomPos, [], 0, "CAN_COLLIDE"];
        private _logicNode = createVehicle ["ACE_LogicDummy", _randomPos, [], 0, "CAN_COLLIDE"];

        _logicNode setPosATL _randomPos;

        _logicNode setVariable [QGVAR(detectorProxy), _detectorProxy, true];

        private _jipID = [QGVAR(setupExcavationNode), [_logicNode]] call CBA_fnc_globalEventJIP;
        _logicNode setVariable [QGVAR(nodeJipID), _jipID, true];

        if (GVAR(debug) && {!isNull _logicNode}) then {
            private _markerID = format ["%1", _randomPos];
            private _debugMarker = createMarker [_markerID, getPosATL _logicNode];
            _debugMarker setMarkerShapeLocal "ICON";
            _debugMarker setMarkerTypeLocal "hd_dot";
            _debugMarker setMarkerColorLocal "ColorRed";
            _debugMarker setMarkerText format ["artifact_%1", _markerID];
        };
    };
};

GVAR(processedMarkers) pushBackUnique _currentMarker;
publicVariable QGVAR(processedMarkers);
