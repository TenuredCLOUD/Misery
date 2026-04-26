private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(ambientWildlife),
    "CHECKBOX",
    [LSTRING(Wildlife), LSTRING(EnableWildlife)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxPopulation),
    "SLIDER",
    [LSTRING(MaxAnimals), LSTRING(MaxAnimalsDesc)],
    _category,
    [1, 50, 10, 0],
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
    QGVAR(animalMinimumDistance),
    "SLIDER",
    [LSTRING(MinDist), LSTRING(MinDistDesc)],
    _category,
    [25, 5000, 500, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalMaximumDistance),
    "SLIDER",
    [LSTRING(MaxDist), LSTRING(MaxDistDesc)],
    _category,
    [25, 10000, 500, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalSafeDistance),
    "SLIDER",
    [LSTRING(SafeDist), LSTRING(SafeDistDesc)],
    _category,
    [25, 5000, 200, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalDeleteDistance),
    "SLIDER",
    [LSTRING(DeleteDist), LSTRING(DeleteDistDesc)],
    _category,
    [25, 5000, 1000, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalSpawnChance),
    "SLIDER",
    [LSTRING(SpawnChance), LSTRING(SpawnChanceDesc)],
    _category,
    [1, 100, 10, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalCycleLength),
    "LIST",
    [LSTRING(CheckInterval), LSTRING(CheckIntervalDesc)],
    _category,
    [[30, 60, 120, 180, 300], ["30 seconds", "1 Minute", "2 Minutes", "3 Minutes", "5 Minutes"], 0],
    1,
    {},
    true
] call CBA_fnc_addSetting;
