#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Returns items attached to handgun
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * 0: Array of Strings <ARRAY>
 *     0: Silencer <STRING>
 *     1: laserpointer/flashlight <STRING>
 *     2: optics <STRING>
 *     3: bipod <STRING>
 *
 * Example:
 * [] call misery_common_fnc_handgunAttachments
 *
*/

params ["_object"];

[(handgunItems _object) select 0, (handgunItems _object) select 1, (handgunItems _object) select 2, (handgunItems _object) select 3];
