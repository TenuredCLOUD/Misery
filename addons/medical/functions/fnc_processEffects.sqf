#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Medication processor utilizing ACE medical API
 * Handles Misery medication effects, as well as ACE saline rehydration
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_processEffects;
 *
*/

[{

    if (!alive player) exitWith {};

    if (isGamePaused) exitWith {};

    private _activeMeds = [player] call ACEFUNC(medical_status,getAllMedicationCount);
    private _activeIVs = player call ACEFUNC(medical,getIVs);

    if (_activeMeds isEqualTo [] && _activeIVs isEqualTo []) exitWith {};

    {
        _x params ["_className", "_dose", "_effectiveness"];

        private _index = MACRO_MEDICATION_REGISTRY findIf { toLower(_x select 0) isEqualTo toLower(_className) };

        if (_index isNotEqualTo -1) then {
            private _functionName = (MACRO_MEDICATION_REGISTRY select _index) select 1;

            // Grab function through missionNamespace data
            private _function = missionNamespace getVariable [_functionName, nil];

            [_effectiveness] call _function;
        };

    } forEach _activeMeds;

    {
        _x params ["_volume", "", "", "", "", "_ivClass"];

        private _index = MACRO_MEDICATION_REGISTRY findIf { toLower(_x select 0) isEqualTo toLower(_ivClass) };

        if (_index isNotEqualTo -1) then {
            private _functionName = (MACRO_MEDICATION_REGISTRY select _index) select 1;

            // Grab function through missionNamespace data
            private _function = missionNamespace getVariable [_functionName, nil];

            [_volume] call _function;
        };

    } forEach _activeIVs;
}, 1, []] call CBA_fnc_addPerFrameHandler;
