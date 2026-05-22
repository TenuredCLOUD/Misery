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

private _helpTitle = format ["<t color='#ff0000' size='1.5' shadow='2'>%1</t><br/>", localize LSTRING(RulesTitle)];

private _rules = [
    format ["1. <t color='#f0c040'>%1</t> %2", localize LSTRING(Rule1_Title), localize LSTRING(Rule1_Desc)],
    format ["2. <t color='#f0c040'>%1</t> %2", localize LSTRING(Rule2_Title), localize LSTRING(Rule2_Desc)],
    format ["3. <t color='#f0c040'>%1</t> %2", localize LSTRING(Rule3_Title), localize LSTRING(Rule3_Desc)],
    format ["4. <t color='#f0c040'>%1</t> %2", localize LSTRING(Rule4_Title), localize LSTRING(Rule4_Desc)],
    format ["5. <t color='#f0c040'>%1</t> %2", localize LSTRING(Rule5_Title), localize LSTRING(Rule5_Desc)]
];

private _tip = format ["<br/><br/><t size='0.8'>%1</t>", localize LSTRING(ProTip_Body)];

hint parseText (_helpTitle + (_rules joinString "<br/>") + _tip);
