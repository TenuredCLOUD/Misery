private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(deficiency),
    "CHECKBOX",
    [LSTRING(Penalty), LSTRING(PenaltyDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
