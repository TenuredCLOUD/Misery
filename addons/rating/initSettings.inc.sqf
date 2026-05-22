private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(IgnoreRating), LSTRING(IgnoreRatingDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

