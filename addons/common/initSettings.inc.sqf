private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];
[
    QGVAR(debugMode),
    "LIST",
    ["Debug Mode", "Show debug text"],
    _category,
    [
        [0, 1, 2],
        ["Disabled", "Systemchats", "SystemChat + RPT Logs"],
        0
    ],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(combatLogPreventionEnabled),
    "CHECKBOX",
    ["Combat Log Prevention", "Prevent Combat logging"],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(promptSizes),
    "SLIDER",
    ["Text prompt sizes", "Text size of prompts & popups"],
    _category,
    [0.5, 1, 0.7, 2],
    2
] call CBA_fnc_addSetting;
