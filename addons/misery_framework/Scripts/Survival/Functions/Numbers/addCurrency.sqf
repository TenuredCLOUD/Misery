/*
Misery Funds add / remove function
Adds or removes funds to a recipient's wallet
Designed specifically for Misery mod 
by TenuredCLOUD 

Usage example:
[player, 1000000] call Misery_fnc_addCurrency; // Adds 1,000,000 to the player's wallet
*/

    params ["_recipient", "_amount"];

    private _currentFunds = _recipient getVariable ["MiseryCurrency", 0];

    _recipient setVariable ["MiseryCurrency", _currentFunds + _amount];

