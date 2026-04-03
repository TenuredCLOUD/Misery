private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(debug),
    "CHECKBOX",
    [LSTRING(DebugEnable), LSTRING(DebugEnableDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(areas),
    "EDITBOX",
    [LSTRING(SpawnAreas), LSTRING(SpawnAreasDesc)],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
