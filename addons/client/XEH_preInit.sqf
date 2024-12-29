#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (!hasInterface) exitWith {};

[player] call FUNC(initialize);

ADDON = true;
