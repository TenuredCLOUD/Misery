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
QUOTE(ACE_heartbeat_fast_1), \
QUOTE(ACE_heartbeat_fast_2), \
QUOTE(ACE_heartbeat_fast_3)

#define MACRO_PSYCHOSIS_BREATH \
QUOTE(ace_advanced_fatigue_breathLow0), \
QUOTE(ace_advanced_fatigue_breathLow1), \
QUOTE(ace_advanced_fatigue_breathLow2), \
QUOTE(ace_advanced_fatigue_breathLow3), \
QUOTE(ace_advanced_fatigue_breathLow4), \
QUOTE(ace_advanced_fatigue_breathLow5), \
QUOTE(ace_advanced_fatigue_breathMid0), \
QUOTE(ace_advanced_fatigue_breathMid1), \
QUOTE(ace_advanced_fatigue_breathMid2), \
QUOTE(ace_advanced_fatigue_breathMid3), \
QUOTE(ace_advanced_fatigue_breathMid4), \
QUOTE(ace_advanced_fatigue_breathMid5), \
QUOTE(ace_advanced_fatigue_breathMax0), \
QUOTE(ace_advanced_fatigue_breathMax1), \
QUOTE(ace_advanced_fatigue_breathMax2), \
QUOTE(ace_advanced_fatigue_breathMax3), \
QUOTE(ace_advanced_fatigue_breathMax4), \
QUOTE(ace_advanced_fatigue_breathMax5)

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_PSYCHOSIS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_PSYCHOSIS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_PSYCHOSIS
#endif

#include "\z\misery\addons\main\script_macros.hpp"
