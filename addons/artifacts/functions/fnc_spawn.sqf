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

    _randomPos set [2, 0];

    // Ensure position is outdoors (no roofs or nearby building geometry)
    private _eyePos = _randomPos;

    _eyePos set [2, (_eyePos select 2) + 0.2];

    private _roofPos = _randomPos;

    _roofPos set [2, (_roofPos select 2) + 30];

    private _underRoof = lineIntersects [_eyePos, _roofPos];

    private _nearBuildings = nearestObjects [_randomPos, ["House", "Building"], 6];

    if (!_underRoof && {_nearBuildings isEqualTo []}) then {

        private _detectorProxy = createVehicle [QCLASS(detectorProxy), _randomPos, [], 0, "CAN_COLLIDE"];

        private _logicNode = createVehicle ["ACE_LogicDummy", _randomPos, [], 0, "CAN_COLLIDE"];

        _logicNode setPosATL _randomPos;

        _logicNode setVariable [QGVAR(detectorProxy), _detectorProxy, true];

        private _jipID = [QGVAR(setupExcavationNode), [_logicNode]] call CBA_fnc_globalEventJIP;
        _logicNode setVariable [QGVAR(nodeJipID), _jipID, true];
    };
};

GVAR(processedMarkers) pushBackUnique _currentMarker;
publicVariable QGVAR(processedMarkers);
