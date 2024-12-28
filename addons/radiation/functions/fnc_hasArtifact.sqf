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

if ([[
QCLASS(artifact_01),
QCLASS(artifact_02),
QCLASS(artifact_03),
QCLASS(artifact_04),
QCLASS(artifact_05),
QCLASS(artifact_06),
QCLASS(artifact_07),
QCLASS(artifact_08),
QCLASS(artifact_09),
QCLASS(artifact_10)]] call EFUNC(common,hasItem)) then {

_Hasartifact = true;

if (_Hasartifact)exitWith{};

};

_Hasartifact //return
