#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Near tree check fnc (Chainsaw wood collection)
 * Returns all nearby tree terrain objects + checks if they are damaged
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_common_fnc_nearTreeSaw;
 *
*/

private ["_found"];

_found=false;

if (isNull objectParent player && ([[QCLASS(chainsaw)]] call FUNC(hasItem))) then {

    //List nearby trees
    if (count (nearestTerrainObjects [player, ["TREE","SMALL TREE"], 2.5, true, true]) > 0) then {
        _found = true;
        };
        //Check if nearby trees are damaged:
        private _nearbyTrees = nearestTerrainObjects [player, ["TREE","SMALL TREE"], 2.5, true, true];
        {
        if (damage _x isEqualTo 1) then {
        _found = false;
        [QUOTE(COMPONENT_BEAUTIFIED), "Tree has fallen and doesn't offer anymore wood."] call EFUNC(common,debugMessage);
        };
        } forEach _nearbyTrees;

    };
        _found
