private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

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

[
    QGVAR(economyMode),
    "LIST",
    ["Economy Mode", "Sets trader economy difficulty. Normal: stable market. Depression: brutal."],
    _category,
    [
        ["normal", "recession", "hyperinflation", "depression"],
        ["Normal", "Recession", "Hyperinflation", "Depression"],
        0
    ],
    1,
    {
        params ["_value"];
        switch (_value) do {
            case "normal": {
                GVAR(markup) = 1.1;
                GVAR(markdown) = 0.9;
            };
            case "recession": {
                GVAR(markup) = 1.4;
                GVAR(markdown) = 0.7;
            };
            case "hyperinflation": {
                GVAR(markup) = 2.5;
                GVAR(markdown) = 0.6;
            };
            case "depression": {
                GVAR(markup) = 2.0;
                GVAR(markdown) = 0.4;
            };
        };
    }
] call CBA_fnc_addSetting;
