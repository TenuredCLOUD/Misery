#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Starts height tracking PFH monitoring players eye position for height placements
 *
 * Arguments:
 * 0: Object <STRING>
 * 1: Snap to surface <Number>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_trackHeight
 *
*/

params ["_object", "_snapToSurface"];

[{
    params ["_args", "_handle"];
    _args params ["_object", "_snapToSurface"];

    if (isNull _object || GVAR(objectPlacementDone) || GVAR(objectPlacementCancelled)) exitWith {
        GVAR(objectPlacementDone) = nil;
        GVAR(objectPlacementCancelled) = nil;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    private _eyePos = eyePos player;
    private _eyeDir = getCameraViewDirection player;
    private _targetPos = _eyePos vectorAdd (_eyeDir vectorMultiply 3);

    private _intersects = lineIntersectsSurfaces [_eyePos, _targetPos, player, _object, true, 1, "GEOM", "NONE"];
    private _surfacePos = if (count _intersects > 0) then { (_intersects select 0) select 0 } else { _targetPos };

    private _groundPos = [_surfacePos select 0, _surfacePos select 1, getTerrainHeightASL _surfacePos];
    private _height = (_surfacePos select 2) - (_groundPos select 2);
    private _maxHeight = 2;
    private _finalPos = _surfacePos;

    if (_snapToSurface == 1 && _height < 0.1) then {
        _finalPos = [_surfacePos select 0, _surfacePos select 1, _groundPos select 2];
    } else {
        if (_height > _maxHeight) then {
            _finalPos = _groundPos vectorAdd [0, 0, _maxHeight];
        };
    };

    _object setPosASL _finalPos;

}, 0, [_object, _snapToSurface]] call CBA_fnc_addPerFrameHandler;
