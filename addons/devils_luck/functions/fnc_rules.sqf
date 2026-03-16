#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Displays rules of the game
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_devils_luck_fnc_rules;
*/

private _helpTitle = "<t color='#ff0000' size='1.5' shadow='2'>DEVIL'S LUCK</t><br/>";

private _rules = [
    "1. <t color='#f0c040'>The Setup:</t> The game begins with a total of 7. ",
    "2. <t color='#f0c040'>Your Bet:</t> Enter your bet in the edit box, funds are deducted or rewarded instantly upon rolling.",
    "3. <t color='#f0c040'>The Goal:</t> Predict if the sum of two 6-sided dice will be HIGHER or LOWER than the current total.",
    "4. <t color='#f0c040'>The House Edge:</t> If the new roll is EQUAL to the current total, you lose immediately. The House always wins.",
    "5. <t color='#f0c040'>Limits:</t> Every Game Master has limited funds, if you bleed them dry, the game ends."
];

private _tip = "<br/><br/><t size='0.8'>Pro Tip: Probabilities shift toward the middle (7). A 2 or 12 is your best chance to strike...</t>";

hint parseText (_helpTitle + (_rules joinString "<br/>") + _tip);
