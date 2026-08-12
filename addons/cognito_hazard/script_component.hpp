#define COMPONENT cognito_hazard
#define COMPONENT_BEAUTIFIED Cognito Hazard
#include "\z\misery\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#define MACRO_STATICWEIRD_SOUNDS QEGVAR(audio,sound_staticWeird01), QEGVAR(audio,sound_staticWeird02), QEGVAR(audio,sound_staticWeird03), QEGVAR(audio,sound_staticWeird04), QEGVAR(audio,sound_staticWeird07), QEGVAR(audio,sound_staticWeird08), QEGVAR(audio,sound_staticWeird09), QEGVAR(audio,sound_staticWeird10)
#define MACRO_PHANTOM_ENTITIES QUOTE(myst_phantom_hidden_f), QUOTE(myst_phantom_naked_f)
#define MACRO_WZC_ENTITIES \
QUOTE(Zombie_Special_GREENFOR_Boomer), \
QUOTE(WBK_SpecialZombie_Corrupted_1), \
QUOTE(WBK_Goliaph_2), \
QUOTE(Zombie_Special_GREENFOR_Leaper_1), \
QUOTE(Zombie_Special_GREENFOR_Leaper_2), \
QUOTE(Zombie_Special_GREENFOR_Screamer), \
QUOTE(WBK_SpecialZombie_Smasher_1), \
QUOTE(WBK_SpecialZombie_Smasher_Hellbeast_1), \
QUOTE(WBK_SpecialZombie_Smasher_Acid_1)

#ifdef DEBUG_ENABLED_COGNITOHAZARD
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_COGNITOHAZARD
    #define DEBUG_SETTINGS DEBUG_SETTINGS_COGNITOHAZARD
#endif

#define MACRO_AUDIOSELECTIONS QEGVAR(audio,sound_distantGhost), QEGVAR(audio,sound_distantHellspawn), QEGVAR(audio,sound_distantScream01), QEGVAR(audio,sound_distantScream02), QEGVAR(audio,sound_distantScream03), QEGVAR(audio,sound_distantScream04), QEGVAR(audio,sound_moan), QEGVAR(audio,sound_monsterCall), QEGVAR(audio,sound_monsterDistant), QEGVAR(audio,sound_monsterScream)

#include "\z\misery\addons\main\script_macros.hpp"
