private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(areas),
    "EDITBOX",
    [LSTRING(Areas), LSTRING(AreasDesc)],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(initialColor),
    "COLOR",
    [LSTRING(InitialColor), LSTRING(InitialColorDesc)],
    _category,
    [1, 1, 0, 0]
] call CBA_fnc_addSetting;

[
    QGVAR(finalColor),
    "COLOR",
    [LSTRING(FinalColor), LSTRING(FinalColorDesc)],
    _category,
    [1, 1, 0, 1]
] call CBA_fnc_addSetting;
