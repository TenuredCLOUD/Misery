[
    QGVAR(enabled),
    "CHECKBOX",
    ["Ambient AI", "Enable roaming ambient ai?"],
    "Misery - Ambient AI",
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(faction),
    "LIST",
    ["Faction list", "Faction to spawn"],
    "Misery - Ambient AI",
    [[0, 1, 2, 3],
    ["West / BLUFOR","East / OPFOR","Civilian","Independant"], 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(groupSize),
    "SLIDER",
    ["Group size", "Possible size of group ai can be generated with"],
    "Misery - Ambient AI",
    [1, 100, 5, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxUnits),
    "SLIDER",
    ["Maximum units", "Maximum units allowed to spawn"],
    "Misery - Ambient AI",
    [1, 150, 20, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(primaryWeapons),
    "EDITBOX",
    ["Primary weapons", "Possible primary weapons for ai"],
    "Misery - Ambient AI",
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(secondaryWeapons),
    "EDITBOX",
    ["Secondary weapons", "Possible secondary weapons for ai"],
    "Misery - Ambient AI",
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(launcherWeapons),
    "EDITBOX",
    ["launcher weapons", "Possible launcher weapons for ai"],
    "Misery - Ambient AI",
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(ammoCount),
    "SLIDER",
    ["Ammo count", "Ammo count for ai (randomly selected)"],
    "Misery - Ambient AI",
    [1, 15, 5, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(items),
    "EDITBOX",
    ["Items", "Possible item loot for ai"],
    "Misery - Ambient AI",
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(nvgs),
    "EDITBOX",
    ["NVGs", "Possible night vision for ai"],
    "Misery - Ambient AI",
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(facewear),
    "EDITBOX",
    ["Facewear", "Possible facewear for ai"],
    "Misery - Ambient AI",
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(headgear),
    "EDITBOX",
    ["Headgear", "Possible headgear for ai"],
    "Misery - Ambient AI",
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(uniform),
    "EDITBOX",
    ["Uniform", "Possible uniforms for ai"],
    "Misery - Ambient AI",
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(vest),
    "EDITBOX",
    ["Vest", "Possible vests for ai"],
    "Misery - Ambient AI",
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(backpack),
    "EDITBOX",
    ["Backpack", "Possible backpacks for ai"],
    "Misery - Ambient AI",
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(accuracy),
    "SLIDER",
    ["Accuracy", "Aiming accuracy"],
    "Misery - Ambient AI",
    [0.01, 1, 0.25, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(shake),
    "SLIDER",
    ["Shake", "Aiming shake"],
    "Misery - Ambient AI",
    [0.01, 1, 0.25, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(speed),
    "SLIDER",
    ["Speed", "Aiming speed"],
    "Misery - Ambient AI",
    [0.01, 1, 0.25, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(spawnChance),
    "SLIDER",
    ["Spawn Chance", "% chance to generate ai group"],
    "Misery - Ambient AI",
    [1, 100, 100, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(minimumDistance),
    "SLIDER",
    ["Minimum Distance", "Minimum distance ai groups can spawn from players"],
    "Misery - Ambient AI",
    [150, 15000, 750, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maximumDistance),
    "SLIDER",
    ["Maximum Distance", "Maximum distance ai groups can spawn from players"],
    "Misery - Ambient AI",
    [150, 15000, 750, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(safeDistance),
    "SLIDER",
    ["Safe distance", "Minimum distance at which ai can spawn from other players"],
    "Misery - Ambient AI",
    [25, 5000, 200, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(deletionDistance),
    "SLIDER",
    ["Deletion distance", "Distance from players at which ai will be deleted"],
    "Misery - Ambient AI",
    [25, 20000, 200, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(cycleLength),
    "SLIDER",
    ["Cycle length", "Time in seconds between spawn checks"],
    "Misery - Ambient AI",
    [1, 3600, 30, 0],
    1
] call CBA_fnc_addSetting;