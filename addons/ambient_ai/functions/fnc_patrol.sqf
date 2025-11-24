#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ambient AI groups Patrol processor
 * Controls AI groups patrol patterns & actions
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_ai_fnc_patrol;
 *
 * Public: No
*/

[{GVAR(registeredEntities) isNotEqualTo []}, {
    {
        private _group = _x;
        private _leader = leader _group;
        private _nearestTown = nearestLocations [position _leader, ["NameCity", "NameVillage", "NameCityCapital"], 5000];

        {
            _x enableGunLights "forceOn";
        } forEach units _group;

        [_group, position (_nearestTown select 2), 300, 8, "MOVE", "AWARE", "RED", "LIMITED", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3, 6, 9]] call CBA_fnc_taskPatrol;

    } forEach GVAR(registeredEntities);
    [{
        [] call FUNC(patrol);
    }, [], 30] call CBA_fnc_waitAndExecute;
}, []] call CBA_fnc_waitUntilAndExecute;
