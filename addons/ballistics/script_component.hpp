#define COMPONENT ballistics
#define COMPONENT_BEAUTIFIED Ballistics
#include "\z\misery\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_BALLISTICS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_BALLISTICS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_BALLISTICS
#endif

#include "\z\misery\addons\main\script_macros.hpp"


#define MACRO_BLOODPOOL_TYPES "BloodPool_01_Medium_New_F", "BloodSplatter_01_Medium_New_F", "BloodSplatter_01_Small_New_F", "BloodSpray_01_New_F"
