#include "script_component.hpp"

if (!isServer) exitWith {};

GVAR(ballisticsMap) = createHashMap;
