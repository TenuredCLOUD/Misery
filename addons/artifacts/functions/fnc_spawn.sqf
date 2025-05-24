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

if (_currentMarker in GVAR(processedMarkers)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Artifacts already generated for %1", _currentMarker]] call EFUNC(common,debugMessage);
};

[_centerPos, _radius] call EFUNC(common,nearBuilding) params ["", "", "_nearBuildings"];

private _buildingPositions = {
    _x buildingPos -1;
} forEach _nearBuildings;

for "_i" from 1 to _numArtifacts do {
    private _useBuilding = random 1 > 0.5;
    private _randomPos = [[_currentMarker] call CBA_fnc_randPosArea, selectRandom _buildingPositions] select _useBuilding;

    private _groundHolder = createVehicle ["WeaponHolderSimulated", _randomPos, [], 0, "CAN_COLLIDE"];

    removeFromRemainsCollector [_groundHolder];

    _groundHolder addItemCargoGlobal [selectRandom [MACRO_ARTIFACTS], 1];

    // Emission system
    private _light = "#lightpoint" createVehicleLocal [0,0,0];
    _light setLightBrightness (0.05 + (selectMax _markerSize * 0.001));
    _light setLightColor [random [0.4, 0.5, 0.6], random [0.4, 0.5, 0.6], random [0.4, 0.5, 0.6]];
    _light lightAttachObject [_groundHolder, [0, 0, 0.5]];
    _groundHolder setVariable [QGVAR(lightEmission), _light];

    // Debug markers
    if (GVAR(debug)) then {
        private _marker = createMarker [format ["Artifact_%1_%2", diag_tickTime, _i], _randomPos];
        _marker setMarkerTypeLocal "hd_dot";
        _marker setMarkerColorLocal (["ColorGreen", "ColorBlue"] select _useBuilding);
        _marker setMarkerText format ["Artifact_%1", ["OUTDOOR", "INDOOR"] select _useBuilding];
    };
};

// Mark marker as processed
GVAR(processedMarkers) pushBackUnique _currentMarker;
