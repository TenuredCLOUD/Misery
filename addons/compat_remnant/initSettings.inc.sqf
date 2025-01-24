private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Artifact drops", "Allow Phantoms to drop artifacts?"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(dropChance),
    "SLIDER",
    ["Artifact drop chance", "% chance per phantom kill to drop an artifact"],
    _category,
    [0, 100, 50, 0],
    1
] call CBA_fnc_addSetting;
