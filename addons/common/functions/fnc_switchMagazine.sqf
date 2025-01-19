#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Switches magazines out for others. Handles multiple inputs on either or both sides.
 *
 * Arguments:
 * 0: Magazine to switch from <ARRAY>
 * 1: Magazine to switch to <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[QCLASS(myMagazine)], [QCLASS(MyOtherMagazine), QCLASS(MyOtherOTHERMagazine)]] call misery_common_fnc_switchMagazine
*/

params ["_switchFrom", "_switchTo"];

if (_switchFrom isNotEqualTo []) then {
    {
        player removeMagazine _x;
    } forEach _switchFrom;
};

if (_switchTo isNotEqualTo []) then {
    {
        player addMagazine _x;
    } forEach _switchTo;
};
