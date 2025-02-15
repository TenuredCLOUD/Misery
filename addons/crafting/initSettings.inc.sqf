private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Crafting Menus Framework", "Enable Crafting Menus? (Crafting allowed at workbenches)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
