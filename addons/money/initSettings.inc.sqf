private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(symbol),
    "EDITBOX",
    ["Misery Money Symbol", "Symbol to use for currency"],
    _category,
    "$",
    1
] call CBA_fnc_addSetting;
