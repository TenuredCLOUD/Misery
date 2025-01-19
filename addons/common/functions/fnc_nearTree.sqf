#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Near tree check fnc (Hand wood collection)
 * Returns all nearby tree terrain objects + checks if they are damaged
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_common_fnc_nearTree;
 *
*/

private ["_found"];

_found=false;

if (isNull objectParent player) then {

    //List nearby trees
    if (count (nearestTerrainObjects [player, ["TREE","SMALL TREE"], 2.5, true, true]) > 0) then {
        _found = true;
    };
    //Check if nearby trees are damaged:
    private _nearbyTrees = nearestTerrainObjects [player, ["TREE","SMALL TREE"], 2.5, true, true];
    {
    if (damage _x isEqualTo 1) then {
        _found = false;
        if (EGVAR(common,debug)) then {systemChat format["[Wood collection (Hands)]: The tree at position %1 is fallen, and doesn't offer any more wood...",getPosATL _x];};
    };
    } forEach _nearbyTrees;

};
    _found
