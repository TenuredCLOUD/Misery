#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"misery_main"};
        authors[] = {"MikeMF"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"