
private _cancraft = FALSE;

_Check_items = items player;

if ("Misery_craftinghammer" in _Check_items && "Misery_wrench" in _Check_items && "Misery_pliers" in _Check_items && "Misery_Pscrewdriver" in _Check_items && "Misery_Fscrewdriver" in _Check_items && "Misery_Ducttape" in _Check_items) then {

_cancraft = TRUE;

if (_cancraft)exitwith{};

};

_cancraft //return 