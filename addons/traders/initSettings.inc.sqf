private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(marketshiftDistance),
    "SLIDER",
    [LSTRING(DistanceCheck), LSTRING(DistanceCheckDesc)],
    _category,
    [50, 20000, 1000, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(marketshiftCycle),
    "SLIDER",
    [LSTRING(MarketShift), LSTRING(MarketShiftDesc)],
    _category,
    [1, 86400, 3600, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(economyMode),
    "LIST",
    [LSTRING(EconomyMode), LSTRING(EconomyModeDesc)],
    _category,
    [
        [LSTRING(Normal), LSTRING(Recession), LSTRING(Hyperinflation), LSTRING(Depression)],
        [LSTRING(NormalDesc), LSTRING(RecessionDesc), LSTRING(HyperinflationDesc), LSTRING(DepressionDesc)],
        0
    ],
    1,
    {
        params ["_value"];
        switch (_value) do {
            case LSTRING(Normal): {
                GVAR(markup) = 1.1;
                GVAR(markdown) = 0.9;
            };
            case LSTRING(Recession): {
                GVAR(markup) = 1.4;
                GVAR(markdown) = 0.7;
            };
            case LSTRING(Hyperinflation): {
                GVAR(markup) = 2.5;
                GVAR(markdown) = 0.6;
            };
            case LSTRING(Depression): {
                GVAR(markup) = 2.0;
                GVAR(markdown) = 0.4;
            };
        };
    }
] call CBA_fnc_addSetting;
