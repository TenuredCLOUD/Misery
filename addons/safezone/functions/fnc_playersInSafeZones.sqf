#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Checks if players are inside a safezone.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_safezone_fnc_playersInSafeZones
*/

// If safezone check fails, system will not function.
if !(call FUNC(checkSafeZones)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Marker check system failed, system disabled."] call EFUNC(common,debugMessage);
};

[{
    params ["_args", "_handle"];

    private _players = call EFUNC(common,listPlayers);
    {
        private _player = _x;
        private _isPlayerHandled = _player getVariable [QGVAR(insideSafeZone), false];

        if (!_isPlayerHandled) then {
            private _isInsideZone = GVAR(safezoneAreas) findIf {_player inArea _x} != -1;

            if (_isInsideZone) then {
                _player setVariable [QGVAR(insideSafeZone), true, true];
                [QGVAR(playerSafeZoneEvent), [], _player] call CBA_fnc_targetEvent;
            };
        };
    } forEach _players;
}, 1] call CBA_fnc_addPerFrameHandler;
