#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(sfx_v_petrolGenRun),
            QGVAR(sfx_v_dieselGenRun),
            QGVAR(sfx_v_kvaGenRun)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QCLASS(common)};
        authors[] = {"TenuredCLOUD"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgSFX.hpp"
#include "CfgVehicles.hpp"

