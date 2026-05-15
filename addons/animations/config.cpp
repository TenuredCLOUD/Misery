#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QCLASS(common), "a3_anims_f"};
        authors[] = {"WebKnight", "TenuredCLOUD"};
        VERSION_CONFIG;
    };
};

#include "CfgMoves.hpp"

#include "CfgEventHandlers.hpp"
