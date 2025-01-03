#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Checks if players are inside a radiation zone.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_radiation_fnc_playersInRadZones
*/

// If radiation zone check fails, system will not function.
if !(call FUNC(checkRadZones)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Marker check system failed, system disabled."] call EFUNC(common,debugMessage);
};

[{
    params ["_args", "_handle"];

    private _players = call EFUNC(common,listPlayers);
    {
        private _player = _x;
        private _isPlayerHandled = _player getVariable [QGVAR(insideRadZone), false];

        if (!_isPlayerHandled) then {
            private _isInsideZone = GVAR(radiationAreas) findIf {_player inArea _x} != -1;

            if (_isInsideZone) then {
                _player setVariable [QGVAR(insideRadZone), true, true];
                [QGVAR(playerRadZoneEvent), [], _player] call CBA_fnc_targetEvent;
            };
        };
    } forEach _players;
}, 1] call CBA_fnc_addPerFrameHandler;
