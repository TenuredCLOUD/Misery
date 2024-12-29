#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(enabled) = isClass (configFile>>"cfgPatches">>"WBK_MeleeMechanics");

ADDON = true;
