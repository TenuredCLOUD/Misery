#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Handles menu loading / prepping for devils luck mini-game
 *
 * Arguments:
 * 0: display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_devils_luck_fnc_loadMenu;
*/

private _display = _this select 0;

GVAR(currentBet) = 0;
GVAR(currentPrediction) = -1;
GVAR(currentTotal) = 7;

ctrlSetText [1101, "7"];
ctrlSetText [1102, "Current Bet: 0"];
ctrlSetText [1103, "Prediction: NONE"];
