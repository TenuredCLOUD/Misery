#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Updates EM readings for spectrum GUI utilizing API
 * Applies values randomly for fluctuation in readings (stacks x10 randomized frequencies)
 *
 * Arguments:
 * 0: Frequency <NUMBER>
 * 1: Strength <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_spectrum_fnc_updateReadings
*/

params ["_frequency", "_strength"];

missionNamespace setVariable ["#EM_Values", [random _frequency, random _strength, random _frequency, random _strength, random _frequency, random _strength, random _frequency, random _strength, random _frequency, random _strength, random _frequency, random _strength, random _frequency, random _strength, random _frequency, random _strength, random _frequency, random _strength, random _frequency, random _strength], false];
