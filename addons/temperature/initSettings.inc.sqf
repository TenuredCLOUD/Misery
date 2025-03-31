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

[
    QGVAR(clothingCheckAction),
    "CHECKBOX",
    ["Clothing Check", "Enable manual clothing insulation check action? (more accurate with ERU unit)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(deficiency),
    "CHECKBOX",
    ["Temperature penalty", "Enable a penalty for players Temperature? (Cold - hunger increase / Hot or fever - thirst increase - Dynamically calculated)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
