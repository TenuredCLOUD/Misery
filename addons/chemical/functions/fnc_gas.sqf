#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Adds contamination gas within a marker's radius for local effect, runs indefinitely.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_chemical_fnc_gas
 */

// cancel particlesource creation if no color values "invisible gas"
if (GVAR(initialColor) isEqualTo [0, 0, 0, 0] && GVAR(finalColor) isEqualTo [0, 0, 0, 0]) exitWith {};

{
private _marker = _x;
private _markerSize = selectMax (getMarkerSize _x);
private _position = getMarkerPos _x;
private _fog1 = "#particlesource" createVehicleLocal _position;
private _fog2 = "#particlesource" createVehicleLocal _position;
private _fog3 = "#particlesource" createVehicleLocal _position;

{
    _x setParticleParams [
    ["\A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 12, 13, 0], "", "Billboard", 1, 10,
    [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0,
    [7, 6], [GVAR(initialColor), GVAR(finalColor)], [1000], 1, 0, "", "", _x];
    _x setParticleRandom [4, [_markerSize, _markerSize, 0.2], [0, 0, -0.1], 2, 1, [0, 0, 0, 0.1], 0, 0];
    _x setParticleCircle [_markerSize, [0, 0, -0.12]];
    _x setDropInterval 0.035;
} forEach [_fog1, _fog2, _fog3];

} forEach GVAR(areas);
