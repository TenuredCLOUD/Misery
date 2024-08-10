#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[_this] call Misery_nofuel_fnc_no_fuelsource;

ADDON = true;