#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(sfx_v_petrolGenRun),
            QGVAR(sfx_v_dieselGenRun),
            QGVAR(sfx_v_kvaGenRun),
            QCLASS(petrolGenerator),
            QCLASS(dieselGenerator),
            QCLASS(kvaGenerator),
            QCLASS(batteryPack_black),
            QCLASS(batteryPack_od),
            QCLASS(batteryPack_sand),
            QCLASS(portableLight_single_black),
            QCLASS(portableLight_single_black_unfolded),
            QCLASS(portableLight_single_od),
            QCLASS(portableLight_single_od_unfolded),
            QCLASS(portableLight_single_sand),
            QCLASS(portableLight_single_sand_unfolded),
            QCLASS(portableLight_single_yellow),
            QCLASS(portableLight_single_yellow_unfolded),
            QCLASS(portableLight_double_black),
            QCLASS(portableLight_double_od),
            QCLASS(portableLight_double_sand),
            QCLASS(portableLight_double_yellow),
            QCLASS(portableLight_quad_black),
            QCLASS(portableLight_quad_od),
            QCLASS(portableLight_quad_sand),
            QCLASS(portableLight_quad_yellow),
            QCLASS(portable_solar_black),
            QCLASS(portable_solar_od),
            QCLASS(portable_solar_sand)
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

