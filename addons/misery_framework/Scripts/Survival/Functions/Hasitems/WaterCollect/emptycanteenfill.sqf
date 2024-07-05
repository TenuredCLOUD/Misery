private _Hasfillable = FALSE;

private _check_items = items player;
private _check_mags = magazines player;

if ("rvg_canteenEmpty" in _check_mags) then {

_Hasfillable = TRUE;

if (_Hasfillable)exitwith{};

};

_Hasfillable //return