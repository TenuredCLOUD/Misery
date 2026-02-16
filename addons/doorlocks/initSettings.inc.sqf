private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(areas),
    "EDITBOX",
    ["Blacklisted lockable areas", "ELLIPSE or RECTANGLE marker names covering the blacklisted area as strings ['noLocks_1', 'noLocks_2']"],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
