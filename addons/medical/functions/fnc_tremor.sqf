#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Tremors
 * Adds a subtle camera shake effect simulating uncontrollable shaking
 * Also adds trackable var for ailment effect
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Duration <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 60] call misery_medical_fnc_tremor;
 *
*/

params ["_unit", "_duration"];

enableCamShake true;
addCamShake [0.5, _duration, 10];

_unit setVariable [QGVAR(tremor), true];

// reset tremors ailment
[{
    params ["_unit"];

    _unit setVariable [QGVAR(tremor), false];
}, [_unit], _duration] call CBA_fnc_waitAndExecute;
