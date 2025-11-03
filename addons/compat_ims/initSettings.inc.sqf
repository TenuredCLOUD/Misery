private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(hudShow),
    "CHECKBOX",
    ["WBK IMS HUD", "Enable IMS HUD"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
