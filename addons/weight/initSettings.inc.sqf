private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(deficiency),
    "CHECKBOX",
    [LSTRING(Penalty), LSTRING(PenaltyDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
