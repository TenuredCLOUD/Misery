#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks if players are inside a dead zone area
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_dead_zone_fnc_inArea
*/

if !(call FUNC(checkAreas)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Marker check system failed, system disabled."] call EFUNC(common,debugMessage);
};

[{
    params ["_args", "_handle"];

    {
        private _zone = _x;
        private _targets = (call EFUNC(common,listPlayers)) select { _x inArea _zone && {alive _x}};

        if (_targets isNotEqualTo []) then {

            private _playerPos = getPos (selectRandom _targets);
            private _scatterPos = _playerPos vectorAdd [random [-20, 0, 20], random [-20, 0, 20], 0];

            [
                _scatterPos,
                selectRandom GVAR(shellTypes),
                GVAR(radius),
                GVAR(density),
                0
            ] call BIS_fnc_fireSupportVirtual;

            [QUOTE(COMPONENT_BEAUTIFIED), format ["Dead Zone %1 engaged %2 targets.", _zone, count _targets]] call EFUNC(common,debugMessage);
        };
    } forEach GVAR(areas);
}, GVAR(barrageDelay)] call CBA_fnc_addPerFrameHandler;
