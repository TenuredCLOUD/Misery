private ["_found"];

_found=false;

if (count (player nearEntities [["myst_phantom_hidden_f","myst_phantom_naked_f"], 25]) > 0) then {
  _found = true;

  if (_found)exitwith{};
};

_found
