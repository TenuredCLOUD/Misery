private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(areas),
    "EDITBOX",
    ["Radioactive Areas", "ELLIPSE or RECTANGLE marker names covering the radioactive area as strings ['Radzone_1', 'Radzone_2']"],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
