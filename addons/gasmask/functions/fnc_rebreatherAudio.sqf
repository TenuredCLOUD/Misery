#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Rebreather audio loop
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_gasmask_fnc_rebreatherAudio
 *
*/

[{
    params ["_args", "_handle"];
    _args params ["_lastBreathTime"];

    if (isGamePaused) exitWith {};

    call EFUNC(protection,totalProtection) params ["", "_scba"];

    if (!isNil "ace_advanced_fatigue_enabled" && {ace_advanced_fatigue_enabled}) exitWith {}; // Kill audible breath if ACE advanced fatigue is enabled

    if (_scba < 1) exitWith {};

    private _breathDelay = linearConversion [0, 1, getFatigue player, 10, 3, true];

    if (CBA_missionTime - _lastBreathTime >= _breathDelay) then {
        private _pitch = 0.8 + random 0.1 + getFatigue player;
        player say3D [QEGVAR(audio,sound_gasmaskBreathing), 10, _pitch];

        _args set [0, CBA_missionTime];

        [QUOTE(COMPONENT_BEAUTIFIED), format ["Gasmask Breath: Delay %1s | Fatigue %2%3 | Pitch %4", round(_breathDelay), round(getFatigue player * 100), "%", round(_pitch * 100)/100]] call EFUNC(common,debugMessage);
    };
}, 0.5, [CBA_missionTime - 5]] call CBA_fnc_addPerFrameHandler;

