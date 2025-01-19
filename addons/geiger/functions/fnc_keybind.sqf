#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD, MikeMF
 * Keybind toggle for Geiger
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_geiger_fnc_keybind
 *
*/

private _text = "";

private _hasOn = [QCLASS(geiger_On)] call EFUNC(common,hasItem);
private _hasOff = [QCLASS(geiger_Off)] call EFUNC(common,hasItem);

if (_hasOff) then {
    _text = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONGEIGERBOOTUP"];
    playSound QEGVAR(audio,sound_geigerOff);
    [[QCLASS(geiger_Off)], [QCLASS(geiger_On)]] call EFUNC(common,switchMagazine);
};

if (_hasOn) then {
    _text = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONGEIGERTURNOFF"];
    playSound QEGVAR(audio,sound_geigerOn);
    [[QCLASS(geiger_On)], [QCLASS(geiger_Off)]] call EFUNC(common,switchMagazine);
};

if !(_hasOn && _hasOff) then {
    _text = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONGEIGERNOITEM"];
};

[parseText _text, true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
