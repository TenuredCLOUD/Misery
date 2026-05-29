#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(generators) = [
    "Land_Portable_generator_F",
    QCLASS(dieselGenerator),
    QCLASS(kvaGenerator)
];

ADDON = true;
