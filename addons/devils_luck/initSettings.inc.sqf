private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(gamblingDistance),
    "SLIDER",
    [LSTRING(DistanceCheck), LSTRING(DistanceCheckDesc)],
    _category,
    [50, 20000, 1000, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(gamblingCycle),
    "SLIDER",
    [LSTRING(Cycle), LSTRING(CycleDesc)],
    _category,
    [1, 86400, 1800, 0],
    1
] call CBA_fnc_addSetting;

