#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Handles dice roll for devils luck mini-game
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_devils_luck_fnc_handleRoll;
*/

private _bet = GVAR(currentBet);
private _prediction = GVAR(currentPrediction);
private _oldTotal = GVAR(currentTotal);

private _dealer = player getVariable [QGVAR(currentDealer), objNull];

private _dealerFunds = _dealer getVariable [QGVAR(dealerFunds), 50000];
if (_dealerFunds <= 0) exitWith {
    ctrlSetText [1104, "This dealer has no more funds... Come back later..."];
};

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

if (_bet <= 0) exitWith {
    ctrlSetText [1104, "You need to bet something..."];
};

if (_prediction isEqualTo -1) exitWith {
    ctrlSetText [1104, "Pick Higher or Lower..."];
};

if (_funds < _bet) exitWith {
    ctrlSetText [1104, "You don't have the funds to wager that bet..."];
};

private _d1 = floor(random 6) + 1;
private _d2 = floor(random 6) + 1;
private _newTotal = _d1 + _d2;

private _dice1 = format ["\z\misery\addons\icons\data\dice_%1_ca.paa", _d1];
private _dice2 = format ["\z\misery\addons\icons\data\dice_%1_ca.paa", _d2];
private _diceTotal = str _newTotal;

ctrlSetText [1201, _dice1];
ctrlSetText [1202, _dice2];
ctrlSetText [1101, _diceTotal];

private _won = false;
private _tie = (_newTotal isEqualTo _oldTotal);

if (!_tie) then {
    if (_prediction isEqualTo 1 && _newTotal > _oldTotal) then {
        _won = true;
    };
    if (_prediction isEqualTo 0 && _newTotal < _oldTotal) then {
        _won = true;
    };
};

if (_won) then {
    private _payout = _bet min _dealerFunds;
    [_payout] call EFUNC(currency,modifyMoney);
    _dealer setVariable [QGVAR(dealerFunds), _dealerFunds - _payout, true];

    private _winnerText = format ["Winner! You gained %2 %1", [_payout, 1, 2, true] call CBA_fnc_formatNumber, EGVAR(currency,symbol)];
    if (_payout < _bet) then {
        _winnerText = _winnerText + " (This dealer is broke!)";
    };

    ctrlSetText [1104, _winnerText];
} else {
    [-_bet] call EFUNC(currency,modifyMoney);
    _dealer setVariable [QGVAR(dealerFunds), _dealerFunds + _bet, true];

    private _baseMsg = ["Better luck next time...", "Tie! The House always wins..."] select _tie;
    private _loserText = format ["%1 You lost %3 %2", _baseMsg, [_bet, 1, 2, true] call CBA_fnc_formatNumber, EGVAR(currency,symbol)];
    ctrlSetText [1104, _loserText];
};

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

ctrlSetText [2222, format ["%3: %1 %2", EGVAR(currency,symbol), [_funds, 1, 2, true] call CBA_fnc_formatNumber, profileName]];

private _dealerFundsUpdated = _dealer getVariable [QGVAR(dealerFunds), 50000];

ctrlSetText [2223, format ["Dealer: %1 %2", EGVAR(currency,symbol), [_dealerFundsUpdated, 1, 2, true] call CBA_fnc_formatNumber]];

GVAR(currentTotal) = _newTotal;
