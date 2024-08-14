private ["_found"];

_found=false;

if (count (player nearEntities [["zombie"], 25]) > 0) then {
  _found = true;

  if (_found)exitwith{};
};

_found
