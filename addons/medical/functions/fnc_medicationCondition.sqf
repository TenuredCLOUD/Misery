#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Medicine condition utilizing ACE medical API
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * 0: BOOL
 *
 * Example:
 * [] call misery_medical_fnc_medicationCondition;
 *
*/

params ["_medic", "_patient"];

([_patient] call EFUNC(protection,totalProtection)) params ["_gasMask", "_scba"];

if (_gasMask > 0 || _scba > 0) exitWith { false };

true
