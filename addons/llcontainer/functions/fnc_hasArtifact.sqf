#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Check if player has an artifact in thier inventory
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Artifact found <BOOL>
 *
 * Example:
 * [] call misery_llcontainer_fnc_hasArtifact;
 *
*/

private _Hasartifact = false;

private _check_items = items player;

if ([["Misery_artifact01",
"Misery_artifact02",
"Misery_artifact03",
"Misery_artifact04",
"Misery_artifact05",
"Misery_artifact06",
"Misery_artifact07",
"Misery_artifact08",
"Misery_artifact09",
"Misery_artifact10"]] call EFUNC(common,hasItem)) then {

_Hasartifact = true;

if (_Hasartifact)exitWith{};

};

_Hasartifact //return
