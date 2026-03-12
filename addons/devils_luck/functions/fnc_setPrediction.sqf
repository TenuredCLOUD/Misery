#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Handles predictions for devils luck mini-game
 *
 * Arguments:
 * 0: Prediciton <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_devils_luck_fnc_modifyBetAmount;
*/

params ["_isHigher"];

private _display = findDisplay 3384575825;

private _val = parseNumber _isHigher;

private _text = ["LOWER", "HIGHER"] select _isHigher;

GVAR(currentPrediction) = _val;

private _predictionText = format ["Prediction: %1", _text];

ctrlSetText [1103, _predictionText];
