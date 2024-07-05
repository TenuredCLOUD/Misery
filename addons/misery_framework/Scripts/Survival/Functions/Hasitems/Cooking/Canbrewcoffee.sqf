
private _canbrewcoffee = FALSE;

private _check_mags = magazines player;
private _check_items = items player;

if ("Misery_WaterJerryF" in _check_items && "Misery_castironpot" in _check_items && "Misery_coffeemug" in _check_items && "Misery_coffeegrounds" in _check_items 
|| "rvg_canteenPurified" in _check_mags && "Misery_castironpot" in _check_items && "Misery_coffeemug" in _check_items && "Misery_coffeegrounds" in _check_items
|| "rvg_plasticBottlePurified" in _check_mags && "Misery_castironpot" in _check_items && "Misery_coffeemug" in _check_items && "Misery_coffeegrounds" in _check_items) then {

_canbrewcoffee = TRUE;

if (_canbrewcoffee)exitwith{};

};

_canbrewcoffee //return
