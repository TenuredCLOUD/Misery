/*
 * Author: TenuredCLOUD
 * Near Phantom
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fear_fnc_nearZed
 *
*/

private ["_found"];

_found=false;

if (count (player nearEntities [["zombie"], 25]) > 0) then {
  _found = true;

  if (_found)exitwith{};
};

_found
