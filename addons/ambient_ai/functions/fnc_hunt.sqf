#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ambient AI groups Hunt processor
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_ai_fnc_hunt;
 *
 * Public: No
*/

[{
    params ["_args", "_handle"];

    if (GVAR(registeredEntities) isEqualTo []) exitWith {};

    private _players = call EFUNC(common,listPlayers);

    if (_players isEqualTo []) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    {
        private _group = _x;

        if (isNull _group || {count (units _group) isEqualTo 0}) then { continue };

        private _leader = leader _group;

        private _selectedPlayer = selectRandom _players;

        private _playerPos = getPosATL _selectedPlayer;

        {
            _x enableGunLights "forceOn";
        } forEach (units _group);

        private _logicType = _group getVariable [QGVAR(logicType), 0];

        if (_logicType isEqualTo 0) then {
            [_group, [_playerPos, 250, 250, 0, false]] call CBA_fnc_taskSearchArea;
        };

    } forEach GVAR(registeredEntities);
}, 30] call CBA_fnc_addPerFrameHandler;
