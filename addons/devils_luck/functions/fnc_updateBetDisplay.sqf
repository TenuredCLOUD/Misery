#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Updates the bet display and global variable based on edit box input
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_devils_luck_fnc_updateBetDisplay;
 *
*/

private _amount = (ctrlText ((findDisplay 338455) displayCtrl 1600)) call BIS_fnc_parseNumber;

private _betValue = _amount max 0;

private _betDisplay = [_betValue, 1, 2, true] call CBA_fnc_formatNumber;

private _betText = format ["%3 %2 %1", _betDisplay, EGVAR(currency,symbol), localize LSTRING(CurrentBetLabel)];
ctrlSetText [1102, _betText];

GVAR(currentBet) = _betValue;
