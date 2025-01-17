private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(weightDeficiency),
    "CHECKBOX",
    ["Weight penalty", "Enable a penalty for players gear weight? (Enables a deficiency to hunger / thirst for player weight, also increases tired calc values in SP - Dynamically calculated)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(temperatureDeficiency),
    "CHECKBOX",
    ["Temperature penalty", "Enable a penalty for players Temperature? (Cold - hunger increase / Hot or fever thirst increase - Dynamically calculated)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(toxicityHealing),
    "SLIDER",
    ["Poison healing", "Poison decrease every cycle"],
    _category,
    [0.01, 1, 0.01, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(infectionHealing),
    "SLIDER",
    ["Infection healing", "Infection decrease every cycle"],
    _category,
    [0.01, 1, 0.01, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(parasitesHealing),
    "SLIDER",
    ["Parasites healing", "Parasites decrease every cycle"],
    _category,
    [0.01, 1, 0.01, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(blackoutChance),
    "SLIDER",
    ["Blackout chance", "% chance per cycle to blackout when Tired (SP only)"],
    _category,
    [1, 100, 30, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(ailments),
    "CHECKBOX",
    ["Misery Ailments", "Enable Ailments? (Enables bacterial infections, parasites, etc...)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(turbidWaterChance),
    "SLIDER",
    ["Turbid water disease chance", "% chance Turbid water consumption causes disease (0 to disable)"],
    _category,
    [0, 100, 0, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(meatDiseaseChance),
    "SLIDER",
    ["Raw meat disease chance", "% chance Raw meat consumption causes disease (0 to disable)"],
    _category,
    [0, 100, 0, 0],
    1
] call CBA_fnc_addSetting;
