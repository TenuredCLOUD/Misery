#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Headlamp Usage (Turning on)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_headlamp_fnc_on
 *
*/

private _player = _this select 0;

if (isNil {_player getVariable QCLASS(headlampStatus)}) then {

_player removeItem QCLASS(headlamp_Off);
_player addItem QCLASS(headlamp_On);

private _headlamp = "#lightpoint" createVehicle position _player;
_headlamp setLightBrightness 0.15; // Set brightness
_headlamp setLightColor [1, 1, 1]; // Set color to white
_headlamp setLightAmbient [1, 1, 1]; // Set ambient light color to white
_headlamp setLightAttenuation [0.5, 0, 0, 1]; // Set attenuation

_headlamp attachTo [_player, [0,0,0], "pilot"];
_headlamp setDir (direction _player);

_player setVariable [QCLASS(headlampStatus), _headlamp, true];
};
