
private _cancraft = FALSE;

private _the_itemtype1 = "Misery_camonet";

private _craftType1 = {_x == _the_itemtype1} count items player;

private _Check_items = items player;

if (_craftType1 > 1 && "Misery_Rope" in _Check_items && "Misery_Needlethread" in _Check_items) then {
_cancraft = TRUE;
if (_cancraft)exitwith{};
};

_cancraft //return 