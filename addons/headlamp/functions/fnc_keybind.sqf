#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD, MikeMF
 * Keybind toggle for Headlamp
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_headlamp_fnc_keybind
 *
*/

private _text = "";

private _hasOn = [QCLASS(headlamp_On)] call EFUNC(common,hasItem);
private _hasOff = [QCLASS(headlamp_Off)] call EFUNC(common,hasItem);

if (_hasOff) then {
    if (isNil {_player getVariable QCLASS(headlampStatus)}) then {
    [[QCLASS(headlamp_Off)], [QCLASS(headlamp_On)]] call EFUNC(common,switchMagazine);

    private _headlamp = "#lightpoint" createVehicle position _player;
    _headlamp setLightBrightness 0.15; // Set brightness
    _headlamp setLightColor [1, 1, 1]; // Set color to white
    _headlamp setLightAmbient [1, 1, 1]; // Set ambient light color to white
    _headlamp setLightAttenuation [0.5, 0, 0, 1]; // Set attenuation
    _headlamp attachTo [_player, [0,0,0], "pilot"];
    _headlamp setDir (direction _player);
    _player setVariable [QCLASS(headlampStatus), _headlamp, true];
    };
};

if (_hasOn) then {
    if (!isNil {_player getVariable QCLASS(headlampStatus)}) then {
    private _headlamp = _player getVariable QCLASS(headlampStatus);
    deleteVehicle _headlamp;

    [[QCLASS(headlamp_On)], [QCLASS(headlamp_Off)]] call EFUNC(common,switchMagazine);

    _player setVariable [QCLASS(headlampStatus), nil, true];

    //Fixes reloader issues:
} else {
[[QCLASS(headlamp_On)], [QCLASS(headlamp_Off)]] call EFUNC(common,switchMagazine);
    };
};

if !(_hasOn && _hasOff) then {
    _text = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONHEADLAMPNOITEM"];
};

[parseText _text, true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
