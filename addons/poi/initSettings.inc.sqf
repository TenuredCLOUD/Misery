private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(spawnCheckDistance),
    "SLIDER",
    [LSTRING(SpawnCheckDistance), LSTRING(SpawnCheckDistanceDesc)],
    _category,
    [250, 15000, 500, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(deleteCheckDistance),
    "SLIDER",
    [LSTRING(DeletionCheckDistance), LSTRING(DeletionCheckDistanceDesc)],
    _category,
    [250, 15000, 1000, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(spawnRandomDistance),
    "SLIDER",
    [LSTRING(RandomSpawnDistance), LSTRING(RandomSpawnDistanceDesc)],
    _category,
    [250, 15000, 250, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(checkInterval),
    "SLIDER",
    [LSTRING(GeneratingCheckInterval), LSTRING(GeneratingCheckIntervalDesc)],
    _category,
    [1, 3600, 60, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(checkIntervalShore),
    "SLIDER",
    [LSTRING(ShorelineCheckInterval), LSTRING(ShorelineCheckIntervalDesc)],
    _category,
    [1, 3600, 60, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxActive),
    "SLIDER",
    [LSTRING(MaximumAllowed), LSTRING(MaximumAllowedDesc)],
    _category,
    [1, 15, 5, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(wrecksSmoke),
    "CHECKBOX",
    [LSTRING(WrecksSmoke), LSTRING(WrecksSmokeDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
