private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(areas),
    "EDITBOX",
    [LSTRING(Areas), LSTRING(DeadZonesDesc)],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(barrageDelay),
    "SLIDER",
    [LSTRING(Delay), LSTRING(DelayDesc)],
    _category,
    [1, 1800, 5, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(shellTypes),
    "EDITBOX",
    [LSTRING(ShellTypes), LSTRING(ShellTypesDesc)],
    _category,
    "['Sh_82mm_AMOS']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(radius),
    "SLIDER",
    [LSTRING(Radius), LSTRING(RadiusDesc)],
    _category,
    [1, 500, 150, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(density),
    "SLIDER",
    [LSTRING(Density), LSTRING(DensityDesc)],
    _category,
    [1, 25, 1, 0],
    1
] call CBA_fnc_addSetting;

