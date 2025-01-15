private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(areas),
    "EDITBOX",
    ["Safe Zone Areas", "ELLIPSE or RECTANGLE marker names covering the safezone area as strings ['Safezone_1', 'Safezone_2']"],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
