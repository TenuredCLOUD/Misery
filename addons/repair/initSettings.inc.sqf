private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(areas),
    "EDITBOX",
    ["Repair Areas", "ELLIPSE or RECTANGLE marker names covering the repair area as strings ['Repair_1', 'Repair_2']"],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
