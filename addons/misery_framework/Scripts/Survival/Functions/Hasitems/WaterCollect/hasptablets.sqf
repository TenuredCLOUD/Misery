private _HaspTabs = FALSE;

private _check_items = items player;
private _check_mags = magazines player;

if ("rvg_purificationTablets" in _check_mags) then {

_HaspTabs = TRUE;

if (_HaspTabs)exitwith{};

};

_HaspTabs //return