#define COMPONENT geiger
#define COMPONENT_BEAUTIFIED Geiger
#include "\z\misery\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#define MACRO_GEIGER_SOUNDS QEGVAR(audio,sound_geiger01), QEGVAR(audio,sound_geiger02), QEGVAR(audio,sound_geiger03), QEGVAR(audio,sound_geiger04), QEGVAR(audio,sound_geiger05), QEGVAR(audio,sound_geiger06), QEGVAR(audio,sound_geiger07), QEGVAR(audio,sound_geiger08), QEGVAR(audio,sound_geiger09), QEGVAR(audio,sound_geiger10),

#ifdef DEBUG_ENABLED_GEIGER
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_GEIGER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_GEIGER
#endif

#include "\z\misery\addons\main\script_macros.hpp"
