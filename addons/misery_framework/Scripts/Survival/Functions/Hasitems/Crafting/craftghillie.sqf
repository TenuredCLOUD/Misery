
private _cancraft = FALSE;

private _the_itemtype1 = "Misery_camonet";

private _the_itemtype2 = "Misery_Rope";

private _craftType1 = {_x == _the_itemtype1} count items player;

private _craftType2 = {_x == _the_itemtype2} count items player;

private _Check_items = items player;

if (_craftType1 > 3 && _craftType2 > 1 && "Misery_Needlethread" in _Check_items) then {
_cancraft = TRUE;
if (_cancraft)exitwith{};
};

_cancraft //return 