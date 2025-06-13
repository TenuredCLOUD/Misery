#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Terminates audio loop when no longer allowed
 *
 * Arguments:
 * 0: Source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_spectrum_fnc_audioLogic
*/

params ["_audioSource", "_logicHandle"];

[{
    params ["_args", "_handle"];
    _args params ["_audioSource", "_logicHandle"];

    if (!([player] call FUNC(hasDetector)) || !alive player) exitWith {
        if !(isNull _audioSource) then {
            deleteVehicle _audioSource;
            if (!isNil "_logicHandle") then {
                _logicHandle call CBA_fnc_removePerFrameHandler;
            };
            call FUNC(detectorAudio);
        };
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 1, [_audioSource, _logicHandle]] call CBA_fnc_addPerFrameHandler;

