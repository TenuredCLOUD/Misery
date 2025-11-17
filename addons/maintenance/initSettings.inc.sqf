private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(speedType),
    "CHECKBOX",
    ["Speed display", "True - KM/H | False - MPH"],
    _category,
    false,
    2
] call CBA_fnc_addSetting;

[
    QGVAR(fuelOnStart),
    "SLIDER",
    ["Fuel on start", "Possible starting fuel for vehicles on scenario start (if set to 0 3den handles fuel levels)"],
    _category,
    [0, 1, 0, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(damageOnStart),
    "SLIDER",
    ["Damage on start", "Possible starting damage for vehicles on scenario start (if set to 0 3den handles damage levels)"],
    _category,
    [0, 1, 0, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(preparedTools),
    "CHECKBOX",
    ["They were prepared", "When enabled some vehicles on scenario start will possess tools for repairs based on vehicle type"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
