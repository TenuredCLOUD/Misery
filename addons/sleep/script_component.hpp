#define COMPONENT sleep
#define COMPONENT_BEAUTIFIED Sleep
#include "\z\misery\addons\main\script_mod.hpp"

#define MACRO_BED_MODELS "woodenbed_01_f.p3d", "bed_big_a.p3d", "bed_husbands.p3d", "vojenska_palanda.p3d", "postel_manz_kov.p3d", "sofa_01_f.p3d", "Land_ArmChair_01_F", "armchair.p3d", "armchair_big.p3d", "postel_panelak1.p3d", "postel_panelak2.p3d", "sleeping_bag_f.p3d", "sleeping_bag_blue_f.p3d", "sleeping_bag_brown_f.p3d", "ground_sheet_f.p3d", "ground_sheet_blue_f.p3d", "ground_sheet_khaki_f.p3d", "ground_sheet_opfor_f.p3d", "ground_sheet_yellow_f.p3d"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_SLEEP
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SLEEP
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SLEEP
#endif

#include "\z\misery\addons\main\script_macros.hpp"
