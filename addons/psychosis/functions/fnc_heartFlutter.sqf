#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Audible heart beat & increase in BP due to psychosis state
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

        call EFUNC(protection,totalProtection) params ["", "_scba"];

        if (!GVAR(terrifiedState) || !alive player) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
            call FUNC(heartFlutter);
        };

        if ([50] call EFUNC(common,rollChance)) then {
            playSound selectRandom [MACRO_PSYCHOSIS_HEARTFLUTTER];
        };

        if (_scba < 1 && [50] call EFUNC(common,rollChance)) then {
            playSound selectRandom [MACRO_PSYCHOSIS_BREATH];
        };

        [player, QUOTE(psychosisEffect), 2, 2, 15, 0, 15, 1] call ace_medical_status_fnc_addMedicationAdjustment;
    }, 5, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
