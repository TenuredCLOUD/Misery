#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks if player has a detector equipped
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_spectrum_fnc_hasDetector
*/

params ["_object"];

currentWeapon _object in [QUOTE(hgun_esd_01_antenna_01_F), QUOTE(hgun_esd_01_antenna_02_F), QUOTE(hgun_esd_01_antenna_03_F), QUOTE(hgun_esd_01_F)];
