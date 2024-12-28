#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Artifact storage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_llcontainer_fnc_storeArtifact;
 *
*/

if (alive player) then {
    private _artifact = "";
    private _artifacts = [
        QCLASS(artifact_01),
        QCLASS(artifact_02),
        QCLASS(artifact_03),
        QCLASS(artifact_04),
        QCLASS(artifact_05),
        QCLASS(artifact_06),
        QCLASS(artifact_07),
        QCLASS(artifact_08),
        QCLASS(artifact_09),
        QCLASS(artifact_10)
    ];

    {
        if (_x in items player && [[QCLASS(leadContainer_Open)]] call EFUNC(common,hasItem)) exitWith {
            _artifact = _x;
        };
    } forEach _artifacts;

    if (_artifact != "") then {
        player removeItem _artifact;
        player removeItem QCLASS(leadContainer_Open);
        player addItem QCLASS(leadContainer_Closed);
        titleText ["You put the artifact in your lead lined container", "PLAIN DOWN"];
    };
};

