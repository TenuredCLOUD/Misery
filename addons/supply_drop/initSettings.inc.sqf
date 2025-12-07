private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Enabled", "Enables dynamic supply drops"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(dropMarkers),
    "EDITBOX",
    ["Drop zones", "Possible drop zones for supply crates, leave blank if you want to select a random player's position on the map, must be a marker! ['DropZone_1', 'DropZone_2']"],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(heliTypes),
    "EDITBOX",
    ["Possible helicopters", "Possible helicopters to fly in supplies"],
    _category,
    "['B_Heli_Transport_01_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(crateTypes),
    "EDITBOX",
    ["Possible crates", "Possible crates helicopters will transport"],
    _category,
    "['B_supplyCrate_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(weapons),
    "EDITBOX",
    ["Possible weapons", "Possible weapon supplies"],
    _category,
    "['arifle_MX_F', 'hgun_Pistol_heavy_01_MRD_F', 'launch_NLAW_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(itemCount),
    "SLIDER",
    ["Loot item count", "Loot amount per category, weapons, items, ammo, attachments, etc..."],
    _category,
    [1, 15, 1, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(ammoTier),
    "LIST",
    ["Ammo type", "Type of ammo to spawn in crate"],
    _category,
    [[0, 1, 2], ["Basic", "All", "None"], 0],
    1,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(attachmentTier),
    "LIST",
    ["Attachment type", "Type of attachments to spawn in crate"],
    _category,
    [[0, 1, 2], ["Basic", "All", "None"], 0],
    1,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(items),
    "EDITBOX",
    ["Items", "Possible item supplies, headgear, facewear, nvgs, etc..."],
    _category,
    "['FirstAidKit']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(uniform),
    "EDITBOX",
    ["Uniform", "Possible uniforms supplies"],
    _category,
    "['U_B_CTRG_Soldier_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(vest),
    "EDITBOX",
    ["Vest", "Possible vests supplies"],
    _category,
    "['V_PlateCarrier1_rgr_noflag_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(backpack),
    "EDITBOX",
    ["Backpack", "Possible backpack supplies"],
    _category,
    "['B_FieldPack_Base']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(spawnChance),
    "SLIDER",
    ["Supply Drop chance", "% chance a supply drop will happen every check"],
    _category,
    [1, 100, 10, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(deletionDistance),
    "SLIDER",
    ["Deletion distance", "Distance from players when the system cleans up"],
    _category,
    [25, 20000, 1500, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(cycleLength),
    "LIST",
    ["Spawn check interval", "Time between drop checks"],
    _category,
    [[900, 1800, 3600, 7200], ["15 minutes", "30 minutes", "1 Hour", "2 Hours"], 1],
    1,
    {},
    true
] call CBA_fnc_addSetting;
