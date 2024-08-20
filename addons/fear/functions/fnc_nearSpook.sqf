/*
 * Author: TenuredCLOUD
 * Near Spook
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fear_fnc_nearSpook
 *
*/

private _found;
private _spookArray = [] + dsaSpookBases + dsaDevMutants + dsaWebknightCreatures;

_found=false;

if (count (player nearEntities [[_spookArray], 25]) > 0) then {

  _found = true;

  if (_found)exitwith{};
};

_found
