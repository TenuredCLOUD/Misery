#define COMPONENT compat_wzc
#define COMPONENT_BEAUTIFIED Compat WZC
#include "\z\misery\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#define MACRO_WZC_REGULAR_ZOMBIES \
QUOTE(Zombie_G_Crawler_NATO), \
QUOTE(Zombie_G_Shambler_NATO), \
QUOTE(Zombie_G_RA_NATO), \
QUOTE(Zombie_G_RC_NATO), \
QUOTE(Zombie_G_Shooter_NATO), \
QUOTE(Zombie_G_Walker_NATO)

#define MACRO_WZC_SPECIAL_ZOMBIES \
QUOTE(Zombie_Special_GREENFOR_Boomer), \
QUOTE(WBK_SpecialZombie_Corrupted_1), \
QUOTE(Zombie_Special_GREENFOR_Leaper_1), \
QUOTE(Zombie_Special_GREENFOR_Leaper_2), \
QUOTE(Zombie_Special_GREENFOR_Screamer)

#define MACRO_WZC_SPECIAL \
QUOTE(WBK_Goliaph_2), \
QUOTE(WBK_SpecialZombie_Smasher_1), \
QUOTE(WBK_SpecialZombie_Smasher_Hellbeast_1), \
QUOTE(WBK_SpecialZombie_Smasher_Acid_1)

#ifdef DEBUG_ENABLED_COMPAT_WZC
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_COMPAT_WZC
    #define DEBUG_SETTINGS DEBUG_SETTINGS_COMPAT_WZC
#endif

#include "\z\misery\addons\main\script_macros.hpp"
