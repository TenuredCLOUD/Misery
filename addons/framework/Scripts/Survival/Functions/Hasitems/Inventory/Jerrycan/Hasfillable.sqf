private _Hasfillable = FALSE;

private _check_items = items player;
private _check_mags = magazines player;

if ("Misery_WaterJerryF" in _check_items && "rvg_canteenEmpty" in _check_mags 
||"Misery_WaterJerryF" in _check_items && "rvg_plasticBottleEmpty" in _check_mags
||"Misery_WaterJerryFD" in _check_items && "rvg_canteenEmpty" in _check_mags
||"Misery_WaterJerryFD" in _check_items && "rvg_plasticBottleEmpty" in _check_mags) then {

_Hasfillable = TRUE;

if (_Hasfillable)exitwith{};

};

_Hasfillable //return