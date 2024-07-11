/*
Misery Bank UI Contribute (Phoenix fund) Processor 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));
private _playerFunds = player getVariable "MiseryCurrency";
    if (_amount <= _playerFunds) then {
        player setVariable ["MiseryCurrency", _playerFunds - _amount];
        MiseryCurrency_PhoenixAccount = MiseryCurrency_PhoenixAccount + _amount;
		publicVariable "MiseryCurrency_PhoenixAccount";
    };

