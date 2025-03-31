private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Cooking", "Enable Cooking actions when near a fire?"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
