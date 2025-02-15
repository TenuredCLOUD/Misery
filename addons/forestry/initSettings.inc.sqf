private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(woodCollection),
    "CHECKBOX",
    ["Wood collection", "Enable Wood collection actions? (Axe's and chainsaw's will have actions near trees)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(foraging),
    "CHECKBOX",
    ["Foraging", "Enable Foraging? (Enables digging for worms, and searching for tinder actions...)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
