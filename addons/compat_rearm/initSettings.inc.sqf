private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(areas),
    "EDITBOX",
    ["Rearming Areas", "ELLIPSE or RECTANGLE marker names covering the rearming area as strings ['Rearm_1', 'Rearm_2']"],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
