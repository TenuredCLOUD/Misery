#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Processes fuel pump audio
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_pumpAudio
*/

[{GVAR(pumpingFuel)},
{
    [{
        params ["_args", "_handle"];

        private _audioSource = objNull;

        _audioSource = playSound QEGVAR(audio,sound_gasPumpRunning);

        [_audioSource, _handle] call FUNC(audioLogic);
    }, 30, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
