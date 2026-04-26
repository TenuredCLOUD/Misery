private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(areas),
    "EDITBOX",
    [LSTRING(Areas), LSTRING(AreasDesc)],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
