private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Drops), LSTRING(DropsDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(dropChance),
    "SLIDER",
    [LSTRING(DropChance), LSTRING(DropChanceDesc)],
    _category,
    [0, 100, 50, 0],
    1
] call CBA_fnc_addSetting;
