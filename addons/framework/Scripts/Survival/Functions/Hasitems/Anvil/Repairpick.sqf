
private _cansmith = FALSE;

the_itemtype1 = "Misery_Ironingot";
the_itemtype2 = "NMIB_WoodNails_Itm";

_Check_items = items player;

  _numType1 = {_x == the_itemtype1} count items player;
  _numType2 = {_x == the_itemtype2} count items player;

if (_numType1 > 0 && _numType2 > 0 && "Misery_Anvilhammer" in _Check_items && "Misery_Pickaxebroken" in _Check_items) then {
  _cansmith = TRUE;
if (_cansmith)exitwith{};
};

_cansmith //return
