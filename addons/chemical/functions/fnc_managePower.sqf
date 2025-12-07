#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Power manager for chemical detector
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_chemical_fnc_managePower
 *
*/

[{"ChemicalDetector_01_watch_F" in assignedItems player}, {
    [{
        params ["_args", "_handle"];

        if (isGamePaused) exitWith {};

        if !("ChemicalDetector_01_watch_F" in assignedItems player) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
            call FUNC(managePower)
        };

        private _power = player getVariable [QGVAR(detectorPower), MACRO_PLAYER_DEFAULTS_HIGH];

        player setVariable [QGVAR(detectorPower), _power - 0.01];

        if (_power <= 0) then {
            // unlink in-use detector so it's deleted
            player unlinkItem "ChemicalDetector_01_watch_F";
            [player, "ChemicalDetector_01_black_F", true] call CBA_fnc_addItem;
            // reset power value
            player setVariable [QGVAR(detectorPower), MACRO_PLAYER_DEFAULTS_HIGH];
        };
    }, 60, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
