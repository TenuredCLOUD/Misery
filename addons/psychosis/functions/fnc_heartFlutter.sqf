#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Audible heart beat
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_psychosis_fnc_heartFlutter
 *
*/

[{GVAR(terrifiedState)}, {
    [{
        params ["_args", "_handle"];

        if (isGamePaused) exitWith {};

        [ACE_player] call EFUNC(protection,totalProtection) params ["", "_scba"];

        if (!GVAR(terrifiedState) || !alive ACE_player) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
            call FUNC(heartFlutter);
        };

        if ([50] call EFUNC(common,rollChance)) then {
            playSound selectRandom [MACRO_PSYCHOSIS_HEARTFLUTTER];
        };

        if (_scba < 1 && [50] call EFUNC(common,rollChance)) then {
            playSound selectRandom [MACRO_PSYCHOSIS_BREATH];
        };
    }, 5, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
