private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Infection), LSTRING(InfectionDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(specimensEnabled),
    "CHECKBOX",
    [LSTRING(Specimens), LSTRING(SpecimensDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(chance),
    "SLIDER",
    [LSTRING(InfectionChance), LSTRING(InfectionChanceDesc)],
    _category,
    [0, 100, 0, 0],
    1
] call CBA_fnc_addSetting;
