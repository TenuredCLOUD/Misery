private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Framework), LSTRING(FrameworkDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(breathFogAllowed),
    "CHECKBOX",
    [LSTRING(BreathCondensation), LSTRING(BreathCondensationDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(clothingCheckAction),
    "CHECKBOX",
    [LSTRING(ClothingCheck), LSTRING(ClothingCheckDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(deficiency),
    "CHECKBOX",
    [LSTRING(Penalty), LSTRING(PenaltyDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
