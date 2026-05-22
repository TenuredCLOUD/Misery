private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(areas),
    "EDITBOX",
    [LSTRING(Areas), LSTRING(AreasDesc)],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
