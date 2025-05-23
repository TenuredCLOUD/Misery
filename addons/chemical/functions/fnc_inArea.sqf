#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Checks if players are inside a chemical area.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_chemical_fnc_inArea
*/

// If chemical zone check fails, system will not function.
if !(call FUNC(checkAreas)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Marker check system failed, system disabled."] call EFUNC(common,debugMessage);
};

[{
    params ["_args", "_handle"];

    private _players = call EFUNC(common,listPlayers);
    {
        private _player = _x;
        private _isPlayerHandled = _player getVariable [QGVAR(insideArea), false];

        if (!_isPlayerHandled) then {
            private _isInsideZone = GVAR(areas) findIf {_player inArea _x} isNotEqualTo -1;

            if (_isInsideZone) then {
                _player setVariable [QGVAR(insideArea), true, true];
                [QGVAR(chemicalAreaEvent), [], _player] call CBA_fnc_targetEvent;
            };
        };
    } forEach _players;
}, 1] call CBA_fnc_addPerFrameHandler;
