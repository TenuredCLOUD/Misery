#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QCLASS(common), "A3_Structures_F"};
        authors[] = {"TenuredCLOUD"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
