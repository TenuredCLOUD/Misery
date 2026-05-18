private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(areas),
    "EDITBOX",
    [LSTRING(SafezoneAreas), LSTRING(SafezoneAreasDesc)],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
