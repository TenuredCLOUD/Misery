#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Saline rehydration utilizing ACE medical API
 *
 * Arguments:
 * 0: Volume <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_saline;
 *
*/

params ["_value"];

if (_value > 0.1) then {
    [0.001, "thirst"] call EFUNC(common,addStatusModifier);
};

