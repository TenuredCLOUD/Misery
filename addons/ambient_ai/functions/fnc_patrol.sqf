#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ambient AI groups Patrol processor
 * Controls AI groups patrol patterns & actions
 *
 * Arguments:
 * 0: Group <GROUP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_ai_fnc_patrol;
 *
 * Public: No
*/

params ["_group"];

[{{alive _x} count units _group > 0}, {

    {
        _x enableGunLights "forceOn";
    } forEach units _group;

        private _waypoint = [EGVAR(common,worldCenter), EGVAR(common,worldAxis), EGVAR(common,worldAxis), 10, 0, 0, 0] call BIS_fnc_findSafePos;
        [_group, _waypoint, 500, 10, "MOVE", "SAFE", "YELLOW", "LIMITED", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3, 6, 9]] call CBA_fnc_taskPatrol;

        private _building = nearestBuilding leader _group;
        if (_building distance leader _group < 100 && ([50] call EFUNC(common,rollChance))) then {
            [_group] call CBA_fnc_taskDefend;
        };

[{
    [_this] call FUNC(patrol);
}, [_group], 120] call CBA_fnc_waitAndExecute;
}, []] call CBA_fnc_waitUntilAndExecute;
