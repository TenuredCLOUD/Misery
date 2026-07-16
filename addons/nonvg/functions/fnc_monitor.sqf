#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * No nightvision when in TPP (Third person)
 * Enforces player to disable NVG's when in third person
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_nonvg_fnc_monitor;
 *
*/

ACE_player addEventHandler ["VisionModeChanged", {
    params ["_player", "_visionMode", "_tiIndex", "_previousVisionMode", "_previousTiIndex", "_vehicle", "_turret"];

    if (_visionMode isEqualTo 0) exitWith {};
    if (cameraView isEqualTo "INTERNAL") exitWith {};

    if (cameraView isEqualTo "EXTERNAL") then {
        ACE_player action ["nvGogglesOff", ACE_player];
    };

}];

GVAR(viewHandle) = addUserActionEventHandler ["personView", "Activate", {
    if (isNull objectParent ACE_player && cameraView isEqualTo "INTERNAL" && currentVisionMode ACE_player > 0) then {
        ACE_player action ["nvGogglesOff", ACE_player];
    };
}];
