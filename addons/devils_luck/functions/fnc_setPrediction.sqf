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

private _val = parseNumber _isHigher;

private _text = [localize ECSTRING(common,Lower), localize ECSTRING(common,Higher)] select _isHigher;

GVAR(currentPrediction) = _val;

private _predictionText = format ["%2 %1", _text, localize ECSTRING(common,PredictionLabel)];

ctrlSetText [1103, _predictionText];
