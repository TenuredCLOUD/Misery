#define COMPONENT spectrum
#define COMPONENT_BEAUTIFIED Spectrum
#include "\z\misery\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#define MACRO_STATICWEIRD_SOUNDS QEGVAR(audio,sound_staticWeird01), QEGVAR(audio,sound_staticWeird02), QEGVAR(audio,sound_staticWeird03), QEGVAR(audio,sound_staticWeird04), QEGVAR(audio,sound_staticWeird05), QEGVAR(audio,sound_staticWeird06), QEGVAR(audio,sound_staticWeird07), QEGVAR(audio,sound_staticWeird08), QEGVAR(audio,sound_staticWeird09), QEGVAR(audio,sound_staticWeird10)
#define MACRO_PHANTOM_ENTITIES QUOTE(myst_phantom_hidden_f), QUOTE(myst_phantom_naked_f)

#ifdef DEBUG_ENABLED_SPECTRUM
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SPECTRUM
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SPECTRUM
#endif

#include "\z\misery\addons\main\script_macros.hpp"
