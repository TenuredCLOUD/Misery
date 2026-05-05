#define COMPONENT medical
#define COMPONENT_BEAUTIFIED Medical
#include "\z\misery\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_MEDICAL
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL
#endif

#define MACRO_MEDICATION_REGISTRY [ \
    [QCLASS(antibiotic), QFUNC(antibiotics)], \
    [QCLASS(antidote), QFUNC(antidote)], \
    [QCLASS(antiparasitic), QFUNC(antiparasitic)], \
    [QCLASS(caffetin), QFUNC(caffetinTablets)], \
    [QCLASS(caffeine), QFUNC(caffieneTablets)], \
    [QCLASS(cocaine), QEFUNC(stims,cocaine)], \
    [QCLASS(antidote), QFUNC(antidote)], \
    [QCLASSACE(salineIV_500), QFUNC(saline)], \
    [QCLASSACE(salineIV_250), QFUNC(saline)], \
    [QCLASSACE(salineIV), QFUNC(saline)] \
]

#include "\z\misery\addons\main\script_macros.hpp"
