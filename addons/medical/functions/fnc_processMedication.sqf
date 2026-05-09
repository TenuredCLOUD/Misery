#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Medicine event logging & Processing utilizing ACE medical API
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 * 4: Item User (not used) <OBJECT>
 * 5: Used Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_processMedication;
 *
*/

params ["_medic", "_patient", "_bodyPart", "_classname", "", "_usedItem"];

if ([_className, "CfgMagazines"] call EFUNC(common,configCheck)) then {
    [_className] call EFUNC(common,itemDecrement);
};

[_patient, [_className] call EFUNC(common,getItemData) select 0] call ACEFUNC(medical_treatment,addToTriageCard);

[_patient, "activity", "%1 used %2", [[_medic, false, true] call ACEFUNC(common,getName), [_className] call EFUNC(common,getItemData) select 0]] call ACEFUNC(medical_treatment,addToLog);

// [QACEGVAR(medical_treatment,medicationLocal), [_patient, _bodyPart, _classname], _patient] call CBA_fnc_targetEvent;

private _index = MACRO_MEDICATION_REGISTRY findIf { toLower(_x select 0) isEqualTo toLower(_className) };

if (_index isNotEqualTo -1) then {
    private _entry = MACRO_MEDICATION_REGISTRY select _index;
    _entry params ["", "", "_timeInSystem", "_duration", "_hrAdjust", "_painAdjust", "_flowAdjust", "_doseValue"];

    [_patient, _className, _timeInSystem, _duration, _hrAdjust, _painAdjust, _flowAdjust, _doseValue] call ACEFUNC(medical_status,addMedicationAdjustment);

    if (_className in [MACRO_MEDICATION_STRONG]) then {
        [15, 2] call EFUNC(common,chromaticEffect);
        [_patient, _className] call FUNC(withdrawal);
    };
};
