private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(areas),
    "EDITBOX",
    ["Chemical Areas", "ELLIPSE or RECTANGLE marker names covering the radioactive area as strings ['Chemical_1', 'Chemical_2']"],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(initialColor),
    "COLOR",
    ["Chemical areas initial color", "Initial starting color of chemical zones - RGBA format"],
    _category,
    [1, 1, 0, 0]
] call CBA_fnc_addSetting;

[
    QGVAR(finalColor),
    "COLOR",
    ["Chemical areas final color", "Final color of chemical zones - RGBA format"],
    _category,
    [1, 1, 0, 1]
] call CBA_fnc_addSetting;
