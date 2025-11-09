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

// Maintenance
#define MACRO_MAINTENANCE_REPAIR [ \
    [QUOTE(optic), QCLASS(glassRepairKit)], \
    [QUOTE(glass), QCLASS(glassRepairKit)], \
    [QUOTE(light), QCLASS(electronicRepairKit)], \
    [QUOTE(avionics), QCLASS(electronicRepairKit)], \
    [QUOTE(track), QCLASS(trackRepairKit)], \
    [QUOTE(engine), QCLASS(enginePartsKit)], \
    [QUOTE(starter), QCLASS(enginePartsKit)], \
    [QUOTE(fuel), QCLASS(fuelSystemKit)], \
    [QUOTE(hull), QCLASS(metalFabricationKit)], \
    [QUOTE(slat), QCLASS(metalFabricationKit)], \
    [QUOTE(body), QCLASS(metalFabricationKit)], \
    [QUOTE(rotor), QCLASS(rotorRepairKit)], \
    [QUOTE(missiles), QCLASS(weaponSystemKit)], \
    [QUOTE(winch), QCLASS(winchRepairKit)], \
    [QUOTE(transmission), QCLASS(transmissionRepairKit)], \
    [QUOTE(hydraulic), QCLASS(hydraulicRepairKit)], \
    [QUOTE(gear), QCLASS(landingGearKit)], \
    [QUOTE(stabilizer), QCLASS(metalFabricationKit)], \
    [QUOTE(aileron), QCLASS(aerodynamicControlKit)], \
    [QUOTE(rudder), QCLASS(aerodynamicControlKit)], \
    [QUOTE(elevator), QCLASS(aerodynamicControlKit)], \
    [QUOTE(tail), QCLASS(metalFabricationKit)], \
    [QUOTE(staticport), QCLASS(electronicRepairKit)], \
    [QUOTE(pitottube), QCLASS(electronicRepairKit)], \
    [QUOTE(turret), QCLASS(weaponSystemKit)], \
    [QUOTE(gun), QCLASS(weaponSystemKit)], \
    [QUOTE(comturret), QCLASS(weaponSystemKit)], \
    [QUOTE(comgun), QCLASS(weaponSystemKit)], \
    [QUOTE(flare), QCLASS(countermeasureKit)], \
    [QUOTE(wheel), ""] \
]

#define MACRO_MAINTENANCE_SCAVENGE [ \
    [QUOTE(optic), ""], \
    [QUOTE(glass), ""], \
    [QUOTE(light), QCLASS(electronicRepairKit)], \
    [QUOTE(avionics), QCLASS(electronicRepairKit)], \
    [QUOTE(track), QCLASS(trackRepairKit)], \
    [QUOTE(engine), QCLASS(enginePartsKit)], \
    [QUOTE(starter), QCLASS(enginePartsKit)], \
    [QUOTE(fuel), QCLASS(fuelSystemKit)], \
    [QUOTE(hull), ""], \
    [QUOTE(slat), ""], \
    [QUOTE(body), ""], \
    [QUOTE(rotor), ""], \
    [QUOTE(missiles), QCLASS(weaponSystemKit)], \
    [QUOTE(winch), QCLASS(winchRepairKit)], \
    [QUOTE(transmission), QCLASS(transmissionRepairKit)], \
    [QUOTE(hydraulic), ""], \
    [QUOTE(gear), ""], \
    [QUOTE(stabilizer), ""], \
    [QUOTE(aileron), QCLASS(aerodynamicControlKit)], \
    [QUOTE(rudder), QCLASS(aerodynamicControlKit)], \
    [QUOTE(elevator), QCLASS(aerodynamicControlKit)], \
    [QUOTE(tail), ""], \
    [QUOTE(staticport), QCLASS(electronicRepairKit)], \
    [QUOTE(pitottube), QCLASS(electronicRepairKit)], \
    [QUOTE(turret), QCLASS(weaponSystemKit)], \
    [QUOTE(gun), QCLASS(weaponSystemKit)], \
    [QUOTE(comturret), QCLASS(weaponSystemKit)], \
    [QUOTE(comgun), QCLASS(weaponSystemKit)], \
    [QUOTE(flare), QCLASS(countermeasureKit)], \
    [QUOTE(wheel), QCLASS(spareTire)] \
]

#define MACRO_TANK_CLASSES ["B_MBT_01_cannon_F", \
"B_APC_Wheeled_01_cannon_F", \
"B_APC_Tracked_01_CRV_F", \
"B_APC_Tracked_01_rcws_F", \
"B_AFV_Wheeled_01_cannon_F", \
"B_T_APC_Wheeled_01_cannon_F", \
"B_T_APC_Tracked_01_CRV_F", \
"B_T_APC_Tracked_01_rcws_F", \
"B_T_AFV_Wheeled_01_cannon_F", \
"B_MBT_01_TUSK_F", \
"B_T_MBT_01_cannon_F", \
"B_T_MBT_01_TUSK_F", \
"B_T_AFV_Wheeled_01_up_cannon_F", \
"O_APC_Tracked_02_cannon_F", \
"O_APC_Wheeled_02_rcws_v2_F", \
"O_T_APC_Tracked_02_cannon_ghex_F", \
"O_T_APC_Wheeled_02_rcws_v2_ghex_F", \
"O_MBT_02_cannon_F", \
"O_MBT_02_railgun_F", \
"O_MBT_04_cannon_F", \
"O_MBT_04_command_F", \
"O_T_MBT_02_cannon_ghex_F", \
"O_T_MBT_02_railgun_ghex_F", \
"O_T_MBT_04_cannon_F", \
"O_T_MBT_04_command_F", \
"I_APC_Wheeled_03_cannon_F", \
"I_APC_tracked_03_cannon_F", \
"I_E_APC_tracked_03_cannon_F", \
"I_LT_01_AT_F", \
"I_LT_01_scout_F", \
"I_LT_01_cannon_F", \
"I_MBT_03_cannon_F"]

// Crafting stations / Fuel stations
#define MACRO_FUELSTATIONS_LAND "Land_fs_feed_F", "Land_FuelStation_Feed_F", "Land_Ind_TankSmall2", "Land_Ind_TankSmall2_EP1", "Land_A_FuelStation_Feed", "Land_fuelstation", "Land_Ind_FuelStation_Feed_EP1"
#define MACRO_FUELSTATIONS_AIR "B_Slingload_01_Fuel_F", "StorageBladder_01_fuel_forest_F", "StorageBladder_01_fuel_sand_F", "Land_Pod_Heli_Transport_04_fuel_F"
#define MACRO_CRAFTINGSTATIONS "Land_Workbench_01_F", "Land_PortableDesk_01_olive_F"

// Beds
#define MACRO_BEDS \
"Land_WoodenBed_01_F", \
"Land_Sun_chair_green_F", \
"Land_ArmChair_01_F", \
"Land_Sleeping_bag_F", \
"Land_Sleeping_bag_blue_F", \
"Land_Sleeping_bag_brown_F", \
"Land_Ground_sheet_F", \
"Land_Ground_sheet_blue_F", \
"Land_Ground_sheet_khaki_F", \
"Land_Ground_sheet_OPFOR_F", \
"Land_Ground_sheet_yellow_F", \
"CUP_bed_big", \
"CUP_bed_husbands", \
"CUP_vojenska_palanda", \
"CUP_postel_manz_kov", \
"CUP_postel_panelak1", \
"CUP_postel_panelak2", \
"CUP_armchair", \
"CUP_lobby_chair", \
"CUP_Church_chair"

#define MACRO_BED_MODELS \
"woodenbed_01_f.p3d", \
"bed_big_a.p3d", \
"bed_husbands.p3d", \
"vojenska_palanda.p3d", \
"postel_manz_kov.p3d", \
"sofa_01_f.p3d", \
"Land_ArmChair_01_F", \
"armchair.p3d", \
"armchair_big.p3d", \
"postel_panelak1.p3d", \
"postel_panelak2.p3d", \
"sleeping_bag_f.p3d", \
"sleeping_bag_blue_f.p3d", \
"sleeping_bag_brown_f.p3d", \
"ground_sheet_f.p3d", \
"ground_sheet_blue_f.p3d", \
"ground_sheet_khaki_f.p3d", \
"ground_sheet_opfor_f.p3d", \
"ground_sheet_yellow_f.p3d"

// Door locks - building models that don't lock
#define MACRO_NODOORLOCK_MODELS \
"ds_housev_1t.p3d", \
"shed_w03.p3d", \
"ind_garage01.p3d", \
"a_office02.p3d", \
"strazni_vez.p3d", \
"ds_housev_2t1.p3d", \
"shed_m03.p3d", \
"shed_w02.p3d", \
"misc_waterstation.p3d", \
"ds_housev_2i.p3d", \
"ds_housev_2l.p3d", \
"shed_01_f.p3d", \
"ds_housev_3i1.p3d", \
"sara_zluty_statek_in.p3d", \
"ds_housev_3i4.p3d", \
"ds_housev_3i2.p3d", \
"ds_housev_1l2.p3d", \
"sara_domek_zluty.p3d", \
"church_03.p3d", \
"shed_w01.p3d", \
"shed_m01.p3d", \
"barn_metal.p3d", \
"nav_boathouse.p3d", \
"ds_housev_2t2.p3d", \
"ds_housev_3i3.p3d", \
"shed_wooden.p3d", \
"a_tvtower_base.p3d", \
"garaz_long_open.p3d", \
"budova4_in.p3d", \
"ind_pec_02.p3d", \
"rail_station_big_f.p3d", \
"a_hospital.p3d", \
"a_office02.p3d"

// Artifacts
#define MACRO_ARTIFACTS QCLASS(artifact_01), QCLASS(artifact_02), QCLASS(artifact_03), QCLASS(artifact_04), QCLASS(artifact_05), QCLASS(artifact_06), QCLASS(artifact_07), QCLASS(artifact_08), QCLASS(artifact_09), QCLASS(artifact_10)

// Can openers
#define MACRO_CANTOOLS QCLASS(canOpener), QCLASS(guttingKnife), "rvg_guttingKnife", "rvg_canOpener"

// Knifes
#define MACRO_KNIVES \
QCLASS(guttingKnife), \
"Weap_melee_knife", \
"Knife_kukri", \
"Knife_m3", \
"UNSC_Knife", \
"UNSC_Knife_reversed", \
"WBK_survival_weapon_4", \
"WBK_survival_weapon_4_r", \
"WBK_survival_weapon_3", \
"WBK_survival_weapon_3_r", \
"tsp_meleeWeapon_ak", \
"tsp_meleeWeapon_kabar", \
"tsp_meleeWeapon_kitchen", \
"tsp_meleeWeapon_m9", \
"tsp_meleeWeapon_okc", \
"tsp_meleeWeapon_socp", \
"tsp_meleeWeapon_sog" \

// Axes
#define MACRO_AXES \
"WBK_axe", \
"WBK_brush_axe", \
"WBK_craftedAxe", \
"FireAxe", \
"Axe", \
"tsp_meleeWeapon_splittingaxe", \
"tsp_meleeWeapon_fireaxe"

// Fire crafting
#define MACRO_FIRETYPES "MetalBarrel_burning_F", "Land_Campfire_F", "Land_FirePlace_F", "FirePlace_burning_F"
#define MACRO_FIRE_TINDER QCLASS(tinder), "acex_intelitems_notepad", "rvg_money", "rvg_notepad", "rvg_docFolder"
#define MACRO_FIRE_FUEL QCLASS(woodensticks), QCLASS(firewood)
#define MACRO_FIRE_IGNITION QCLASS(lighter), QCLASS(matchBox)

// Vehicle types
#define MACRO_VEHICLETYPES "Car", "Tank", "Air", "Ship"

// Houses / Loot
#define MACRO_BUILDINGTYPES "House", "Building"

// Foliage / Forestry
#define MACRO_FOLIAGETYPES "TREE", "SMALL TREE", "BUSH"

// Mining
#define MACRO_GEMTYPES QCLASS(malachite), QCLASS(ruby), QCLASS(sapphire), QCLASS(amethyst), QCLASS(diamond), QCLASS(emerald)

// Gasmasks
#define MACRO_RESPIRATOR_MASKS "g_airpurifyingrespirator_01_f", "g_airpurifyingrespirator_02_black_f", "g_airpurifyingrespirator_02_olive_f", "g_airpurifyingrespirator_02_sand_f"
#define MACRO_RESPIRATOR_MASKS_NOFILTER "g_airpurifyingrespirator_01_nofilter_f", "g_airpurifyingrespirator_02_black_nofilter_f", "g_airpurifyingrespirator_02_olive_nofilter_f", "g_airpurifyingrespirator_02_sand_nofilter_f"

// Fuel cans
#define MACRO_FUEL_CANS QCLASS(petrol), QCLASS(diesel), QCLASS(jetFuel)
#define MACRO_FUEL_CANS_EMPTY QCLASS(petrolEmpty), QCLASS(dieselEmpty), QCLASS(jetFuelEmpty)

// Ambient AI
#define MACRO_FACTIONS west, east, civilian, independent
#define MACRO_FACTIONS_BASE_CLASS "B_Survivor_F", "O_G_Survivor_F", "C_man_1", "I_G_Survivor_F"

// Animal processing / Field dressing
#define MACRO_FIELDDRESS_SKINSOUNDS QEGVAR(audio,sound_skinning01), QEGVAR(audio,sound_skinning02), QEGVAR(audio,sound_skinning03)
#define MACRO_FIELDDRESS_SAWSOUNDS QEGVAR(audio,sound_boneSaw), QEGVAR(audio,sound_cut01), QEGVAR(audio,sound_cut02), QEGVAR(audio,sound_cut03)
#define MACRO_FIELDDRESS_ANIMALTYPES "Sheep_random_F", "Goat_random_F", "Cock_random_F", "Hen_random_F", "Rabbit_F"

// Player Status
#define MACRO_PLAYER_DEFAULTS_HIGH 1
#define MACRO_PLAYER_DEFAULTS_LOW 0
#define MACRO_PLAYER_DEFAULTS_TEMP 37

// Calculations - Chemical
#define MACRO_BASE_CHEMICAL_DOSE 1

// Calculations - Radiation
#define MACRO_BASE_DOSE 1
#define MACRO_RADIATION_NUTRITIONLOSS(arg) ((arg) / 10) / 10
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
#define MACRO_ANIMATION_IMS_SPRINT "am_kulak_sprintf", "melee_sprintf", "melee_sprintfl", "melee_sprintfr"

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
#define ST_VERTICAL 1

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
#define UI_MACRO_TEXTSIZE 0.7 * GUI_GRID_H
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
