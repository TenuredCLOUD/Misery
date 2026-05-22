private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(areas),
    "EDITBOX",
    [LSTRING(Blacklist), LSTRING(BlacklistDesc)],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
