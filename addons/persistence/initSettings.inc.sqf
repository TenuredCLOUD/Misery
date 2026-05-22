private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [ECSTRING(common,Enabled), LSTRING(EnableSaving)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(resetSinglePlayerSave),
    "CHECKBOX",
    [LSTRING(FreshStart), LSTRING(FreshStartDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(hardcore),
    "CHECKBOX",
    [LSTRING(EnableHardcore), LSTRING(EnableHardcoreDesc)],
    _category,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(saveSlot),
    "LIST",
    [LSTRING(SaveSlot), LSTRING(SaveSlotDesc)],
    _category,
    [[0, 1, 2, 3, 4], ["0", "1", "2", "3", "4"], 0],
    1,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(autosaveInterval),
    "LIST",
    [LSTRING(Autosave), LSTRING(AutosaveDesc)],
    _category,
    [[0, 1, 10, 15, 20, 25, 30], [ECSTRING(common,Never), ECSTRING(common,Interval1Min), ECSTRING(common,Interval10Min), ECSTRING(common,Interval15Min), ECSTRING(common,Interval20Min), ECSTRING(common,Interval25Min), ECSTRING(common,Interval30Min)], 1],
    1,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(gradAutosaveInterval),
    "LIST",
    [LSTRING(GradAutosave), LSTRING(GradAutosaveDesc)],
    _category,
    [[0, 10, 20, 30, 40, 50, 60], [ECSTRING(common,Never), ECSTRING(common,Interval10Min), ECSTRING(common,Interval20Min), ECSTRING(common,Interval30Min), ECSTRING(common,Interval40Min), ECSTRING(common,Interval50Min), ECSTRING(common,Interval60Min)], 0],
    1,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(gradWarning),
    "CHECKBOX",
    [LSTRING(GradWarning), LSTRING(GradWarningDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(gradAdminActions),
    "CHECKBOX",
    [LSTRING(GradAdmin), LSTRING(GradAdminDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
