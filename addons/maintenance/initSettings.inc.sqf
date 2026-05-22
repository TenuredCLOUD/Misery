private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(difficulty),
    "CHECKBOX",
    [LSTRING(EasierMaintenance), LSTRING(EasierMaintenanceDesc)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(fuelOnStart),
    "SLIDER",
    [LSTRING(FuelOnStart), LSTRING(FuelOnStartDesc)],
    _category,
    [0, 1, 0, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(damageOnStart),
    "SLIDER",
    [LSTRING(DamageOnStart), LSTRING(DamageOnStartDesc)],
    _category,
    [0, 1, 0, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(preparedTools),
    "CHECKBOX",
    [LSTRING(TheyWerePrepared), LSTRING(TheyWerePreparedDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
