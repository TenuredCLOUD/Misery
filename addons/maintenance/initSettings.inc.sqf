private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(speedType),
    "CHECKBOX",
    ["Speed display", "True - KM/H | False - MPH"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
