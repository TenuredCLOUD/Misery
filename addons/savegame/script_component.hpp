#define COMPONENT savegame
#define COMPONENT_BEAUTIFIED Savegame
#include "\z\misery\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_SAVEGAME
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SAVEGAME
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SAVEGAME
#endif

#include "\z\misery\addons\main\script_macros.hpp"