private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(woundCost),
    "SLIDER",
    ["Wound treatment cost", "Wound treatment cost for players"],
    _category,
    [1, 1000000, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(woundDuration),
    "SLIDER",
    ["Wound treatment duration", "Time it takes to treat wounds"],
    _category,
    [1, 300, 45, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(radiationCost),
    "SLIDER",
    ["Radiation treatment cost", "Radiation treatment cost for players"],
    _category,
    [1, 1000000, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(radiationDuration),
    "SLIDER",
    ["Radiation treatment duration", "Time it takes to treat radiation"],
    _category,
    [1, 300, 30, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(infectionCost),
    "SLIDER",
    ["Infection treatment cost", "Infection treatment cost for players"],
    _category,
    [1, 1000000, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(infectionDuration),
    "SLIDER",
    ["Infection treatment duration", "Time it takes to treat Infection"],
    _category,
    [1, 300, 25, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(parasiteCost),
    "SLIDER",
    ["Parasite treatment cost", "Parasite treatment cost for players"],
    _category,
    [1, 1000000, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(parasiteDuration),
    "SLIDER",
    ["Parasite treatment duration", "Time it takes to treat Parasites"],
    _category,
    [1, 300, 20, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(toxicCost),
    "SLIDER",
    ["Toxicity treatment cost", "Toxicity treatment cost for players"],
    _category,
    [1, 1000000, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(toxicDuration),
    "SLIDER",
    ["Toxicity treatment duration", "Time it takes to treat Toxicity"],
    _category,
    [1, 300, 35, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(psychosisCost),
    "SLIDER",
    ["Psychosis treatment cost", "Psychosis treatment cost for players"],
    _category,
    [1, 1000000, 500, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(psychosisDuration),
    "SLIDER",
    ["Psychosis treatment duration", "Time it takes to treat Psychosis"],
    _category,
    [1, 300, 40, 0],
    1
] call CBA_fnc_addSetting;
