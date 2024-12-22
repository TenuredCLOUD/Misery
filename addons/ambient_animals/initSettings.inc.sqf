[
    QGVAR(ambientWildlife),
    "CHECKBOX",
    ["Ambient wildlife", "Enable roaming ambient wildlife?"],
    ["Misery","Ambient wildlife"],
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalTypes),
    "EDITBOX",
    ["Possible types", "Possible animals to spawn: ('Sheep','Goat','Chicken')"],
    ["Misery","Ambient wildlife"],
    "['Sheep','Goat','Chicken']",
    1,
    {
        params ["_value"];
        GVAR(animalTypes) = parseSimpleArray _value;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(maxAnimalUnits),
    "SLIDER",
    ["Maximum animals", "Maximum animals allowed to spawn"],
    ["Misery","Ambient wildlife"],
    [1, 50, 10, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalMinimumDistance),
    "SLIDER",
    ["Minimum distance", "Minimum distance at which animals can spawn"],
    ["Misery","Ambient wildlife"],
    [25, 5000, 500, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalSafeDistance),
    "SLIDER",
    ["Safe distance", "Minimum distance at which animals can spawn from other players"],
    ["Misery","Ambient wildlife"],
    [25, 5000, 200, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalDeleteDistance),
    "SLIDER",
    ["Delete distance", "Minimum distance from a player at which animals will be deleted"],
    ["Misery","Ambient wildlife"],
    [25, 5000, 1000, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalCycleLength),
    "SLIDER",
    ["Cycle length", "Time in seconds between spawn checks"],
    ["Misery","Ambient wildlife"],
    [1, 300, 30, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalSpawnChance),
    "SLIDER",
    ["Spawn chance %", "% chance per cycle that clusters will spawn"],
    ["Misery","Ambient wildlife"],
    [1, 100, 10, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(animalClusters),
    "EDITBOX",
    ["Clusters", "Clusters of animals spawned per spawn cycle"],
    ["Misery","Ambient wildlife"],
    "1,3",
    1,
    {
        params ["_value"];
        GVAR(animalClusters) = (_value splitString ",") apply {parseNumber _x};
    }
] call CBA_fnc_addSetting;

[
    QGVAR(animalsSheepCount),
    "EDITBOX",
    ["Sheep count", "Number of sheep spawned per cluster"],
    ["Misery","Ambient wildlife"],
    "1,10",
    1,
    {
        params ["_value"];
        GVAR(animalsSheepCount) = (_value splitString ",") apply {parseNumber _x};
    }
] call CBA_fnc_addSetting;

[
    QGVAR(animalsGoatCount),
    "EDITBOX",
    ["Goat count", "Number of goats spawned per cluster"],
    ["Misery","Ambient wildlife"],
    "1,6",
    1,
    {
        params ["_value"];
        GVAR(animalsGoatCount) = (_value splitString ",") apply {parseNumber _x};
    }
] call CBA_fnc_addSetting;

[
    QGVAR(animalsChickenCount),
    "EDITBOX",
    ["Chicken count", "Number of chickens spawned per cluster"],
    ["Misery","Ambient wildlife"],
    "2,7",
    1,
    {
        params ["_value"];
        GVAR(animalsChickenCount) = (_value splitString ",") apply {parseNumber _x};
    }
] call CBA_fnc_addSetting;
