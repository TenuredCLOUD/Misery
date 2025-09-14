#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Take Money UI Action process
 * Processes money taking from corpses
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_takeMoneyAct;
 *
*/

private _corpse = call FUNC(corpseCondition);

if (isNull _corpse) exitWith {};

private _cashFound = 0;

if ([GVAR(corpseHasMoneyChance)] call EFUNC(common,rollChance)) then {
    private _midAiMoney = GVAR(minAiMoney) + GVAR(maxAiMoney) / 2;
    _cashFound = floor random [GVAR(minAiMoney), _midAiMoney, GVAR(maxAiMoney)];
};

[_cashFound] call FUNC(modifyMoney);

// Globally block the corpse from being searched multiple times.
_corpse setVariable [QGVAR(searched), true, true];
