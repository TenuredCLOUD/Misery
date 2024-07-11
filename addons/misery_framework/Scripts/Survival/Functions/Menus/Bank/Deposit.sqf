/* -----------------------------------
Misery Bank UI Deposit Processor 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));
private _playerFunds = player getVariable "MiseryCurrency";
    if (_amount <= _playerFunds) then {
        player setVariable ["MiseryCurrency", _playerFunds - _amount];
        player setVariable ["MiseryCurrency_Banked", (player getVariable "MiseryCurrency_Banked") + _amount];
    };

