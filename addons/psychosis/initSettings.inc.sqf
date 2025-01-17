private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Enabled", "Enable psychosis effects?"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(cycleTimer),
    "LIST",
    ["Psychosis Cycle Timer", "How often is the psychosis value updated?"],
    _category,
    [[15, 30, 60], ["10 Seconds", "30 Seconds", "60 Seconds"], 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(night),
    "CHECKBOX",
    ["Psychosis At Night", "Darkness can increase psychosis, while being near a fire or being inside will counteract it."],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(decrease),
    "SLIDER",
    ["Psychosis Decrease", "How much psychosis naturally decreases."],
    _category,
    [0.01, 1, 0.05, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(nightIncrease),
    "SLIDER",
    ["Psychosis at Night Increase", "Added psychosis value from Night time"],
    _category,
    [0.1, 1, 0.25, 3],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(unnaturalIncrease),
    "SLIDER",
    ["Unnatural Entities Increase", "Additional psychosis value from strange entities (Anomalies, Spooks, Zombies etc.)"],
    _category,
    [0.1, 1, 0.25, 3],
    1
] call CBA_fnc_addSetting;
