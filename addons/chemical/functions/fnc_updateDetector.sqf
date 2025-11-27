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

// If chemical zone check fails, system will not function.
if !(call FUNC(checkAreas)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Marker check system failed, detectors disabled."] call EFUNC(common,debugMessage);
};

[{
    params ["_args", "_handle"];

    if (isGamePaused) exitWith {};

    private _players = call EFUNC(common,listPlayers);
    {
        private _player = _x;

        private _maxThreat = 0;
        {
            private _area = _x;
            private _areaPos = getMarkerPos _area;
            private _areaSize = selectMax (getMarkerSize _area);
            private _maxRange = _areaSize + 100;
            private _distance = _player distance _areaPos;

            private _threat = ((1 - (_distance / _maxRange)) max 0) min 1;
            _maxThreat = _maxThreat max _threat;

            _player setVariable [QGVAR(detectedThreat), _maxThreat];
        } forEach GVAR(areas);

        QGVAR(detector) cutRsc ["RscWeaponChemicalDetector", "PLAIN", 1, false];
        private _detectorDisplay = uiNamespace getVariable ["RscWeaponChemicalDetector", displayNull];
        private _threatCtrl = _detectorDisplay displayCtrl 101;

        if (_maxThreat > 0) then {
            _threatCtrl ctrlAnimateModel ["Threat_Level_Source", parseNumber ([_maxThreat, 1, 2, false] call CBA_fnc_formatNumber), true];
        } else {
            _threatCtrl ctrlAnimateModel ["Threat_Level_Source", 0, true];
            _player setVariable [QGVAR(detectedThreat), nil];
        };
    } forEach _players;
}, 0.5, []] call CBA_fnc_addPerFrameHandler;
