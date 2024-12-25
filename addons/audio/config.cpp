#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(sfx_v_furnace)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"misery_common"};
        authors[] = {"TenuredCLOUD", "MikeMF"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMusic.hpp"
#include "CfgSFX.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
