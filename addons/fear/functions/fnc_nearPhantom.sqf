#include "..\script_component.hpp"
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
 * [] call misery_fear_fnc_nearPhantom
 *
*/

private ["_found"];

_found=false;

if (count (player nearEntities [["myst_phantom_hidden_f","myst_phantom_naked_f"], 25]) > 0) then {
  _found = true;

  if (_found)exitWith{};
};

_found
