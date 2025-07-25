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

player addEventHandler ["VisionModeChanged", {
    params ["_player", "_visionMode", "_tiIndex", "_previousVisionMode", "_previousTiIndex", "_vehicle", "_turret"];

    private _cameraView = cameraView;

    if (_visionMode isEqualTo 0) exitWith {};
    if (_cameraView isEqualTo "INTERNAL") exitWith {};

    if (_cameraView isEqualTo "EXTERNAL") then {
        player action ["nvGogglesOff", player];
    };

}];

