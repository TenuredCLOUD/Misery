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

private _display = findDisplay 3384575825;

if (isNull _display) exitWith {};

private _bet = GVAR(currentBet);
private _prediction = GVAR(currentPrediction);
private _oldTotal = GVAR(currentTotal);

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
    [_bet] call EFUNC(currency,modifyMoney);
    private _winnerText = format ["Winner! You gained %2%1", _bet, EGVAR(currency,symbol)];
    ctrlSetText [1104, _winnerText];
} else {
    [-_bet] call EFUNC(currency,modifyMoney);
    private _loserText = ["Better luck next time...", "Tie! The House always wins..."] select _tie;
    ctrlSetText [1104, _loserText];
};

GVAR(currentTotal) = _newTotal;
