#define COMPONENT psychosis
#define COMPONENT_BEAUTIFIED Psychosis
#include "\z\misery\addons\main\script_mod.hpp"

#define MACRO_PSYCHOSIS_SOUNDS \
QCLASS(audio_sound_stage01), \
QCLASS(audio_sound_spookyAlpha01), \
QCLASS(audio_sound_spookyAlpha02), \
QCLASS(audio_sound_spookyAlpha03), \
QCLASS(audio_sound_spookyBravo01), \
QCLASS(audio_sound_spookyBravo02), \
QCLASS(audio_sound_spookyBravo03), \
QCLASS(audio_sound_spookyBravo04), \
QCLASS(audio_sound_spookyBravo05), \
QCLASS(audio_sound_spookyCharlie01), \
QCLASS(audio_sound_spookyCharlie02), \
QCLASS(audio_sound_spookyCharlie03), \
QCLASS(audio_sound_spookyCharlie04), \
QCLASS(audio_sound_spookyCharlie05), \
QCLASS(audio_sound_spookyCharlie06), \
QCLASS(audio_sound_spookyCharlie07)

#define MACRO_PSYCHOSIS_WEBZC \
QUOTE(Zombie_O_Crawler_CSAT), \
QUOTE(Zombie_O_Shambler_CSAT), \
QUOTE(Zombie_O_RunnerAngry_CSAT), \
QUOTE(Zombie_O_RunnerCalm_CSAT), \
QUOTE(Zombie_O_Shooter_CSAT), \
QUOTE(Zombie_O_Walker_CSAT), \
QUOTE(Zombie_Special_OPFOR_Boomer), \
QUOTE(WBK_SpecialZombie_Corrupted_1), \
QUOTE(WBK_C_ExportClass), \
QUOTE(Zombie_Special_OPFOR_Leaper_1), \
QUOTE(Zombie_Special_OPFOR_Leaper_2), \
QUOTE(Zombie_Special_OPFOR_Screamer), \
QUOTE(WBK_SpecialZombie_Smasher_1), \
QUOTE(WBK_SpecialZombie_Smasher_Hellbeast_1), \
QUOTE(WBK_SpecialZombie_Smasher_Acid_1)

#define MACRO_PSYCHOSIS_HEARTFLUTTER \
QCLASS(heart_5), \
QCLASS(heart_6), \
QCLASS(heart_7), \
QCLASS(heart_8), \
QCLASS(heart_9)

#define MACRO_PSYCHOSIS_BREATH \
QCLASS(breath_high_01), \
QCLASS(breath_high_02), \
QCLASS(breath_high_03), \
QCLASS(breath_high_04), \
QCLASS(breath_high_05), \
QCLASS(breath_high_06), \
QCLASS(breath_high_07), \
QCLASS(breath_high_08), \
QCLASS(breath_high_09), \
QCLASS(breath_high_10)

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_PSYCHOSIS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_PSYCHOSIS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_PSYCHOSIS
#endif

#include "\z\misery\addons\main\script_macros.hpp"
