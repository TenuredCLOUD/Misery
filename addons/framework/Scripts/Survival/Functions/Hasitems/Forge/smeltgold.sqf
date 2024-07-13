
private _cansmelt = FALSE;

the_itemtype1 = "Misery_Coalore";
the_itemtype2 = "Misery_Goldore";

  _numType1 = {_x == the_itemtype1} count items player;
  _numType2 = {_x == the_itemtype2} count items player;

if (_numType1 > 1 && _numType2 > 1) then {
  _cansmelt = TRUE;
if (_cansmelt)exitwith{};
};

_cansmelt //return
