#include "script_component.hpp"

if !(hasInterface) exitWith {};

if (GVAR(enabled)) then {

    [] call ACEFUNC(common,player) params ["_player"];

    _player addEventHandler ["VisionModeChanged", {
        params ["_player", "_visionMode", "_tiIndex", "_previousVisionMode", "_previousTiIndex", "_vehicle", "_turret"];

        if (_visionMode isEqualTo 0) exitWith {};
        if (cameraView isEqualTo "INTERNAL") exitWith {};

        if (cameraView isEqualTo "EXTERNAL") then {
            _player action ["nvGogglesOff", _player];
        };

    }];

    GVAR(viewHandle) = addUserActionEventHandler ["personView", "Activate", {
        [] call ACEFUNC(common,player) params ["_player"];

        if (isNull objectParent _player && cameraView isEqualTo "INTERNAL" && currentVisionMode _player > 0) then {
            _player action ["nvGogglesOff", _player];
        };
    }];
};
