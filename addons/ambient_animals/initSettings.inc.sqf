private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(ambientWildlife),
    "CHECKBOX",
    ["Ambient wildlife", "Enable roaming ambient wildlife?"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxPopulation),
    "SLIDER",
    ["Maximum animals", "Maximum animals allowed to spawn"],
    _category,
    [1, 50, 10, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(clusterSize),
    "SLIDER",
    ["Cluster size", "Possible amount of animals to spawn each cycle"],
    _category,
    [1, 20, 5, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalMinimumDistance),
    "SLIDER",
    ["Minimum distance", "Minimum distance at which animals can spawn"],
    _category,
    [25, 5000, 500, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalMaximumDistance),
    "SLIDER",
    ["Maximum distance", "Maximum distance at which animals can spawn"],
    _category,
    [25, 10000, 500, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalSafeDistance),
    "SLIDER",
    ["Safe distance", "Minimum distance at which animals can spawn from other players"],
    _category,
    [25, 5000, 200, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalDeleteDistance),
    "SLIDER",
    ["Delete distance", "Minimum distance from a player at which animals will be deleted"],
    _category,
    [25, 5000, 1000, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalSpawnChance),
    "SLIDER",
    ["Spawn chance %", "% chance per cycle that clusters will spawn"],
    _category,
    [1, 100, 10, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalCycleLength),
    "LIST",
    ["Spawn check interval", "Time in seconds between spawn checks"],
    _category,
    [[30, 60, 120, 180, 300], ["30 seconds", "1 Minute", "2 Minutes", "3 Minutes", "5 Minutes"], 0],
    1,
    {},
    true
] call CBA_fnc_addSetting;
