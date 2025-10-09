private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

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
