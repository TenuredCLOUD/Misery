private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Field dressing", "Allow field dressing of animals?"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
