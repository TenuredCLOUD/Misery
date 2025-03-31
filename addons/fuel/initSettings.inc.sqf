private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "EDITBOX",
    ["Fuel framework", "Enable refueling framework?"],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
