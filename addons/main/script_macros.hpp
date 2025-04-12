#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

#define CLASS(var1) DOUBLES(PREFIX,var1)
#define QCLASS(var1) QUOTE(DOUBLES(PREFIX,var1))
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
#define MACRO_ARTIFACTS QCLASS(artifact_01), QCLASS(artifact_02), QCLASS(artifact_03), QCLASS(artifact_04), QCLASS(artifact_05), QCLASS(artifact_06), QCLASS(artifact_07), QCLASS(artifact_08), QCLASS(artifact_09), QCLASS(artifact_10)
#define MACRO_KNIVES "Weap_melee_knife", "Knife_kukri", "Knife_m3", "UNSC_Knife", "UNSC_Knife_reversed", "WBK_survival_weapon_4", "WBK_survival_weapon_4_r", "WBK_survival_weapon_3", "WBK_survival_weapon_3_r"
#define MACRO_FIRETYPES "MetalBarrel_burning_F", "Land_Campfire_F", "Land_FirePlace_F", "FirePlace_burning_F"
#define MACRO_GEMTYPES  QCLASS(malachite), QCLASS(ruby), QCLASS(sapphire), QCLASS(amethyst), QCLASS(diamond), QCLASS(emerald)
#define MACRO_RESPIRATOR_MASKS "g_airpurifyingrespirator_01_f", "g_airpurifyingrespirator_02_black_f", "g_airpurifyingrespirator_02_olive_f", "g_airpurifyingrespirator_02_sand_f"
#define MACRO_RESPIRATOR_MASKS_NOFILTER "g_airpurifyingrespirator_01_nofilter_f", "g_airpurifyingrespirator_02_black_nofilter_f", "g_airpurifyingrespirator_02_olive_nofilter_f", "g_airpurifyingrespirator_02_sand_nofilter_f"
#define MACRO_FACTIONS west, east, civilian, independent
#define MACRO_FACTIONS_BASE_CLASS "B_Survivor_F", "O_G_Survivor_F", "C_man_1", "I_G_Survivor_F"

// Player Status
#define MACRO_PLAYER_DEFAULTS_HIGH 1
#define MACRO_PLAYER_DEFAULTS_LOW 0
#define MACRO_PLAYER_DEFAULTS_TEMP 37

// Calculations - Radiation
#define MACRO_BASE_DOSE 10
#define MACRO_RADIATION_NUTRITIONLOSS(arg) ((arg) / 100) / 10
#define MACRO_RADIATION_STAMINALOSS(arg) ((arg) / 10) / 10

// Calculations - Temperature
#define TEMP_NEUTRAL 20
#define TEMP_MIN -30
#define TEMP_MAX 55
#define EXPOSURE_RATE 0.033
#define HUNGER_RATE 0.00035
#define THIRST_RATE 0.0007
#define NEUTRAL_RATE 0.012
#define SICKNESS_FACTOR 0.5
#define WETNESS_RATE 0.015

// IMS animations for compat:
#define MACRO_ANIMATION_IMS_SPRINT "am_kulak_sprintf", "melee_sprintf", "melee_sprintfl","melee_sprintfr"

// UI Macros
#define CT_STATIC 0 // Static text/picture
#define CT_BUTTON 1 // Button
#define CT_EDIT 2 // Edit box
#define CT_COMBO 4 // Combo box
#define CT_LISTBOX 5 // List box
#define CT_PROGRESS 8 // Progress bar
#define CT_ACTIVETEXT 11 // Clickable text
#define CT_STRUCTURED_TEXT 13 // Structured text
#define CT_SHORTCUTBUTTON 16 // Button with shortcut
#define CT_CHECKBOX 77 // Checkbox

#define ST_LEFT 0
#define ST_RIGHT 1
#define ST_CENTER 2
#define ST_UP 3
#define ST_DOWN 4
#define ST_VCENTER 5
#define ST_SINGLE 0
#define ST_MULTI 16
#define ST_TITLE_BAR 32
#define ST_PICTURE 48
#define ST_FRAME 64
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144
#define ST_WITH_RECT 160
#define ST_LINE 176
#define ST_SHADOW 256
#define ST_NO_RECT 512
#define ST_HORIZONTAL 0

// Menu Dialog
#define GUI_GRID_X (0)
#define GUI_GRID_Y (0)
#define GUI_GRID_W (0.025)
#define GUI_GRID_H (0.04)
#define GUI_GRID_WAbs (1)
#define GUI_GRID_HAbs (1)

#define UI_MACRO_X 0.062
#define UI_MACRO_Y 0
#define UI_MACRO_H 1
#define UI_MACRO_W 1
#define UI_MACRO_BUTTON_H 0.069 * UI_MACRO_H
#define UI_MACRO_BUTTON_W 0.1044 * UI_MACRO_W
#define UI_MACRO_SPACE 0.005 * UI_MACRO_W
#define UI_MACRO_COL (UI_MACRO_X + UI_MACRO_SPACE)
#define UI_MACRO_ROW (UI_MACRO_Y + UI_MACRO_SPACE)
#define UI_MACRO_COLINC (UI_MACRO_BUTTON_W + UI_MACRO_SPACE)
#define UI_MACRO_ROWINC (UI_MACRO_BUTTON_H + UI_MACRO_SPACE)
#define UI_MACRO_TEXTSIZE 0.03
#define UI_MACRO_TEXTSIZEMED 0.025
#define UI_MACRO_TEXTSIZESMALL 0.015
#define UI_MACRO_TEXTSIZEVSMALL 0.01
#define UI_MACRO_FONT "PuristaMedium"
#define UI_MACRO_BUTTON_COLOR "#(argb,8,8,3)color(1,1,1,1)"
#define UI_MACRO_BUTTON_COLOR0 "#(argb,8,8,3)color(1,1,1,0)"
#define UI_MACRO_BUTTON_COLOR2 "#(argb,8,8,3)color(0,0,0,1)"
#define UI_MACRO_BUTTON_COLOR3 "#(argb,8,8,3)color(0.3,0.3,0.3,1)"
#define UI_MACRO_BUTTON_COLOR4 "#(argb,8,8,3)color(0,0.2,0,0.5)"
#define UI_MACRO_BUTTON_COLOR5 "#(argb,8,8,3)color(0.105,0.105,0.105,0.5)"
#define UI_MACRO_BUTTON_COLOR6 "#(argb,8,8,3)color(0,0.5,0,1)"
#define UI_MACRO_BUTTON_COLOR7 "#(argb,8,8,3)color(0,0,0,0)"

// Nothing (for overwriting)
#define UI_MACRO_COLOR0 {0,0,0,0}
// White
#define UI_MACRO_COLOR1 {1,1,1,1}
// Black
#define UI_MACRO_COLOR2 {0,0,0,1}
#define UI_MACRO_COLOR3 {1,1,1,0.7}
// Grey
#define UI_MACRO_COLOR4 {0.2,0.2,0.2,1}
// Camo green
#define UI_MACRO_COLOR5 {0,0.2,0,1}
// Sickly green
#define UI_MACRO_COLOR6 {0,0.5,0,1}
// Dark grey
#define UI_MACRO_COLOR7 {0.5,0.5,0.5,1}
// Orange
#define UI_MACRO_COLOR8 {0.73,0.24,0.11,1}

// List defines
#define UI_MACRO_COLORTEXT {1,1,1,1}
#define UI_MACRO_COLORBACKGROUND {0.28,0.28,0.28,0.28}
#define UI_MACRO_COLORSELECT {1, 1, 1, 1}
#define UI_MACRO_COLORSELECT2 {0, 0, 0, 1}
#define UI_MACRO_COLORSELECTBACKGROUND {0.95, 0.95, 0.95, 1}
#define UI_MACRO_COLORSELECTBACKGROUND2 {1, 1, 1, 0.5}
#define UI_MACRO_COLORSCROLLBAR {0.2, 0.2, 0.2, 1}
#define UI_MACRO_STYLE 2 + 12
#define UI_MACRO_TABFX (UI_MACRO_COL + (UI_MACRO_COLINC * 1.48))
#define UI_MACRO_TABFY UI_MACRO_ROW + (UI_MACRO_ROWINC * 13)
#define UI_MACRO_TABFW (UI_MACRO_BUTTON_W * 0.32)
#define UI_MACRO_TABFH (UI_MACRO_BUTTON_H * 0.8)
#define UI_MACRO_TABFSPACE (UI_MACRO_BUTTON_W * 0.093)
#define UI_MACRO_TABFINC (UI_MACRO_TABFW + UI_MACRO_TABFSPACE)
#define UI_MACRO_TABY 0.46

// How close the tablet is to the viewer
#define UI_MACRO_TABZ 0.2
