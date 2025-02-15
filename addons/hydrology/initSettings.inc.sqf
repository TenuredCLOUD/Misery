private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Water collection", "Enable Water collection actions from water sources? (Wells, etc...)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
