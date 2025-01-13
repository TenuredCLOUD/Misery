#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD, MikeMF
 * Check if player has an artifact in their inventory
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Artifact found <BOOL>
 *
 * Example:
 * [] call misery_radiation_fnc_hasArtifact;
 *
*/

if ([[MACRO_ARTIFACTS]] call EFUNC(common,hasItem)) exitWith {true};

false
