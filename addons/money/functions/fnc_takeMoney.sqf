#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Take Money UI
 * Starts up UI with proper values, etc...
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_money_fnc_takeMoney;
 *
*/

[{!isNull findDisplay 358492},
{

private _Corpse = (([] call FUNC(NearestCorpse_Money)) select 1);

private _CorpseFunds = _Corpse getVariable "MiseryCurrency";

ctrlSetText [1001, format ["%1 %2", MiseryCurrencySymbol, [_CorpseFunds, 1, 2, true] call CBA_fnc_formatNumber]];

private _playerFunds = player getVariable "MiseryCurrency";
ctrlSetText [1002, format ["%3: %1 %2", MiseryCurrencySymbol, [_playerFunds, 1, 2, true] call CBA_fnc_formatNumber, profileName]];

}, []] call CBA_fnc_waitUntilAndExecute;
