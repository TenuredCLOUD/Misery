
private _canboilwater = FALSE;

private _check_mags = magazines player;

private _check_items = items player;

if ("Misery_WaterJerryFD" in _check_items && "Misery_castironpot" in _check_items || "rvg_canteen" in _check_mags && "Misery_castironpot" in _check_items || "rvg_plasticBottle" in _check_mags && "Misery_castironpot" in _check_items) then {
  _canboilwater = TRUE;
if (_canboilwater)exitwith{};
};

_canboilwater //return
