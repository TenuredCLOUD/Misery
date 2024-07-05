
private _cancraft = FALSE;

private _Check_items = items player;

if ("Misery_woodenlog" in _Check_items && "Misery_electrichandsaw" in _Check_items) then {
_cancraft = TRUE;
if (_cancraft)exitwith{};
};

_cancraft //return 