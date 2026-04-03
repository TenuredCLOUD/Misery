private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(NoTimeAccel), LSTRING(NoTimeAccel_Desc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
