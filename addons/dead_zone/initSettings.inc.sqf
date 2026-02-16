private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(areas),
    "EDITBOX",
    ["Dead Zone Areas", "ELLIPSE or RECTANGLE marker names covering the barrage areas as strings ['Deadzone_1', 'Deadzone_2']"],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(barrageDelay),
    "SLIDER",
    ["Barrage delay", "Global delay between each shell barrage"],
    _category,
    [1, 1800, 5, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(shellTypes),
    "EDITBOX",
    ["Shell Types", "Pool of shell classnames to randomly use ['Sh_82mm_AMOS', 'Sh_155mm_AMOS']"],
    _category,
    "['Sh_82mm_AMOS']",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(radius),
    "SLIDER",
    ["Barrage radius", "Radius of target area in meters"],
    _category,
    [1, 500, 150, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(density),
    "SLIDER",
    ["Barrage density", "How many rounds are fired each barrage"],
    _category,
    [1, 25, 1, 0],
    1
] call CBA_fnc_addSetting;

