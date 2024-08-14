#include "..\script_component.hpp"
/*
Misery Take Money UI Action process
Processes money taking from corpses
Designed specifically for Misery mod
by TenuredCLOUD
*/


[{!isNull findDisplay 358492},
{
    private _Corpse = (([] call FUNC(NearestCorpse_Money)) select 1);
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

