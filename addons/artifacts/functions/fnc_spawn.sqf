#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Artifact spawner
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_artifacts_fnc_spawn;
 *
 * Public: No
*/

params ["_centerPos", "_numArtifacts", "_radius", "_enableDebug", "_markerSize", "_currentMarker"];

if (!isServer) exitWith {};

if (_currentMarker in GVAR(processedMarkers)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Artifacts already generated for %1", _currentMarker]] call EFUNC(common,debugMessage);
};

private _artifacts = [MACRO_ARTIFACTS];
private _holderArray = [];

// Get building positions
private _buildingPositions = [];
{
    _buildingPositions append ([_x] call BIS_fnc_buildingPositions);
} forEach (nearestObjects [_centerPos, ["House", "Building"], _radius, true] select {
    count ([_x] call BIS_fnc_buildingPositions) > 0
});

for "_i" from 1 to _numArtifacts do {
    private _useBuilding = (count _buildingPositions > 0 && {random 1 < 0.5});
    private _randomPos = if (_useBuilding) then {
        selectRandom _buildingPositions
    } else {
        [_currentMarker] call CBA_fnc_randPosArea
    };

    // Position validation
    if (isNil "_randomPos" || {!(_randomPos inArea _currentMarker)}) then {
        [QUOTE(COMPONENT_BEAUTIFIED), format ["Invalid position for artifact %1", _i]] call EFUNC(common,debugMessage);
        continue;
    };

    // Calculate final position
    private _finalPos = if (_useBuilding) then {
        // Building position adjustment
        private _buildingPosASL = AGLToASL _randomPos;
        private _raycastResult = lineIntersectsSurfaces [
            _buildingPosASL vectorAdd [0, 0, 1],
            _buildingPosASL vectorAdd [0, 0, -3],
            objNull, objNull, true, 1, "GEOM", "FIRE", false
        ];

        if (_raycastResult isNotEqualTo []) then {
            (_raycastResult select 0 select 0) vectorAdd [0,0,0.005] // Offset
        } else {
            // Fallback
            _buildingPosASL vectorAdd [0,0,0.005]
        };
    } else {
        // Outdoor position adjustment
        private _surfacePos = AGLToASL _randomPos;
        private _raycastResult = lineIntersectsSurfaces [
            _surfacePos vectorAdd [0,0,2],
            _surfacePos vectorAdd [0,0,-3],
            objNull, objNull, true, 1, "GEOM", "FIRE", true
        ];

        if (_raycastResult isNotEqualTo []) then {
            (_raycastResult select 0 select 0) vectorAdd [0,0,0.005]
        } else {
            // Terrain fallback
            ASLToAGL [_surfacePos select 0, _surfacePos select 1, getTerrainHeightASL _surfacePos]
        };
    };

    // Create holder
    private _holder = createVehicle ["GroundWeaponHolder_Scripted", [0,0,0], [], 0, "CAN_COLLIDE"];
    removeFromRemainsCollector [_holder];

    // Set final position
    _holder setPosASL _finalPos;
    _holder setVectorUp (surfaceNormal _finalPos);

    _holder addItemCargoGlobal [selectRandom _artifacts, 1];

    // Emission system
    private _light = "#lightpoint" createVehicle [0,0,0];
    _light setLightBrightness (0.05 + (selectMax _markerSize * 0.001));
    _light setLightColor [random [0.4,0.5,0.6], random [0.4,0.5,0.6], random [0.4,0.5,0.6]];
    _light lightAttachObject [_holder, [0,0,0.5]];
    _holder setVariable [QGVAR(lightEmission), _light];

    // Debug markers
    if (_enableDebug) then {
        private _marker = createMarker [format ["Artifact_%1_%2", diag_tickTime, _i], ASLToAGL _finalPos];
        _marker setMarkerTypeLocal "hd_dot";
        _marker setMarkerColorLocal (["ColorGreen","ColorBlue"] select _useBuilding);
        _marker setMarkerText format ["Artifact_%1", ["OUTDOOR","INDOOR"] select _useBuilding];
    };

    _holderArray pushBack _holder;
};

// Mark marker as processed
GVAR(processedMarkers) pushBackUnique _currentMarker;
