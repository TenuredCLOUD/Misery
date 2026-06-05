#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(generators) = [
    QCLASS(petrolGenerator),
    QCLASS(dieselGenerator),
    QCLASS(kvaGenerator)
];

GVAR(runningGenerators) = [];

GVAR(lights) = [
    // Portable Lights (single folded / unfolded)
    QCLASS(portableLight_single_black),
    QCLASS(portableLight_single_black_unfolded),
    QCLASS(portableLight_single_od),
    QCLASS(portableLight_single_od_unfolded),
    QCLASS(portableLight_single_sand),
    QCLASS(portableLight_single_sand_unfolded),
    QCLASS(portableLight_single_yellow),
    QCLASS(portableLight_single_yellow_unfolded),
    // Portable Lights (double)
    QCLASS(portableLight_double_black),
    QCLASS(portableLight_double_od),
    QCLASS(portableLight_double_sand),
    QCLASS(portableLight_double_yellow),
    // Portable Lights (quad)
    QCLASS(portableLight_quad_black),
    QCLASS(portableLight_quad_od),
    QCLASS(portableLight_quad_sand),
    QCLASS(portableLight_quad_yellow)
];

GVAR(solar) = [
    QCLASS(portable_solar_black),
    QCLASS(portable_solar_od),
    QCLASS(portable_solar_sand)
];

GVAR(batteryBanks) = [
    QCLASS(batteryPack_black),
    QCLASS(batteryPack_od),
    QCLASS(batteryPack_sand)
];

ADDON = true;
