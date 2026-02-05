private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(areas),
    "EDITBOX",
    ["No Loot Areas", "ELLIPSE or RECTANGLE marker names covering the blacklisted loot area as strings ['noLoot_1', 'noLoot_2']"],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
