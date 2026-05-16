private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Name), LSTRING(Desc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(dispatchEnabled),
    "CHECKBOX",
    [LSTRING(SGDispatching), LSTRING(SGDispatchingDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
