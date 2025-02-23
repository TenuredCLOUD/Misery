#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QCLASS(common), QCLASS(ui)};
        authors[] = {"TenuredCLOUD"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "\z\misery\addons\ui\menus\core.hpp"
#include "refuelShop.hpp"
