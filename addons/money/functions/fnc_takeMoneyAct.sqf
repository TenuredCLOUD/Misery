#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
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
 * [] call misery_money_fnc_takeMoneyAct;
 *
*/

[{!isNull findDisplay 358492},
{
    private _Corpse = (([] call FUNC(nearestCorpseMoney)) select 1);
    private _CorpseFunds = _Corpse getVariable "MiseryCurrency";

    private _amount = ctrlText ((findDisplay 358492) displayCtrl 1400);
    _amount = parseNumber _amount;

    if (_amount > _CorpseFunds) then {
        _amount = _CorpseFunds;
    };

    private _CurrentFunds = player getVariable "MiseryCurrency";
    player setVariable ["MiseryCurrency", _CurrentFunds + _amount];
    _Corpse setVariable ["MiseryCurrency", _CorpseFunds - _amount, true];

    [] execVM '\z\misery\addons\money\fnc_TakeMoney.sqf'; //Refresh main UI

}, []] call CBA_fnc_waitUntilAndExecute;

