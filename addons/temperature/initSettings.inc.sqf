[
    QGVAR(enable),
    "CHECKBOX",
    ["Temperature Framework", "Enable Temperature framework? (Enables player temperature calculations)"],
    ["Misery","Temperature"],
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(breathFogAllowed),
    "CHECKBOX",
    ["Breath Condensation", "Enable Breath Condensation? (Enables breath visibility in cold weather)"],
    ["Misery","Temperature"],
    false,
    1
] call CBA_fnc_addSetting;
