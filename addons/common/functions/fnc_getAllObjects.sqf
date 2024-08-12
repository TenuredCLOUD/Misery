#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Gets all alive objects and empty vehicles
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Objects <ARRAY>
 *
 * Example:
 * [] call misery_fnc_common_getAllObjects
*/

private _objects = [];
private _entities = entities [["All"], ["Man", "Animal", "Logic"], false, true];
private _supplies = MiseryCenter nearSupplies (MiseryRadius*2);

{
    if ((count (crew _x)) == 0) then {
        _objects pushBackUnique _x;
    };
} forEach _entities;

{
    if (_x in (allMissionObjects "all")) then{
        _objects pushBackUnique _x;
    };
} forEach _supplies;

_objects
