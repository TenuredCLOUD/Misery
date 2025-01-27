private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Fishing", "Enable Fishing near open water sources? (Requires fishing rod, bait, hook, and fishing spool...)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
