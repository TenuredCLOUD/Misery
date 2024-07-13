private _HasJerrycanDirty = FALSE;

private _check_items = items player;

if ("Misery_WaterJerryFD" in _check_items) then {

_HasJerrycanDirty = TRUE;

if (_HasJerrycanDirty)exitwith{};

};

_HasJerrycanDirty //return