private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(enableSwap),
    "CHECKBOX",
    [LSTRING(SwapEnabled), LSTRING(SwapEnabledDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
