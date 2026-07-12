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

private _buildingPositions = [];

{
    _buildingPositions append (_x buildingPos -1);
} forEach _nearBuildings;

for "_i" from 1 to _numArtifacts do {
    private _useBuilding = [[50] call EFUNC(common,rollChance), false] select (_buildingPositions isEqualTo []);

    private _randomPos = if (_useBuilding) then {
        selectRandom _buildingPositions;
    } else {
        [_currentMarker] call CBA_fnc_randPosArea;
    };

    if (count _randomPos < 3) then {
        _randomPos = [_currentMarker] call CBA_fnc_randPosArea;
        _useBuilding = false;
    };

    private _groundHolder = createVehicle ["WeaponHolderSimulated", _randomPos, [], 0, "CAN_COLLIDE"];

    removeFromRemainsCollector [_groundHolder];

    _groundHolder addItemCargoGlobal [selectRandom [MACRO_ARTIFACTS], 1];

    private _reflectorClass = selectRandom [
        "Reflector_Cone_01_white_F",
        "Reflector_Cone_01_orange_F",
        "Reflector_Cone_01_red_F",
        "Reflector_Cone_01_green_F",
        "Reflector_Cone_01_blue_F"
    ];

    private _light = createVehicle [_reflectorClass, [0, 0, 0], [], 0, "CAN_COLLIDE"];

    _light attachTo [_groundHolder, [0, 0, 0.5]];
    _light setVectorDirAndUp [[0, 0, -1], [0, 1, 0]];

    _groundHolder setVariable [QGVAR(lightEmission), _light, true];

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
publicVariable QGVAR(processedMarkers);
