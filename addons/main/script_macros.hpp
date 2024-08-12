/*
Misery Macros Definitions - preprocesses base values of Gvars + Calculations
Caches values to ram for much faster parsing etc...
Designed specifically for Misery mod
by TenuredCLOUD
*/

#include "\x\cba\addons\main\script_macros_common.hpp"

#include "\x\cba\addons\xeh\script_xeh.hpp"

#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)

#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

// Item List Macros
#define MACRO_NMB_ITEMS "NMIB_Generic_Garage_B", "NMIB_Generic_Garage_D", "NMIB_Generic_Garage_A", "NMIB_Generic_Garage_C", "NMIB_Lockable_Garage_D", "NMIB_Lockable_Garage_B", "NMIB_Lockable_Garage_A", "NMIB_Lockable_Garage_C", "NMIB_Plot", "NMIB_Generic_Door_D", "NMIB_Generic_Door_A", "NMIB_Generic_Door_B", "NMIB_Generic_Door_C", "NMIB_Lockable_Door_C", "NMIB_Lockable_Door_A", "NMIB_Lockable_Door_D", "NMIB_Lockable_Door_B", "NMIB_Generic_Floor_A", "NMIB_Generic_Foundation", "NMIB_Generic_Ladder", "NMIB_Generic_Ramp_A", "NMIB_Generic_Roof_E", "NMIB_Barricaded_Window_C", "NMIB_Barricaded_Window_B", "NMIB_Barricaded_Window_D", "NMIB_Barricaded_Window_A", "NMIB_Generic_Doorway_D", "NMIB_Generic_Doorway_C", "NMIB_Generic_Doorway_A", "NMIB_Generic_Doorway_B", "NMIB_Generic_Wall0_A", "NMIB_Generic_Wall0_B", "NMIB_Generic_Wall0_C", "NMIB_Generic_Wall0_D", "NMIB_Generic_Wall1_A", "NMIB_Generic_Wall1_D", "NMIB_Generic_Wall1_B", "NMIB_Generic_Wall1_C", "NMIB_Generic_Wall2_C", "NMIB_Generic_Wall2_D", "NMIB_Generic_Wall2_B", "NMIB_Generic_Wall2_A", "NMIB_Generic_Wall3_A", "NMIB_Generic_Wall3_B", "NMIB_Generic_Wall3_C", "NMIB_Generic_Wall3_D", "NMIB_Generic_Window_A", "NMIB_Generic_Window_B", "NMIB_Generic_Window_C", "NMIB_Generic_Window_D", "NMIB_Plot_Workbench"

#define MACRO_FUELSTATIONS "Land_fs_feed_F", "Land_FuelStation_Feed_F", "Land_Ind_TankSmall2", "Land_Ind_TankSmall2_EP1", "Land_A_FuelStation_Feed", "Land_fuelstation", "Land_Ind_FuelStation_Feed_EP1"

#define MACRO_CRAFTINGSTATIONS "Land_Workbench_01_F", "Land_PortableDesk_01_olive_F", "NMIB_Plot_Workbench"

#define MACRO_ARTIFACTS "Misery_artifact01", "Misery_artifact02", "Misery_artifact03", "Misery_artifact04", "Misery_artifact05", "Misery_artifact06", "Misery_artifact07", "Misery_artifact08", "Misery_artifact09", "Misery_artifact10"

#define MACRO_KNIVES "Weap_melee_knife", "Knife_kukri", "Knife_m3", "UNSC_Knife", "UNSC_Knife_reversed", "WBK_survival_weapon_4", "WBK_survival_weapon_4_r", "WBK_survival_weapon_3", "WBK_survival_weapon_3_r"

#define MACRO_FIRETYPES "MetalBarrel_burning_F", "Land_Campfire_F", "Land_FirePlace_F", "FirePlace_burning_F"

//Hunger
#define MIS_HUNGER 100

//Thirst
#define MIS_THIRST 100

//Tiredness
#define MIS_SLEEP 0

//Poison
#define MIS_POISON 0

//Infection
#define MIS_INFECTION 0

//Exposure
#define MIS_EXPOSURE 0

//Fear
#define MIS_FEAR 0

//Gems array
#define MIS_Gem ["Misery_Malachite","Misery_Ruby","Misery_Sapphire","Misery_Amethyst","Misery_Diamond","Misery_Emerald"]

//Fear Ravage calc
#define MISERY_FEARRAVAGE(arg) ((arg) / 10) / 10

//Fear Phantom calc
#define MISERY_FEARPHANTOM(arg) ((arg) / 10) / 10

//Fear DSA Spook calc
#define MISERY_FEARDSASPOOK(arg) ((arg) / 10) / 10

//Fear Night calc
#define MISERY_FEARNIGHT(arg) ((arg) / 10) / 10

//Fear Psyfield calc
#define MISERY_FEARPSYFIELD(arg) ((arg) / 10) / 10

//Fear Psyfield NO PROTECT calc
#define MISERY_FEARNOPROPSYFIELD ((1000) / 10) / 10

//Radiation nutr. loss calcs
#define MISERY_SCALEDNUTRLOSS(arg) ((arg) / 100) / 10

#define MISERY_SCALEDSTAMLOSS(arg) ((arg) / 10) / 10

//Temperature lower calc
#define MISERY_COLDEXPOSURE(arg) ((20 - arg) / 10) / 10

//Temperature warming up calc
#define MISERY_WARMUP(arg) (arg / 10) / 10

//Temperature cooling off calc
#define MISERY_COOLDOWN(arg) (arg / 10) / 10

//Temperature overtemp calc
#define MISERY_OVEREXPOSURE(arg) (arg / 10) / 10

//Temperature sick / fever calc
#define MISERY_SICKEXPOSURE(arg) (arg / 10) / 10

//Temperature near fire or in vehicle calc
#define MISERY_FIREORVEH(arg) (((20 - arg) * 2) / 5) / 5

//Temperature near fire or in vehicle calc *sick
#define MISERY_FIREORVEH_SICK(arg) ((arg) / 10) / 10

//Temperature isinbuilding calc
#define MISERY_TEMPISINBUILDING(arg) (((20 - arg) * 2) / 8) / 8

//Temperature isinbuilding calc *sick
#define MISERY_TEMPISINBUILDING_SICK(arg) ((arg) / 12) / 12

//Temperature cold water calc
#define MISERY_COLDWATER(arg) ((20 - arg) / 2) / 2

//Weight deficiency calc
#define MISERY_WEIGHTCALC(arg) (((arg) / 10) / 10) / 10

//remoteExec
#define MIS_REXEC(arg1,arg2,arg3) arg1 remoteExec ['arg2', arg3];

//IMS animations for compat:
#define IMSSPRINT ["am_kulak_sprintf", "melee_sprintf", "melee_sprintfl","melee_sprintfr"]

#define CT_STATIC   0
#define ST_PICTURE  0x30

#define ST_LEFT     0x00
#define ST_LEFT        0
#define ST_RIGHT    1
#define ST_CENTER    2
#define ST_UP        3
#define ST_DOWN        4
#define ST_VCENTER    5
#define ST_SINGLE    0
#define ST_MULTI    16
#define ST_TITLE_BAR 32
#define ST_PICTURE    48
#define ST_FRAME    64
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144
#define ST_WITH_RECT 160
#define ST_LINE    176
#define ST_SHADOW    256
#define ST_NO_RECT    512

// //Menu Dialog
#define GUI_GRID_X    (0)
#define GUI_GRID_Y    (0)
#define GUI_GRID_W    (0.025)
#define GUI_GRID_H    (0.04)
#define GUI_GRID_WAbs    (1)
#define GUI_GRID_HAbs    (1)

#define Misery_X            0.062
#define Misery_Y            0
#define Misery_H            1
#define Misery_W            1
#define Misery_BUTTON_H        0.069 * Misery_H
#define Misery_BUTTON_W        0.1044 * Misery_W
#define Misery_SPACE        0.005 * Misery_W
#define Misery_COL            (Misery_X + Misery_SPACE)
#define Misery_ROW            (Misery_Y + Misery_SPACE)
#define Misery_COLINC        (Misery_BUTTON_W + Misery_SPACE)
#define Misery_ROWINC        (Misery_BUTTON_H + Misery_SPACE)
#define Misery_TEXTSIZE        0.03
#define Misery_TEXTSIZEMED 0.025
#define Misery_TEXTSIZESMALL 0.015
#define Misery_TEXTSIZEVSMALL 0.01
#define Misery_font        "PuristaMedium"
#define Misery_BUTTONCOLOUR0 "#(argb,8,8,3)color(1,1,1,0)"
#define Misery_BUTTONCOLOUR "#(argb,8,8,3)color(1,1,1,1)"
#define Misery_BUTTONCOLOUR2 "#(argb,8,8,3)color(0,0,0,1)"
#define Misery_BUTTONCOLOUR3 "#(argb,8,8,3)color(0.3,0.3,0.3,1)"
#define Misery_BUTTONCOLOUR4 "#(argb,8,8,3)color(0,0.2,0,0.5)"
#define Misery_BUTTONCOLOUR5 "#(argb,8,8,3)color(0.105,0.105,0.105,0.5)"
#define Misery_BUTTONCOLOUR6 "#(argb,8,8,3)color(0,0.5,0,1)"
#define Misery_BUTTONCOLOUR7 "#(argb,8,8,3)color(0,0,0,0)"
// Nothing (for overwriting)
#define Misery_COLOUR0 {0,0,0,0}
// White
#define Misery_COLOUR1 {1,1,1,1}
// Black
#define Misery_COLOUR2 {0,0,0,1}
#define Misery_COLOUR3 {1,1,1,0.7}
// Grey
#define Misery_COLOUR4 {0.2,0.2,0.2,1}
// Camo green
#define Misery_COLOUR5 {0,0.2,0,1}
// Sickly green
#define Misery_COLOUR6 {0,0.5,0,1}
// Dark grey
#define Misery_COLOUR7 {0.5,0.5,0.5,1}
// Orange
#define Misery_COLOUR8 {0.73,0.24,0.11,1}
#define Misery_align "center"
#define Misery_shadow "true"
// List defines
#define Misery_colorSelect {1, 1, 1, 1}
#define Misery_colorText {1,1,1,1}
#define Misery_colorBackground {0.28,0.28,0.28,0.28}
#define Misery_colorSelect2 {0, 0, 0, 1}
#define Misery_colorSelectBackground {0.95, 0.95, 0.95, 1}
#define Misery_colorSelectBackground2 {1, 1, 1, 0.5}
#define Misery_colorScrollbar {0.2, 0.2, 0.2, 1}
#define Misery_style 2 + 12
#define Misery_tabFx (Misery_COL + (Misery_COLINC * 1.48))
#define Misery_tabFy Misery_ROW + (Misery_ROWINC * 13)
//#define Misery_tabFy Misery_ROW + (Misery_ROWINC * 12.5)
#define Misery_tabFw (Misery_BUTTON_W * 0.32)
#define Misery_tabFh (Misery_BUTTON_H * 0.8)
#define Misery_tabFspace (Misery_BUTTON_W * 0.093)
#define Misery_tabFinc (Misery_tabFw + Misery_tabFspace)
#define Misery_tabY 0.46
// How close the tablet is to the viewer
#define Misery_tabZ 0.2
