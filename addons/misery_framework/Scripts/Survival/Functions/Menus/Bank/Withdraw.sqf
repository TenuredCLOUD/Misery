/* -----------------------------------
Misery Bank UI Withdraw Processor 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));
private _playerBank = player getVariable "MiseryCurrency_Banked";
    if (_amount <= _playerBank) then {
        player setVariable ["MiseryCurrency_Banked", _playerBank - _amount];
        player setVariable ["MiseryCurrency", (player getVariable "MiseryCurrency") + _amount];
    };

