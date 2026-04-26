private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Enabled), LSTRING(EnabledDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(clusterSize),
    "SLIDER",
    [LSTRING(ClusterSize), LSTRING(ClusterSizeDesc)],
    _category,
    [1, 20, 5, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxPopulation),
    "SLIDER",
    [LSTRING(MaxPopulation), LSTRING(MaxPopulationDesc)],
    _category,
    [1, 150, 15, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(spawnChance),
    "SLIDER",
    [LSTRING(SpawnChance), LSTRING(SpawnChanceDesc)],
    _category,
    [0, 100, 75, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(nightOnly),
    "CHECKBOX",
    [LSTRING(NightOnly), LSTRING(NightOnlyDesc)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(spawnChanceSpecial),
    "SLIDER",
    [LSTRING(ChanceSpecial), LSTRING(ChanceSpecialDesc)],
    _category,
    [0, 100, 15, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(spawnChanceGoliath),
    "SLIDER",
    [LSTRING(ChanceGoliath), LSTRING(ChanceGoliathDesc)],
    _category,
    [0, 100, 1, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(clothingCiv),
    "EDITBOX",
    [LSTRING(CivClothing), LSTRING(CivClothing)],
    _category,
    "['U_C_Poor_1','U_C_Poor_2','U_C_Poloshirt_blue','U_C_Poloshirt_burgundy','U_C_Poloshirt_redwhite','U_C_Poloshirt_salmon','U_C_Poloshirt_striped','U_C_Poloshirt_tricolour','U_C_WorkerCoveralls']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(clothingMil),
    "EDITBOX",
    [LSTRING(MilClothing), LSTRING(MilClothing)],
    _category,
    "['U_B_CombatUniform_mcam','U_B_CombatUniform_mcam_tshirt']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(clothingChance),
    "SLIDER",
    [LSTRING(ClothingChance), LSTRING(ClothingChanceDesc)],
    _category,
    [0, 100, 90, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(headgearCiv),
    "EDITBOX",
    [LSTRING(CivHeadgear), LSTRING(CivHeadgear)],
    _category,
    "['H_Cap_blk','H_Cap_blu','H_Cap_grn','H_Cap_red','H_Cap_oli']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(headgearMil),
    "EDITBOX",
    [LSTRING(MilHeadgear), LSTRING(MilHeadgear)],
    _category,
    "['H_HelmetB','H_HelmetB_black']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(headgearChance),
    "SLIDER",
    [LSTRING(HeadgearChance), LSTRING(HeadgearChance)],
    _category,
    [0, 100, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(facewearCiv),
    "EDITBOX",
    [LSTRING(CivFacewear), LSTRING(CivFacewear)],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(facewearMil),
    "EDITBOX",
    [LSTRING(MilFacewear), LSTRING(MilFacewear)],
    _category,
    "['G_Balaclava_Tropentarn','G_Balaclava_Flecktarn']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(facewearChance),
    "SLIDER",
    [LSTRING(FacewearChance), LSTRING(FacewearChance)],
    _category,
    [0, 100, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(vestCiv),
    "EDITBOX",
    [LSTRING(CivVests), LSTRING(CivVests)],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(vestMil),
    "EDITBOX",
    [LSTRING(MilVests), LSTRING(MilVests)],
    _category,
    "['V_HarnessO_brn','V_HarnessOGL_gry','V_TacVest_camo','V_TacVest_blk_POLICE']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(vestChance),
    "SLIDER",
    [LSTRING(VestChance), LSTRING(VestChance)],
    _category,
    [0, 100, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(bagCiv),
    "EDITBOX",
    [LSTRING(CivBags), LSTRING(CivBags)],
    _category,
    "['B_CivilianBackpack_01_Everyday_Black_F','B_CivilianBackpack_01_Sport_Blue_F','B_CivilianBackpack_01_Sport_Green_F','B_CivilianBackpack_01_Sport_Red_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(bagMil),
    "EDITBOX",
    [LSTRING(MilBags), LSTRING(MilBags)],
    _category,
    "['B_FieldPack_oli','B_FieldPack_blk','B_AssaultPack_blk']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(bagChance),
    "SLIDER",
    [LSTRING(BagChance), LSTRING(BagChance)],
    _category,
    [0, 100, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(itemsCiv),
    "EDITBOX",
    [LSTRING(CivItems), LSTRING(CivItems)],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(itemsMil),
    "EDITBOX",
    [LSTRING(MilItems), LSTRING(MilItems)],
    _category,
    "['FirstAidKit','ItemMap','ItemWatch']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(itemsChance),
    "SLIDER",
    [LSTRING(ItemsChance), LSTRING(ItemsChance)],
    _category,
    [0, 100, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(weapons),
    "EDITBOX",
    [LSTRING(WeaponsList), LSTRING(WeaponsListDesc)],
    _category,
    "['arifle_MX_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(infectionEnabled),
    "CHECKBOX",
    [LSTRING(InfectionEnabled), LSTRING(InfectionEnabledDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(zedEnabled),
    "CHECKBOX",
    [LSTRING(Zombification), LSTRING(ZombificationDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(infectionChance),
    "SLIDER",
    [LSTRING(InfectionChance), LSTRING(InfectionChance_ZomDesc)],
    _category,
    [0, 100, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(minimumDistance),
    "SLIDER",
    [LSTRING(MinDist), LSTRING(MinDistDesc)],
    _category,
    [150, 15000, 750, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maximumDistance),
    "SLIDER",
    [LSTRING(MaxDist), LSTRING(MaxDistDesc)],
    _category,
    [150, 15000, 750, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(safeDistance),
    "SLIDER",
    [LSTRING(SafeDist), LSTRING(SafeDistDesc)],
    _category,
    [25, 5000, 200, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(deletionDistance),
    "SLIDER",
    [LSTRING(DelDist), LSTRING(DelDistDesc)],
    _category,
    [25, 20000, 200, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(cycleLength),
    "LIST",
    [LSTRING(Cycle), LSTRING(CycleDesc)],
    _category,
    [[30, 60, 120, 180, 300], ["30 seconds", "1 Minute", "2 Minutes", "3 Minutes", "5 Minutes"], 0],
    1,
    {},
    true
] call CBA_fnc_addSetting;
