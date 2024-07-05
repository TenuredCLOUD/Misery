
private _cancook = FALSE;

private _check_mags = magazines player;

private _check_items = items player;

if ("rvg_Rabbit_Meat" in _check_mags || "rvg_Chicken_Meat" in _check_mags || "rvg_Sheep_Meat" in _check_mags || "rvg_Boar_Meat" in _check_mags || "rvg_Buffalo_Meat" in _check_mags || "Misery_rawfish_1" in _check_items) then {
  _cancook = TRUE;
if (_cancook)exitwith{};
};

_cancook //return
