#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer) then {
    call FUNC(removeFuelSources);
};

ADDON = true;
