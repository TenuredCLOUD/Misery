private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["No time acceleration", "When enabled time acceleration in SP is no longer allowed"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
