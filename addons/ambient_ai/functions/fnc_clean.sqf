#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * AI cleanup
 * Processes cleaning of ai based on distance of players to ai groups
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_ai_fnc_clean;
 *
*/

[{
    params ["_args", "_handle"];

    if (GVAR(registeredEntities) isEqualTo []) exitWith {};

    {
        private _group = _x;

        if (isNull _group || {units _group isEqualTo []}) then {
            GVAR(registeredEntities) deleteAt _forEachIndex;
            continue;
        };

        private _leader = leader _group;

        if (isNull _leader) then { _leader = (units _group) select 0; };

        private _playerNearby = [getPosWorld _leader, GVAR(deletionDistance)] call CBA_fnc_nearPlayer;

        if (!_playerNearby) then {
            GVAR(registeredEntities) deleteAt _forEachIndex;

            {
                deleteVehicle _x;
            } forEach (units _group);

            deleteGroup _group;
        };
    } forEachReversed GVAR(registeredEntities);
}, GVAR(cycleLength)] call CBA_fnc_addPerFrameHandler;
