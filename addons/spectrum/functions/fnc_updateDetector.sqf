#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks distance to cognito-hazard areas for Spectrum Device processing
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_spectrum_fnc_updateDetector
*/

[{
    params ["_args", "_handle"];

    private _players = call EFUNC(common,listPlayers);
    {
        private _player = _x;

        if !([_player] call FUNC(hasDetector)) then {continue};

        private _frequencyExposure = 0;
        {
            private _area = _x;
            private _areaPos = getMarkerPos _area;
            private _areaSize = selectMax (getMarkerSize _area);
            private _maxRange = _areaSize + 50;
            private _distance = _player distance _areaPos;

            private _threat = ((1 - (_distance / _maxRange)) max 0) min 1;
            _frequencyExposure = _frequencyExposure max _threat;
        } forEach EGVAR(cognito_hazard,areas);

        if (_frequencyExposure > 0) then {
            [QGVAR(setSpectrumValues), [1000, 50 + ((2000 * _frequencyExposure))], _player] call CBA_fnc_targetEvent;
        } else {
            [QGVAR(setSpectrumValues), [0, 0], _player] call CBA_fnc_targetEvent;
        };
    } forEach _players;
}, 0.1, []] call CBA_fnc_addPerFrameHandler;
