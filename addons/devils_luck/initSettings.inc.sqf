private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(gamblingDistance),
    "SLIDER",
    ["Distance check", "Distance that the dealer manager checks for players near dealers in meters"],
    _category,
    [50, 20000, 1000, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(gamblingCycle),
    "SLIDER",
    ["Changing cycle 'Dynamic AI gambling'", "Time in seconds per cycle (default: 1800 - 30 minutes)"],
    _category,
    [1, 86400, 1800, 0],
    1
] call CBA_fnc_addSetting;

