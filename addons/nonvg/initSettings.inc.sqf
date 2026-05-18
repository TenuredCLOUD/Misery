private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Setting), LSTRING(SettingDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
