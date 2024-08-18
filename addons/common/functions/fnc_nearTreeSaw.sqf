#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Near tree check fnc (Chainsaw wood collection)
 * Returns all nearby tree terrain objects + checks if they are damaged
 *
 * Arguments:
 * 0: NONE
 *
 * Return Value:
 * 0: NONE
 *
 * Example:
 * [] call misery_common_fnc_nearTreeSaw;
 *
*/

private ["_found"];

_found=false;

if (vehicle player == player && "Misery_Chainsaw" in items player) then {

    //List nearby trees
    if (count (nearestTerrainObjects [player, ["TREE","SMALL TREE"], 2.5, true, true]) > 0) then {
        _found = true;
        };
        //Check if nearby trees are damaged:
        private _nearbyTrees = nearestTerrainObjects [player, ["TREE","SMALL TREE"], 2.5, true, true];
        {
        if (damage _x == 1) then {
        _found = false;
        if (MiseryDebug) then {systemChat format["[Wood collection (Chainsaw)]: The tree at position %1 is fallen, and doesn't offer any more wood...",getPosATL _x];};
        };
        } forEach _nearbyTrees;

    };
        _found
