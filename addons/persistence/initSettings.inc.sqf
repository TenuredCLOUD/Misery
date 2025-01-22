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
    ["Enable Hardcore", "Hardcore mode only allows saving nearby a campfire."],
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
