
private ["_canfish"];

_fishinggear =false;

_Check_items = items player;

if ("Misery_fishingpole" in _Check_items && "Misery_fishingspool" in _Check_items && "Misery_fishhook" in _Check_items && "Misery_worms" in _Check_items)  then {

    _fishinggear = true;

    if (_fishinggear)exitwith{};
};
        _fishinggear //return
