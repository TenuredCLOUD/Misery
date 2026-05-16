private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(woodCollection),
    "CHECKBOX",
    ["Wood collection", "Enable Wood collection actions? (Must be enabled for tree interaction, and log splitting)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(sawingWood),
    "CHECKBOX",
    ["Sawing Wood", "Enable Wood sawing actions? (Disable if you want to make your own saw interactions)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(choppingWood),
    "CHECKBOX",
    ["Chopping Wood", "Enable Wood chopping actions? (Disable if you want to make your own axe interactions)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(foraging),
    "CHECKBOX",
    ["Foraging", "Enable Foraging? (Enables digging for worms, and searching for tinder actions. Requires wood collection to be enabled)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
