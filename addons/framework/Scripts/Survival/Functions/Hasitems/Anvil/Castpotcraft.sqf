
private _cansmith = FALSE;

the_itemtype1 = "Misery_Ironingot";

_Check_items = items player;

_numType1 = {_x == the_itemtype1} count items player;
  
if (_numType1 > 1 && "Misery_Anvilhammer" in _Check_items) then {
  _cansmith = TRUE;
if (_cansmith)exitwith{};
};

_cansmith //return
