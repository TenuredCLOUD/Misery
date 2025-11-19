private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Ambient Webknight Zombies & Creatures", "Enables random spawning of creatures"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(clusterSize),
    "SLIDER",
    ["Cluster size", "Possible amount of creatures to spawn each cycle"],
    _category,
    [1, 20, 5, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxPopulation),
    "SLIDER",
    ["Maximum population", "Maximum creatures allowed to spawn"],
    _category,
    [1, 150, 15, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(spawnChance),
    "SLIDER",
    ["Spawn Chance - Overall", "Spawn chance for creatures, to be generated"],
    _category,
    [0, 100, 75, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(nightOnly),
    "CHECKBOX",
    ["Night only", "Allows special types to only spawn at night time"],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(spawnChanceSpecial),
    "SLIDER",
    ["Chance - Special infected", "Spawn chance for special infected (screamers, etc...)"],
    _category,
    [0, 100, 15, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(spawnChanceGoliath),
    "SLIDER",
    ["Chance - Goliath & Smashers", "Spawn chance for goliath and smashers"],
    _category,
    [0, 100, 1, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(clothingCiv),
    "EDITBOX",
    ["Civilian clothing", "Possible civilian clothes for zombies"],
    _category,
    "['U_C_Poor_1','U_C_Poor_2','U_C_Poloshirt_blue','U_C_Poloshirt_burgundy','U_C_Poloshirt_redwhite','U_C_Poloshirt_salmon','U_C_Poloshirt_striped','U_C_Poloshirt_tricolour','U_C_WorkerCoveralls']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(clothingMil),
    "EDITBOX",
    ["Military clothing", "Possible military clothes for zombies"],
    _category,
    "['U_B_CombatUniform_mcam','U_B_CombatUniform_mcam_tshirt']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(clothingChance),
    "SLIDER",
    ["Clothing Chance", "Chance for civilian clothing vs military clothing (ex. 100% = always civilian clothing)"],
    _category,
    [0, 100, 90, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(headgearCiv),
    "EDITBOX",
    ["Headgear Civilian", "Possible civilian headgear for zombies"],
    _category,
    "['H_Cap_blk','H_Cap_blu','H_Cap_grn','H_Cap_red','H_Cap_oli']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(headgearMil),
    "EDITBOX",
    ["Headgear Military", "Possible military headgear for zombies"],
    _category,
    "['H_HelmetB','H_HelmetB_black']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(headgearChance),
    "SLIDER",
    ["Headgear Chance", "Chance for headgear to spawn on zombies"],
    _category,
    [0, 100, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(facewearCiv),
    "EDITBOX",
    ["Facewear Civilian", "Possible civilian facewear for zombies"],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(facewearMil),
    "EDITBOX",
    ["Facewear Military", "Possible military facewear for zombies"],
    _category,
    "['G_Balaclava_Tropentarn','G_Balaclava_Flecktarn']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(facewearChance),
    "SLIDER",
    ["Facewear Chance", "Chance for facewear to spawn on zombies"],
    _category,
    [0, 100, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(vestCiv),
    "EDITBOX",
    ["Vests Civilian", "Possible civilian vests for zombies"],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(vestMil),
    "EDITBOX",
    ["Vests Military", "Possible military vests for zombies"],
    _category,
    "['V_HarnessO_brn','V_HarnessOGL_gry','V_TacVest_camo','V_TacVest_blk_POLICE']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(vestChance),
    "SLIDER",
    ["Vest Chance", "Chance for vests to spawn on zombies"],
    _category,
    [0, 100, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(bagCiv),
    "EDITBOX",
    ["Bags Civilian", "Possible civilian bags for zombies"],
    _category,
    "['B_CivilianBackpack_01_Everyday_Black_F','B_CivilianBackpack_01_Sport_Blue_F','B_CivilianBackpack_01_Sport_Green_F','B_CivilianBackpack_01_Sport_Red_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(bagMil),
    "EDITBOX",
    ["Bags Military", "Possible military bags for zombies"],
    _category,
    "['B_FieldPack_oli','B_FieldPack_blk','B_AssaultPack_blk']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(bagChance),
    "SLIDER",
    ["Bag Chance", "Chance for bags to spawn on zombies"],
    _category,
    [0, 100, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(itemsCiv),
    "EDITBOX",
    ["Items Civilian", "Possible civilian items for zombies"],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(itemsMil),
    "EDITBOX",
    ["Items Military", "Possible military items for zombies"],
    _category,
    "['FirstAidKit','ItemMap','ItemWatch']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(itemsChance),
    "SLIDER",
    ["Items Chance", "Chance for items to spawn on zombies"],
    _category,
    [0, 100, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(weapons),
    "EDITBOX",
    ["Weapons list", "Possible weapons for triggerman zombie types"],
    _category,
    "['arifle_MX_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(infectionEnabled),
    "CHECKBOX",
    ["Zombie infection", "Enables infection chance from zombies"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(infectionChance),
    "SLIDER",
    ["Infection Chance", "Infection chance from zombies"],
    _category,
    [0, 100, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(minimumDistance),
    "SLIDER",
    ["Minimum Distance", "Minimum distance groups can spawn from players"],
    _category,
    [150, 15000, 750, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maximumDistance),
    "SLIDER",
    ["Maximum Distance", "Maximum distance groups can spawn from players"],
    _category,
    [150, 15000, 750, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(safeDistance),
    "SLIDER",
    ["Safe distance", "Minimum distance at which creatures can spawn from other players"],
    _category,
    [25, 5000, 200, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(deletionDistance),
    "SLIDER",
    ["Deletion distance", "Distance from players at which creatures will be deleted"],
    _category,
    [25, 20000, 200, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(cycleLength),
    "LIST",
    ["Spawn check interval", "Time in seconds between spawn checks"],
    _category,
    [[30, 60, 120, 180, 300], ["30 seconds", "1 Minute", "2 Minutes", "3 Minutes", "5 Minutes"], 0],
    1,
    {},
    true
] call CBA_fnc_addSetting;
