private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Ambient AI", "Enable roaming ambient ai?"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(faction),
    "LIST",
    ["Faction list", "Faction to spawn"],
    _category,
    [[0, 1, 2, 3],
    ["West / BLUFOR","East / OPFOR","Civilian","Independant"], 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(groupSize),
    "SLIDER",
    ["Group size", "Possible size of group ai can be generated with"],
    _category,
    [1, 15, 5, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxGroups),
    "SLIDER",
    ["Maximum groups", "Maximum groups allowed to spawn"],
    _category,
    [1, 20, 2, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(primaryWeapons),
    "EDITBOX",
    ["Primary weapons", "Possible primary weapons for ai"],
    _category,
    "['arifle_MX_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(secondaryWeapons),
    "EDITBOX",
    ["Secondary weapons", "Possible secondary weapons for ai"],
    _category,
    "['hgun_Pistol_heavy_01_MRD_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(launcherWeapons),
    "EDITBOX",
    ["launcher weapons", "Possible launcher weapons for ai"],
    _category,
    "['launch_NLAW_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(ammoCount),
    "SLIDER",
    ["Ammo count", "Ammo count for ai (randomly selected)"],
    _category,
    [1, 15, 5, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(items),
    "EDITBOX",
    ["Items", "Possible item loot for ai"],
    _category,
    "['FirstAidKit']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(nvgs),
    "EDITBOX",
    ["NVGs", "Possible night vision for ai"],
    _category,
    "['NVGoggles']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(facewear),
    "EDITBOX",
    ["Facewear", "Possible facewear for ai"],
    _category,
    "['G_Balaclava_oli']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(headgear),
    "EDITBOX",
    ["Headgear", "Possible headgear for ai"],
    _category,
    "['H_Booniehat_eaf']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(uniform),
    "EDITBOX",
    ["Uniform", "Possible uniforms for ai"],
    _category,
    "['U_B_CTRG_Soldier_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(vest),
    "EDITBOX",
    ["Vest", "Possible vests for ai"],
    _category,
    "['V_PlateCarrier1_rgr_noflag_F']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(backpack),
    "EDITBOX",
    ["Backpack", "Possible backpacks for ai"],
    _category,
    "['B_FieldPack_Base']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(accuracy),
    "SLIDER",
    ["Accuracy", "Aiming accuracy"],
    _category,
    [0.01, 1, 0.25, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(shake),
    "SLIDER",
    ["Shake", "Aiming shake"],
    _category,
    [0.01, 1, 0.25, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(speed),
    "SLIDER",
    ["Speed", "Aiming speed"],
    _category,
    [0.01, 1, 0.25, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(spawnChance),
    "SLIDER",
    ["Spawn Chance", "% chance to generate ai group"],
    _category,
    [1, 100, 100, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(minimumDistance),
    "SLIDER",
    ["Minimum Distance", "Minimum distance ai groups can spawn from players"],
    _category,
    [150, 15000, 750, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maximumDistance),
    "SLIDER",
    ["Maximum Distance", "Maximum distance ai groups can spawn from players"],
    _category,
    [150, 15000, 750, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(safeDistance),
    "SLIDER",
    ["Safe distance", "Minimum distance at which ai can spawn from other players"],
    _category,
    [25, 5000, 200, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(deletionDistance),
    "SLIDER",
    ["Deletion distance", "Distance from players at which ai will be deleted"],
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
