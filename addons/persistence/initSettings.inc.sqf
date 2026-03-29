private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Enabled", "Enable Saving"],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(resetSinglePlayerSave),
    "CHECKBOX",
    ["Fresh Start", "Start fresh in singleplayer?"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(hardcore),
    "CHECKBOX",
    ["Enable Hardcore", "MP & SP - Hardcore mode only allows saving when nearby a lit fire. (SP only - it will wipe world data when GRAD Persistence is used)"],
    _category,
    false
] call CBA_fnc_addSetting;

[
    QGVAR(saveSlot),
    "LIST",
    ["Save Slot", "Which save slot would you like to use?"],
    _category,
    [[0, 1, 2, 3, 4], ["0", "1", "2", "3", "4"], 0],
    1,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(autosaveInterval),
    "LIST",
    ["Autosave Interval", "How often would you like to autosave?"],
    _category,
    [[0, 1, 10, 15, 20, 25, 30], ["Never", "1 Minute", "10 Minutes", "15 Minutes", "20 Minutes", "25 Minutes", "30 Minutes"], 1],
    1,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(gradAutosaveInterval),
    "LIST",
    ["GRAD Persistence autosave interval", "How often would you like the server to save? (Requires GRAD persistence)"],
    _category,
    [[0, 10, 20, 30, 40, 50, 60], ["Never", "10 Minutes", "20 Minutes", "30 Minutes", "40 Minutes", "50 Minutes", "60 Minutes"], 0],
    1,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(gradWarning),
    "CHECKBOX",
    ["GRAD Persistence warning", "Show warning message for GRAD persistence when saving (Requires GRAD persistence)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(gradAdminActions),
    "CHECKBOX",
    ["GRAD Persistence admin actions", "Gives admin level players higher privilege actions for database control (Requires GRAD persistence)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
