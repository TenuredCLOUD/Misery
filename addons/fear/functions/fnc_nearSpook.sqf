private _found;
private _spookArray = [] + dsaSpookBases + dsaDevMutants + dsaWebknightCreatures;

_found=false;

if (count (player nearEntities [[_spookArray], 25]) > 0) then {

  _found = true;

  if (_found)exitwith{};
};

_found
