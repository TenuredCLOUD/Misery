private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Setting), LSTRING(SettingDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
