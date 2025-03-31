private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(action),
    "CHECKBOX",
    ["Weight action", "Enable an action to check current gear weight?"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(deficiency),
    "CHECKBOX",
    ["Weight penalty", "Enable a penalty for players gear weight? (Enables a deficiency to hunger / thirst for player weight, also increases tired calc values in SP - Dynamically calculated)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
