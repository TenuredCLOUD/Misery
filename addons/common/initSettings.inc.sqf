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
