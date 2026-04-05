#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Handles menu loading / prepping for devils luck mini-game
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_devils_luck_fnc_loadMenu;
*/

[{!isNull findDisplay 338455},
{

    GVAR(currentBet) = 0;
    GVAR(currentPrediction) = -1;
    GVAR(currentTotal) = 7;

    ctrlSetText [1101, "7"];
    ctrlSetText [1103, localize LSTRING(PredictionNone)];

    private _betText = format ["%2 %1 0", EGVAR(currency,symbol), localize LSTRING(CurrentBetLabel)];

    ctrlSetText [1102, _betText];

    call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

    ctrlSetText [2222, format ["%3: %1 %2", EGVAR(currency,symbol), [_funds, 1, 2, true] call CBA_fnc_formatNumber, profileName]];

    private _dealer = player getVariable [QGVAR(currentDealer), objNull];
    private _dealerFunds = _dealer getVariable [QGVAR(dealerFunds), 50000];

    ctrlSetText [2223, format ["%3 %1 %2", EGVAR(currency,symbol), [_dealerFunds, 1, 2, true] call CBA_fnc_formatNumber, localize LSTRING(DealerLabel)]];

    _dealer setVariable [QGVAR(isActive), true, true];

}, []] call CBA_fnc_waitUntilAndExecute;
