#define COMPONENT gasmask
#define COMPONENT_BEAUTIFIED Gasmask
#include "\z\misery\addons\main\script_mod.hpp"

#define MACRO_REBREATHER_SOUNDS \
QCLASS(diver_breath_1), \
QCLASS(diver_breath_2), \
QCLASS(diver_breath_3), \
QCLASS(diver_breath_4)

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_GASMASK
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_GASMASK
    #define DEBUG_SETTINGS DEBUG_SETTINGS_GASMASK
#endif

#include "\z\misery\addons\main\script_macros.hpp"
