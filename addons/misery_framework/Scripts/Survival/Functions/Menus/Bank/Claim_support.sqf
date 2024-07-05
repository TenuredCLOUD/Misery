/* -----------------------------------
Misery Bank UI Claim Support (Phoenix fund) Processor 
Also adds a 24 hour cooldown before requesting more funds
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

    private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));
    private _maxAmount = MiseryCurrency_PhoenixAccount * 0.01; 
    private _lastWithdrawalTime = player getVariable ["lastPhoenixWithdrawalTime", 0];

    if (time > _lastWithdrawalTime + 4 * 60 * 60) then {
        if (_amount > 0 && _amount <= _maxAmount && _amount <= MiseryCurrency_PhoenixAccount) then {
            player setVariable ["MiseryCurrency", (player getVariable "MiseryCurrency") + _amount];
            MiseryCurrency_PhoenixAccount = MiseryCurrency_PhoenixAccount - _amount;
			publicVariable "MiseryCurrency_PhoenixAccount";
            player setVariable ["lastPhoenixWithdrawalTime", time];
        };
    };



