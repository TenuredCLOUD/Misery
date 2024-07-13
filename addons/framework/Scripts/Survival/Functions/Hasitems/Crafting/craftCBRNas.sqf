
private _cancraft = FALSE;

private _Check_items = items player;
private _check_mags = magazines player;

if ("Misery_CBRNparts" in _Check_items && "rvg_toolkit" in _check_mags) then {
_cancraft = TRUE;
if (_cancraft)exitwith{};
};

_cancraft //return 