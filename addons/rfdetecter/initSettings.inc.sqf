private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["RF / EMF detector actions", "Enable RF / EMF detector actions? (Adds actions to RF / EMF detector)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
