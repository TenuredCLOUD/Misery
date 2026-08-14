#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks distance to each area for detector processing
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_chemical_fnc_updateDetector
*/

[{"ChemicalDetector_01_watch_F" in assignedItems ACE_player}, {
    [{
        params ["_args", "_handle"];

        if (isGamePaused) exitWith {};

        if (!alive ACE_player || !("ChemicalDetector_01_watch_F" in assignedItems ACE_player)) exitWith {
            call FUNC(updateDetector);
            _handle call CBA_fnc_removePerFrameHandler;
        };

        private _maxThreat = 0;

        {
            private _area = _x;
            private _areaPos = getMarkerPos _area;
            private _areaSize = selectMax (getMarkerSize _area);
            private _maxRange = _areaSize + 100;
            private _distance = ACE_player distance _areaPos;

            private _threat = ((1 - (_distance / _maxRange)) max 0) min 1;
            _maxThreat = _maxThreat max _threat;

            ACE_player setVariable [QGVAR(detectedThreat), _maxThreat];
        } forEach GVAR(areasCached);

        QGVAR(detector) cutRsc ["RscWeaponChemicalDetector", "PLAIN", 1, false];

        private _detectorDisplay = uiNamespace getVariable ["RscWeaponChemicalDetector", displayNull];
        private _threatCtrl = _detectorDisplay displayCtrl 101;

        if (_maxThreat > 0) then {
            _threatCtrl ctrlAnimateModel ["Threat_Level_Source", parseNumber ([_maxThreat, 1, 2, false] call CBA_fnc_formatNumber), true];
        } else {
            _threatCtrl ctrlAnimateModel ["Threat_Level_Source", 0, true];
            ACE_player setVariable [QGVAR(detectedThreat), nil];
        };
    }, 0.5, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
