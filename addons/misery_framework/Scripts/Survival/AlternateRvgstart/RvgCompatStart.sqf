/*
Misery alternate RVG start (starts compatibility for Misery w/ Ravage)
Permission before use / alteration was requested explicitely from Haleks 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if !(hasInterface) exitWith {};
//enableTeamSwitch false;
rvg_tents_folded = [
"rvg_foldedTent",
"rvg_foldedTent_grey",
"rvg_foldedTent_blue"
];
rvg_tents_unpacked = [
"rvg_dome_tent_grn",
"rvg_dome_tent_gry",
"rvg_dome_tent_blu"
];
rvg_animals = [
"Rabbit_F",
"Goat_random_F",
"Sheep_random_F",
"Hen_random_F",
"Cock_random_F",
"WildBoar_F",
"jn_buffel"
];
rvg_animalsArray = [
["Rabbit_F", "Rabbit_"],
["Goat_random_F", "Sheep_"],
["Sheep_random_F", "Sheep_"],
["Hen_random_F", "Chicken_"],
["Cock_random_F", "Chicken_"],
["WildBoar_F", "Boar_"],
["jn_buffel", "Buffalo_"]
];
rvg_rawmeat = [
"rvg_Rabbit_Meat",
"rvg_Chicken_Meat",
"rvg_Sheep_Meat",
"rvg_Boar_Meat",
"rvg_Buffalo_Meat"
];
rvg_food = [
["rvg_beans", 30, 0, 0.075, true],//classname, nutr.,rad.,health,canned
["rvg_bacon", 30, 0, 0.075, true],
["rvg_milk", 25, 10, 0.075, false],
["rvg_rice", 25, 10, 0.075, false],
["rvg_rustyCan", 15, 500, 0.05, true],
["rvg_Rabbit_Meat", 20, 500, 0, false],
["rvg_Rabbit_Meat_Cooked", 35, 500, 0.075, false],
["rvg_Chicken_Meat", 20, 500, 0, false],
["rvg_Chicken_Meat_Cooked", 35, 500, 0.075, false],
["rvg_Sheep_Meat", 30, 500, 0, false],
["rvg_Sheep_Meat_Cooked", 45, 500, 0.075, false],
["rvg_Boar_Meat", 60, 500, 0, false],
["rvg_Boar_Meat_Cooked", 75, 500, 0.2, false],
["rvg_Buffalo_Meat_Cooked", 100, 500, 0.3, false]
];
rvg_drink = [
["rvg_spirit", 50, 50, 0.04],//classname, hydr.,rad.,health
["rvg_franta", 50, 50, 0.04],
["rvg_plasticBottle", 25, 500, 0.04],
["rvg_plasticBottlePurified", 50, 0, 0.05],
["rvg_canteen", 25, 500, 0.04],
["rvg_canteenPurified", 50, 0, 0.05]
];
rvg_containers = [
"rvg_plasticBottleEmpty",
"rvg_canteenEmpty",
"rvg_rustyCanEmpty",
"rvg_beansEmpty",
"rvg_baconEmpty",
"rvg_spiritEmpty",
"rvg_frantaEmpty"
];
rvg_combustibles = [
"rvg_money",
"rvg_notepad",
"rvg_docFolder"
];
rvg_chemlights = [
"Chemlight_green",
"Chemlight_red",
"Chemlight_blue",
"Chemlight_yellow"
];
antirad_uniforms = [
"U_O_CombatUniform_oucamo",
"U_O_CombatUniform_ocamo",
"U_I_pilotCoveralls",
"U_O_pilotCoveralls",
"U_O_T_Soldier_F",
"U_O_V_Soldier_Viper_F",
"U_O_V_Soldier_Viper_hex_F",
"U_O_Wetsuit_rvg",
"U_B_Wetsuit_rvg",
"U_I_Wetsuit_rvg",
"U_C_CBRN_Suit_01_Blue_F",
"U_B_CBRN_Suit_01_MTP_F",
"U_B_CBRN_Suit_01_Tropic_F",
"U_C_CBRN_Suit_01_White_F",
"U_B_CBRN_Suit_01_Wdl_F",
"U_I_CBRN_Suit_01_AAF_F",
"U_I_E_CBRN_Suit_01_EAF_F",
//skn
"skn_u_nbc_indep_blk",
"skn_u_nbc_indep_blu",
"skn_u_nbc_indep_gre",
"skn_u_nbc_opf_blue",
"skn_u_nbc_opf_red",
"skn_u_nbc_opf_white",
"skn_u_nbc_opf_yellow",
"skn_u_nbc_bluf_mtp",
"skn_u_nbc_bluf_wd"
];
antirad_goggles = [
"mcu2p2_grey",//HD3
"Mask_M40_OD",
"Mask_M40",
"Mask_M50",
"ffaa_brilat_item_nbq",//ffaa
//avon fm12
"avon_ct12_strapless",
"avon_fm12_strapless",
"avon_SF12_strapless",
"avon_ct12",
"avon_fm12",
"avon_SF12",
//skn
"skn_m04_gas_mask_bare_dry",
"skn_m04_gas_mask_blk",
"skn_m04_gas_mask_blu",
"skn_m04_gas_mask_gre",
"skn_m50_gas_mask",
"skn_m50_gas_mask_hood",
"skn_m50_gas_mask_hood_wd",
"skn_s10_balaclava_blue_dry",
"skn_s10_balaclava_red_dry",
"skn_s10_balaclava_white_dry",
"skn_s10_balaclava_yellow_dry",
//w40k
"Ren_Gasmask_02",
"Ren_Gasmask_01",
"DKOKTroopMask",
"DKOKOffMask",
"DKOKGrenMask",
//contact
"G_AirPurifyingRespirator_02_black_F",
"G_AirPurifyingRespirator_02_olive_F",
"G_AirPurifyingRespirator_02_sand_F",
"G_AirPurifyingRespirator_01_F",
"G_RegulatorMask_F",
//gm
"gm_ge_facewear_m65",
"gm_gc_army_facewear_schm41m",
//sog pf
"vn_b_acc_m17_01",
"vn_b_acc_m17_02",
"vn_o_acc_km32_01",
"vn_b_acc_ms22001_01"
];
antirad_vests = [
"V_RebreatherB",
"V_RebreatherIR",
"V_RebreatherIA",
"V_O2Tank",
"V_O2Tank_1"
];
antirad_headgears = [
"H_HelmetO_ViperSP_ghex_F",
"H_HelmetO_ViperSP_hex_F",
"H_PilotHelmetFighter_I",
"H_PilotHelmetFighter_O",
"H_PilotHelmetFighter_B",
"H_PilotHelmetFighter_I_E"
//exomod
/*"AtlasElite_Helmet",
"Atlas_HelmetH",
"Atlas_HelmetK",
"Korean_HelmetKL",
"Marine_HelmetC",
"Marine_HelmetCCII",
"Atlas_HelmetM",
"SentinelRecon_Helmet"*/
];
antirad_packs = [
"B_CombinationUnitRespirator_01_F",
"B_SCBA_01_F"
];

player setVariable ["radiation", player getVariable ["radiation", 0], false]; //false
player setVariable ["radTriggers", player getVariable ["radTriggers", []]];

player addEventHandler ["Respawn", {
	_player = _this select 0;
	_player setVariable ["radiation", 0, false]; //false
}];
