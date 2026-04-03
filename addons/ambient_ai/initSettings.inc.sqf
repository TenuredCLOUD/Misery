private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Ambient_AI), LSTRING(EnableRoamingAI)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(faction),
    "LIST",
    [LSTRING(FactionList), LSTRING(FactionToSpawn)],
    _category,
    [[0, 1, 2, 3],
    ["West / BLUFOR","East / OPFOR","Civilian","Independant"], 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(groupSize),
    "SLIDER",
    [LSTRING(GroupSize), LSTRING(GroupSizeDesc)],
    _category,
    [1, 15, 5, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxGroups),
    "SLIDER",
    [LSTRING(MaxGroups), LSTRING(MaxGroupsDesc)],
    _category,
    [1, 20, 2, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(primaryWeapons),
    "EDITBOX",
    [LSTRING(PrimaryWeapons), LSTRING(PrimaryWeaponsDesc)],
    _category,
    "['arifle_MX_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(secondaryWeapons),
    "EDITBOX",
    [LSTRING(SecondaryWeapons), LSTRING(SecondaryWeaponsDesc)],
    _category,
    "['hgun_Pistol_heavy_01_MRD_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(launcherWeapons),
    "EDITBOX",
    [LSTRING(LauncherWeapons), LSTRING(LauncherWeaponsDesc)],
    _category,
    "['launch_NLAW_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(ammoCount),
    "SLIDER",
    [LSTRING(AmmoCount), LSTRING(AmmoCountDesc)],
    _category,
    [1, 15, 5, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(items),
    "EDITBOX",
    [LSTRING(Items), LSTRING(ItemsDesc)],
    _category,
    "['FirstAidKit']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(nvgs),
    "EDITBOX",
    [LSTRING(NVGs), LSTRING(NVGsDesc)],
    _category,
    "['NVGoggles']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(facewear),
    "EDITBOX",
    [LSTRING(Facewear), LSTRING(FacewearDesc)],
    _category,
    "['G_Balaclava_oli']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(headgear),
    "EDITBOX",
    [LSTRING(Headgear), LSTRING(HeadgearDesc)],
    _category,
    "['H_Booniehat_eaf']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(uniform),
    "EDITBOX",
    [LSTRING(Uniform), LSTRING(UniformDesc)],
    _category,
    "['U_B_CTRG_Soldier_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(vest),
    "EDITBOX",
    [LSTRING(Vest), LSTRING(VestDesc)],
    _category,
    "['V_PlateCarrier1_rgr_noflag_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(backpack),
    "EDITBOX",
    [LSTRING(Backpack), LSTRING(BackpackDesc)],
    _category,
    "['B_FieldPack_Base']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(accuracy),
    "SLIDER",
    [LSTRING(Accuracy), LSTRING(AimingAccuracy)],
    _category,
    [0.01, 1, 0.25, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(shake),
    "SLIDER",
    [LSTRING(Shake), LSTRING(AimingShake)],
    _category,
    [0.01, 1, 0.25, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(speed),
    "SLIDER",
    [LSTRING(Speed), LSTRING(AimingSpeed)],
    _category,
    [0.01, 1, 0.25, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(spawnChance),
    "SLIDER",
    [LSTRING(SpawnChance), LSTRING(SpawnChanceDesc)],
    _category,
    [1, 100, 100, 0],
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
    [LSTRING(DeletionDist), LSTRING(DeletionDistDesc)],
    _category,
    [25, 20000, 200, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(cycleLength),
    "LIST",
    [LSTRING(CheckInterval), LSTRING(CheckIntervalDesc)],
    _category,
    [[30, 60, 120, 180, 300], ["30 seconds", "1 Minute", "2 Minutes", "3 Minutes", "5 Minutes"], 0],
    1,
    {},
    true
] call CBA_fnc_addSetting;
