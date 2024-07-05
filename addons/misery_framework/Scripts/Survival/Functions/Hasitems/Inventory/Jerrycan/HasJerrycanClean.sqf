private _HasJerrycanClean = FALSE;

private _check_items = items player;

if ("Misery_WaterJerryF" in _check_items) then {

_HasJerrycanClean = TRUE;

if (_HasJerrycanClean)exitwith{};

};

_HasJerrycanClean //return