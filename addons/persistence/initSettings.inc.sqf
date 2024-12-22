// Single-Player settings.
[
    QGVAR(saveType),
    "LIST",
    ["Save Mode", "Which type of save would you like?"],
    "Misery Singleplayer Save",
    [[0, 1, 2], ["None", "Single Player", "Persistent World"], 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(hardcore),
    "CHECKBOX",
    ["Enable Hardcore", "Hardcore mode only allows saving nearby a campfire."],
    "Misery Singleplayer Save",
    false
] call CBA_fnc_addSetting;

[
    QGVAR(saveSlot),
    "LIST",
    ["Save Slot", "Which save slot would you like to use?"],
    "Misery Singleplayer Save",
    [[0, 1, 2, 3, 4], ["0", "1", "2", "3", "4"], 0],
    1, {}, true
] call CBA_fnc_addSetting;

[
    QGVAR(autosaveInterval),
    "LIST",
    ["Autosave Interval", "How often would you like to autosave?"],
    "Misery Singleplayer Save",
    [[0, 10, 15, 20, 25, 30], ["Never", "10 Minutes", "15 Minutes", "20 Minutes", "25 Minutes", "30 Minutes"], 1],
    1, {}, true
] call CBA_fnc_addSetting;

// Multiplayer
[
    QGVAR(autosaveIntervalMP),
    "LIST",
     ["Autosave Interval", "How often would you like to autosave?"],
     "Misery Multiplayer Save",
     [[0, 10, 20, 30, 40, 50, 60], ["Never", "10 Minutes", "20 Minutes", "30 Minutes", "40 Minutes", "50 Minutes", "Every Hour"], 3],
     1, {}, true
] call CBA_fnc_addSetting;
