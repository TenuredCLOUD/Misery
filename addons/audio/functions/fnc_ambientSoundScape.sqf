#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles ambient environment sounds
 *
 * Arguments:
 * Previous Sound Source <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fnc_audio_ambientSoundScape
*/

params [["_oldSoundSource", objNull]];

// delete old sound dummy.
if (!isNull _oldSoundSource) then {
    deleteVehicle _oldSoundSource;
};

// Exit if no sounds defined, will end the loop.
if (GVAR(ambientSoundScapeExtras) isEqualTo []) exitWith {};

private _dummyPosition = player getPos [(30 + random 70), random 360];
private _soundDummy = createVehicle ["Land_HelipadEmpty_F", _dummyPosition, [], 0, "CAN_COLLIDE"];

private _sound = selectRandom GVAR(ambientSoundScapeExtras);

[QGVAR(say3D), [_soundDummy, _sound]] call CBA_fnc_globalEvent;

// Loop sound
[{
    _this call FUNC(ambientSoundScape);
}, _soundDummy, 10] call CBA_fnc_waitAndExecute;
