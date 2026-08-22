#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Give Money UI exit
 * Resets variables
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_exitGifting;
 *
*/

private _recipient = ACE_player getVariable [QGVAR(giftRecipient), ""];

if (_recipient isNotEqualTo "") then {
    ACE_player setVariable [QGVAR(giftRecipient), nil];
};
