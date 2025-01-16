private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Dynamic Markets", "Enable dynamic markets?"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(marketshiftDistance),
    "SLIDER",
    ["Distance check", "Distance that the shop manager checks for players near traders in meters"],
    _category,
    [50, 20000, 1000, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(marketshiftCycle),
    "SLIDER",
    ["Changing cycle 'Market shift'", "Time in seconds per cycle (default: 3600 - 1 Real time hour)"],
    _category,
    [1, 86400, 3600, 0],
    1
] call CBA_fnc_addSetting;
