#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Medicine animation processing utilizing ACE medical API
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

params ["_medic", "_patient", "", "_classname", "", ""];

private _index = MACRO_MEDICATION_ANIMATIONS findIf { toLower(_x select 0) isEqualTo toLower(_className) };

if (_index isNotEqualTo -1) then {
    private _entry = MACRO_MEDICATION_ANIMATIONS select _index;
    _entry params ["", "_animation"];

    if (_patient isEqualTo _medic) then {
        if (isClass (configFile >> "CfgMovesMaleSdr" >> "States" >> _animation)) then {
            _patient switchMove _animation;
        } else {
            _patient switchGesture _animation;
        };
    };
};
