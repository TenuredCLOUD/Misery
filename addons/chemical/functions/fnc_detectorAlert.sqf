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

// If chemical zone check fails, system will not function.
if !(call FUNC(checkAreas)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Marker check system failed, alerts disabled."] call EFUNC(common,debugMessage);
};

[{"ChemicalDetector_01_watch_F" in assignedItems player}, {
    [{
        params ["_args", "_handle"];

        private _threatLevel = player getVariable [QGVAR(detectedThreat), 0];

        if !("ChemicalDetector_01_watch_F" in assignedItems player || isNil "_threatLevel") exitWith {
            call FUNC(detectorAlert);
            _handle call CBA_fnc_removePerFrameHandler;
        };

        if (_threatLevel >= 0.05) then {
           playSound "FD_Start_F";
        };
    }, 0.5] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
