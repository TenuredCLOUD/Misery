#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QCLASSACE(common), QCLASS(common), "WBK_MeleeMechanics"};
        skipWhenMissingDependencies = 1;
        authors[] = {"TenuredCLOUD"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"


