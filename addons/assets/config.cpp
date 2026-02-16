#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {MACRO_VEHICLES};
        weapons[] = {MACRO_WEAPONS};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QCLASS(common)};
        authors[] = {"TenuredCLOUD"};
        VERSION_CONFIG;
    };
};

#include "CfgMagazines.hpp"
#include "CfgVehicleClasses.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
