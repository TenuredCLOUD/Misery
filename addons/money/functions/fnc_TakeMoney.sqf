/*
Misery Take Money UI
Starts up UI with proper values, etc...
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\main\script_macros.hpp"

[{!isNull findDisplay 358492},
{

private _Corpse = (([] call FUNC(NearestCorpse_Money)) select 1);

private _CorpseFunds = _Corpse getVariable "MiseryCurrency";

ctrlSetText [1001, format ["%1 %2", MiseryCurrencySymbol, [_CorpseFunds, 1, 2, true] call CBA_fnc_formatNumber]];

private _playerFunds = player getVariable "MiseryCurrency";
ctrlSetText [1002, format ["%3: %1 %2", MiseryCurrencySymbol, [_playerFunds, 1, 2, true] call CBA_fnc_formatNumber, profileName]];

}, []] call CBA_fnc_waitUntilAndExecute;
