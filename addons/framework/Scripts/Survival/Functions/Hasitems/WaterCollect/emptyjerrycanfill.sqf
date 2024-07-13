private _Hasfillable = FALSE;

private _check_items = items player;
private _check_mags = magazines player;

if ("Misery_WaterJerryE" in _check_items) then {

_Hasfillable = TRUE;

if (_Hasfillable)exitwith{};

};

_Hasfillable //return