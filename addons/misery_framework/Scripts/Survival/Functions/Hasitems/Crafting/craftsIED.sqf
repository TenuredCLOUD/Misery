
private _cancraft = FALSE;

private _the_itemtype1 = "Misery_CoppWire";

private _craftType1 = {_x == _the_itemtype1} count items player;

_Check_items = items player;
_check_mags = magazines player;

if (_craftType1 > 1 && "Misery_9vbat" in _Check_items && "Misery_lithiumbattery" in _Check_items && "rvg_plasticBottleEmpty" in _check_mags && "Misery_Phone" in _Check_items && "Misery_pliers" in _Check_items && "Misery_Ducttape" in _Check_items) then {

_cancraft = TRUE;

if (_cancraft)exitwith{};

};

_cancraft //return 