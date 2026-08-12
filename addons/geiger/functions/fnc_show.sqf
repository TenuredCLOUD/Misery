#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Opens the Geiger display
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_geiger_fnc_show
 *
*/

if (uiNamespace getVariable [QGVAR(ui_visible), false]) exitWith {};

QGVAR(display) cutRsc [QCLASS(geiger_ui), "PLAIN", 0, false];

uiNamespace setVariable [QGVAR(ui_visible), true];

playSound QEGVAR(audio,sound_geigerOn);

private _displayHandle = [{
    params ["_args", "_handle"];

    if (isGamePaused) exitWith {};

    private _hasGeiger = [[QCLASS(geiger)]] call EFUNC(common,hasItem);
    private _isVisible = uiNamespace getVariable [QGVAR(ui_visible), false];

    if (!_hasGeiger || !_isVisible || !alive ACE_player) exitWith {
        call FUNC(hide);
        _handle call CBA_fnc_removePerFrameHandler;
    };

    private _inRadiationArea = ACE_player getVariable [QEGVAR(radiation,insideArea), false];
    call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "_radiation"];

    private _display = uiNamespace getVariable [QGVAR(ui), objNull];

    if (!isNull _display) then {
        private _textControl = _display displayCtrl 1000;
        private _radReading = format ["%1", [_radiation * 10000, 1, 2, true] call CBA_fnc_formatNumber];
        _textControl ctrlSetText _radReading;
    };

    if (_inRadiationArea || {[[QCLASS(fallout_glass)]] call EFUNC(common,hasItem)}) then {
        private _pitch = 0.8 + (_radiation * 0.8);
        private _volume = 0.5 + (_radiation * 0.5);

        playSoundUI [QCLASS(minedetector_beep_01), _volume, _pitch];
    };
}, 0.5, []] call CBA_fnc_addPerFrameHandler;

uiNamespace setVariable [QGVAR(displayHandle), _displayHandle];
