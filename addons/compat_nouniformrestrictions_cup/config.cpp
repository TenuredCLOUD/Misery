#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QCLASS(common), "CUP_Creatures_People_LoadOrder"};
        skipWhenMissingDependencies = 1;
        skipWhenAnyAddonPresent[] = {"ace_compat_cup_units"};
        authors[] = {"TenuredCLOUD"};
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
