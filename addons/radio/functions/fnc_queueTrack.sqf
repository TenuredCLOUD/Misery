#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Radio track queue
 *
 * Arguments:
 * 0: Data entry <ARRAY>
 *     0: Track Class <CLASSNAME>
 *     1: Duration <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_radio_fnc_queueTrack;
 *
*/

params ["_trkEntry"];

private _trkName = _trkEntry select 0;
private _duration = _trkEntry select 1;

// Flush sound sources
{
    deleteVehicle _x;
} forEach GVAR(allRadioSounds);

GVAR(allRadioSounds) = [];
publicVariable QGVAR(allRadioSounds);

{

    private _soundSource = createVehicle ["Land_HelipadEmpty_F", getPosASL _x, [], 0, "CAN_COLLIDE"];
    _soundSource attachTo [_x, [0, 0, 0]];
    GVAR(allRadioSounds) pushBack _soundSource;
    [_soundSource, [_trkName, 150]] remoteExec ["say3D", 0, _soundSource];
} forEach GVAR(allRadios);

publicVariable QGVAR(allRadioSounds);

[{
    call FUNC(queueTrack);
}, [selectRandom GVAR(radioTracks)], _duration + 10] call CBA_fnc_waitAndExecute;
