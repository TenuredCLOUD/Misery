#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Detector alerts
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_chemical_fnc_detectorAlert
*/

[{"ChemicalDetector_01_watch_F" in assignedItems ACE_player}, {
    [{
        params ["_args", "_handle"];

        if (isGamePaused) exitWith {};

        private _threatLevel = ACE_player getVariable [QGVAR(detectedThreat), 0];

        if !("ChemicalDetector_01_watch_F" in assignedItems ACE_player || isNil "_threatLevel") exitWith {
            call FUNC(detectorAlert);
            _handle call CBA_fnc_removePerFrameHandler;
        };

        if (_threatLevel >= 0.05) then {

            private _pitch = 0.8 + (_threatLevel * 0.8);
            private _volume = 0.5 + (_threatLevel * 0.5);

            // Make beeping local audio to prevent network saturation
            playSoundUI ["FD_Start_F", _volume, _pitch];
        };
    }, 0.5] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
