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
    ctrlSetText [1104, localize ECSTRING(common,DealerNoFunds)];
};

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

if (_bet <= 0) exitWith {
    ctrlSetText [1104, localize ECSTRING(common,NeedToBet)];
};

if (_prediction isEqualTo -1) exitWith {
    ctrlSetText [1104, localize ECSTRING(common,PickHigherLower)];
};

if (_funds < _bet) exitWith {
    ctrlSetText [1104, localize ECSTRING(common,NoFundsToWager)];
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

    private _winnerText = format ["%3%2 %1", [_payout, 1, 2, true] call CBA_fnc_formatNumber, EGVAR(currency,symbol), localize ECSTRING(common,WinnerGained)];
    if (_payout < _bet) then {
        _winnerText = _winnerText + localize ECSTRING(common,DealerBroke);
    };

    ctrlSetText [1104, _winnerText];
} else {
    [-_bet] call EFUNC(currency,modifyMoney);
    _dealer setVariable [QGVAR(dealerFunds), _dealerFunds + _bet, true];

    private _baseMsg = [localize ECSTRING(common,BetterLuckNextTime), localize ECSTRING(common,TieHouseWins)] select _tie;
    private _loserText = format ["%1 %4 %3 %2", _baseMsg, [_bet, 1, 2, true] call CBA_fnc_formatNumber, EGVAR(currency,symbol), localize ECSTRING(common,YouLost)];
    ctrlSetText [1104, _loserText];
};

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

ctrlSetText [2222, format ["%3: %1 %2", EGVAR(currency,symbol), [_funds, 1, 2, true] call CBA_fnc_formatNumber, profileName]];

private _dealerFundsUpdated = _dealer getVariable [QGVAR(dealerFunds), 50000];

ctrlSetText [2223, format ["%3 %1 %2", EGVAR(currency,symbol), [_dealerFundsUpdated, 1, 2, true] call CBA_fnc_formatNumber, localize ECSTRING(common,DealerLabel)]];

GVAR(currentTotal) = _newTotal;
