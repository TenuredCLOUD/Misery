private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(areas),
    "EDITBOX",
    [LSTRING(SafezoneAreas), LSTRING(SafezoneAreasDesc)],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
