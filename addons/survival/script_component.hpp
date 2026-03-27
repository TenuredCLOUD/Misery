#define COMPONENT survival
#define COMPONENT_BEAUTIFIED Survival
#include "\z\misery\addons\main\script_mod.hpp"

#define MACRO_SURVIVAL_PAIN_LOW \
QCLASS(soundbreathinjured_low_01), \
QCLASS(soundbreathinjured_low_02), \
QCLASS(soundbreathinjured_low_03), \
QCLASS(soundbreathinjured_low_04), \
QCLASS(soundbreathinjured_low_05), \
QCLASS(soundbreathinjured_low_06), \
QCLASS(soundbreathinjured_low_07), \
QCLASS(soundbreathinjured_low_08), \
QCLASS(soundbreathinjured_low_09), \
QCLASS(soundbreathinjured_low_10), \
QCLASS(soundbreathinjured_low_11), \
QCLASS(soundbreathinjured_low_12)

#define MACRO_SURVIVAL_PAIN_MID \
QCLASS(soundbreathinjured_mid_01), \
QCLASS(soundbreathinjured_mid_02), \
QCLASS(soundbreathinjured_mid_03), \
QCLASS(soundbreathinjured_mid_04), \
QCLASS(soundbreathinjured_mid_05), \
QCLASS(soundbreathinjured_mid_06), \
QCLASS(soundbreathinjured_mid_07), \
QCLASS(soundbreathinjured_mid_08), \
QCLASS(soundbreathinjured_mid_09), \
QCLASS(soundbreathinjured_mid_10), \
QCLASS(soundbreathinjured_mid_11), \
QCLASS(soundbreathinjured_mid_12), \
QCLASS(soundbreathinjured_mid_13), \
QCLASS(soundbreathinjured_mid_14)

#define MACRO_SURVIVAL_PAIN_MAX \
QCLASS(soundbreathinjured_max_01), \
QCLASS(soundbreathinjured_max_02), \
QCLASS(soundbreathinjured_max_03), \
QCLASS(soundbreathinjured_max_04), \
QCLASS(soundbreathinjured_max_05), \
QCLASS(soundbreathinjured_max_06), \
QCLASS(soundbreathinjured_max_07), \
QCLASS(soundbreathinjured_max_08), \
QCLASS(soundbreathinjured_max_09), \
QCLASS(soundbreathinjured_max_10), \
QCLASS(soundbreathinjured_max_11), \
QCLASS(soundbreathinjured_max_12)

#define MACRO_SURVIVAL_PAIN_HUNGER \
QCLASS(soundbreathinjured_low_07), \
QCLASS(soundbreathinjured_low_08), \
QCLASS(soundbreathinjured_low_09), \
QCLASS(soundbreathinjured_low_10), \
QCLASS(soundbreathinjured_low_11), \
QCLASS(soundbreathinjured_low_12)

#define MACRO_SURVIVAL_PAIN_RADIATION \
QCLASS(soundbreathinjured_max_10), \
QCLASS(soundbreathinjured_max_11), \
QCLASS(soundbreathinjured_max_12)

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_SURVIVAL
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SURVIVAL
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SURVIVAL
#endif

#include "\z\misery\addons\main\script_macros.hpp"
