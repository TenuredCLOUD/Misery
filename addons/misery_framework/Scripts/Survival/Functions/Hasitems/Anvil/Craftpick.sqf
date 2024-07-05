
private _cansmith = FALSE;

the_itemtype1 = "Misery_Ironingot";
the_itemtype2 = "NMIB_WoodNails_Itm";
the_itemtype3 = "NMIB_WoodPlanks_Itm";

_Check_items = items player;

  _numType1 = {_x == the_itemtype1} count items player;
  _numType2 = {_x == the_itemtype2} count items player;
  _numType3 = {_x == the_itemtype3} count items player;
  
if (_numType1 > 1 && _numType2 > 0 && _numType3 > 0 && "Misery_Anvilhammer" in _Check_items) then {
_cansmith = TRUE;
if (_cansmith)exitwith{};
};

_cansmith //return 