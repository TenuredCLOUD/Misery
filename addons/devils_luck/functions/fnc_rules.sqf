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

private _helpTitle = format ["<t color='#ff0000' size='1.5' shadow='2'>%1</t><br/>", localize ECSTRING(common,RulesTitle)];

private _rules = [
    format ["1. <t color='#f0c040'>%1</t> %2", localize ECSTRING(common,Rule1_Title), localize ECSTRING(common,Rule1_Desc)],
    format ["2. <t color='#f0c040'>%1</t> %2", localize ECSTRING(common,Rule2_Title), localize ECSTRING(common,Rule2_Desc)],
    format ["3. <t color='#f0c040'>%1</t> %2", localize ECSTRING(common,Rule3_Title), localize ECSTRING(common,Rule3_Desc)],
    format ["4. <t color='#f0c040'>%1</t> %2", localize ECSTRING(common,Rule4_Title), localize ECSTRING(common,Rule4_Desc)],
    format ["5. <t color='#f0c040'>%1</t> %2", localize ECSTRING(common,Rule5_Title), localize ECSTRING(common,Rule5_Desc)]
];

private _tip = format ["<br/><br/><t size='0.8'>%1</t>", localize ECSTRING(common,ProTip_Body)];

hint parseText (_helpTitle + (_rules joinString "<br/>") + _tip);
