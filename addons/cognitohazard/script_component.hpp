#define COMPONENT cognito_hazard
#define COMPONENT_BEAUTIFIED Cognito Hazard
#include "\z\misery\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_COGNITOHAZARD
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_COGNITOHAZARD
    #define DEBUG_SETTINGS DEBUG_SETTINGS_COGNITOHAZARD
#endif

#define MACRO_AUDIOSELECTIONS QEGVAR(audio,sound_distantGhost), QEGVAR(audio,sound_distantHellspawn), QEGVAR(audio,sound_distantScream01), QEGVAR(audio,sound_distantScream02), QEGVAR(audio,sound_distantScream03), QEGVAR(audio,sound_distantScream04), QEGVAR(audio,sound_moan), QEGVAR(audio,sound_monsterCall), QEGVAR(audio,sound_monsterDistant), QEGVAR(audio,sound_monsterScream)

#include "\z\misery\addons\main\script_macros.hpp"
