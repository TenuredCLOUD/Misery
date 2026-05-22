private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [ECSTRING(common,Enabled), LSTRING(EnableDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(dropMarkers),
    "EDITBOX",
    [LSTRING(DropZones), LSTRING(DropZonesDesc)],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(heliTypes),
    "EDITBOX",
    [LSTRING(PossibleHelicopters), LSTRING(PossibleHelicoptersDesc)],
    _category,
    "['B_Heli_Transport_01_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(crateTypes),
    "EDITBOX",
    [LSTRING(PossibleCrates), LSTRING(PossibleCratesDesc)],
    _category,
    "['B_supplyCrate_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(weapons),
    "EDITBOX",
    [LSTRING(PossibleWeapons), LSTRING(PossibleWeaponsDesc)],
    _category,
    "['arifle_MX_F', 'hgun_Pistol_heavy_01_MRD_F', 'launch_NLAW_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(itemCount),
    "SLIDER",
    [LSTRING(LootItemCount), LSTRING(LootItemCountDesc)],
    _category,
    [1, 15, 1, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(ammoTier),
    "LIST",
    [LSTRING(AmmoType), LSTRING(AmmoTypeDesc)],
    _category,
    [[0, 1, 2], [ECSTRING(common,Basic), ECSTRING(common,All), ECSTRING(common,None)], 0],
    1,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(attachmentTier),
    "LIST",
    [LSTRING(AttachmentType), LSTRING(AttachmentTypeDesc)],
    _category,
    [[0, 1, 2], [ECSTRING(common,Basic), ECSTRING(common,All), ECSTRING(common,None)], 0],
    1,
    {},
    true
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
    QGVAR(spawnChance),
    "SLIDER",
    [LSTRING(SupplyDropChance), LSTRING(SupplyDropChanceDesc)],
    _category,
    [1, 100, 10, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(deletionDistance),
    "SLIDER",
    [LSTRING(DeletionDistance), LSTRING(DeletionDistanceDesc)],
    _category,
    [25, 20000, 1500, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(cycleLength),
    "LIST",
    [LSTRING(SpawnCheckInterval), LSTRING(SpawnCheckIntervalDesc)],
    _category,
    [[900, 1800, 3600, 7200], [ECSTRING(common,Interval15Min), ECSTRING(common,Interval30Min), ECSTRING(common,Interval1Hour), ECSTRING(common,Interval2Hours)], 1],
    1,
    {},
    true
] call CBA_fnc_addSetting;
