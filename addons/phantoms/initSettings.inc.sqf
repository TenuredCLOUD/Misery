private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(drops),
    "CHECKBOX",
    ["Phantom Artifact drops", "Allow Phantoms to drop artifacts? (*Requires Haleks Remnant Mod*)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(dropChance),
    "SLIDER",
    ["Phantoms artifact drop chance", "% chance per phantom kill to drop an artifact (0 to disable)"],
    _category,
    [0, 100, 50, 0],
    1
] call CBA_fnc_addSetting;
