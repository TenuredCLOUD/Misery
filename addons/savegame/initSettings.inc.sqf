[
    QGVAR(saveType),
    "LIST",
    ["Save Mode", "Which type of save would you like?"],
    "Misery Savegames",
    [[0, 1, 2], ["None", "Single Player", "Persistent World"], 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(hardcore),
    "CHECKBOX",
    ["Enable Hardcore", "Hardcore mode only allows saving nearby a campfire."],
    "Misery Savegames",
    false
] call CBA_fnc_addSetting;

[
    QGVAR(saveSlot),
    "LIST",
    ["Save Slot", "Which save slot would you like to use?"],
    "Misery Savegames",
    [[0, 1, 2, 3, 4], ["0", "1", "2", "3", "4"], 0],
    1, {}, true
] call CBA_fnc_addSetting;

[
    QGVAR(autosaveInterval),
    "LIST",
    ["Autosave Interval", "How often would you like to autosave?"],
    "Misery Savegames",
    [[0, 10, 15, 20, 25, 30], ["Never", "10 Minutes", "15 Minutes", "20 Minutes", "25 Minutes", "30 Minutes"], 1],
    1, {}, true
] call CBA_fnc_addSetting;