private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(areas),
    "EDITBOX",
    [LSTRING(ChemicalAreas), LSTRING(ChemicalAreasDesc)],
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
