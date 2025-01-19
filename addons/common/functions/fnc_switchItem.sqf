#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Switches items out for others. Handles multiple inputs on either or both sides.
 *
 * Arguments:
 * 0: Item to switch from <ARRAY>
 * 1: Item to switch to <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[QCLASS(myItem)], [QCLASS(MyOtherItem), QCLASS(MyOtherOTHERItem)]] call misery_common_fnc_switchItem
*/

params ["_switchFrom", "_switchTo"];

if (_switchFrom isNotEqualTo []) then {
    {
        player removeItem _x;
    } forEach _switchFrom;
};

// If the player doesn't have space for the item, it is placed nearby on the ground.
if (_switchTo isNotEqualTo []) then {
    {
        [player, _x, true] call CBA_fnc_addItem;
    } forEach _switchTo;
};
