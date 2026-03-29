private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Ignore rating", "When enabled, players cannot turn renegade"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

