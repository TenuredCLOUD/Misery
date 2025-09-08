#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Artifact storage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_radiation_fnc_storeArtifact;
 *
*/

private _artifacts = [MACRO_ARTIFACTS];

if !([[QCLASS(leadContainer_Open)]] call EFUNC(common,hasItem)) exitWith {};

if ([_artifacts] call EFUNC(common,hasItem)) then {
    private _index = EGVAR(common,itemsCache) findIf {_x in _artifacts};
    private _artifact = EGVAR(common,itemsCache) select _index;

    player removeItem _artifact;
    player removeItem QCLASS(leadContainer_Open);
    player addItem QCLASS(leadContainer_Closed);
    [QEGVAR(common,tileText), "You put the artifact in your lead lined container"] call CBA_fnc_localEvent;
};
