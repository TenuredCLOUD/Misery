private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Temperature Framework", "Enable Temperature framework? (Enables player temperature calculations)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(breathFogAllowed),
    "CHECKBOX",
    ["Breath Condensation", "Enable Breath Condensation? (Enables breath visibility in cold weather)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
