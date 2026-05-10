#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Withdrawal simulation utilizing ACE medical API
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Medication Class <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_withdrawal;
 *
*/

params ["_patient", "_className"];

if (_patient getVariable [format ["%1_withdrawalQueued", _className], false]) exitWith {};

_patient setVariable [format ["%1_withdrawalQueued", _className], true];

[{
    params ["_patient", "_className"];

    private _activeMeds = [_patient, false] call ACEFUNC(medical_status,getAllMedicationCount);

    private _index = _activeMeds findIf { toLower(_x select 0) isEqualTo toLower(_className) };

    (_index isEqualTo -1)
},{
    params ["_patient", "_className"];

    _patient setVariable [format ["%1_withdrawalQueued", _className], false];

    if !(isMultiplayer) then {
        [0.1, "energy"] call EFUNC(common,addStatusModifier);
    };

    [-0.1, "hunger"] call EFUNC(common,addStatusModifier);

    if !(_patient getVariable [QGVAR(tremor), false]) then {
        [_patient, 120] call FUNC(tremor);
    };
},[_patient, _className]] call CBA_fnc_waitUntilAndExecute;
