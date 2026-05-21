private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(woundCost),
    "SLIDER",
    [LSTRING(WoundCost), LSTRING(WoundCostDesc)],
    _category,
    [1, 1000000, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(woundDuration),
    "SLIDER",
    [LSTRING(Duration), LSTRING(DurationDesc)],
    _category,
    [1, 300, 45, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(radiationCost),
    "SLIDER",
    [LSTRING(RadiationCost), LSTRING(RadiationCostDesc)],
    _category,
    [1, 1000000, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(radiationDuration),
    "SLIDER",
    [LSTRING(RadiationDuration), LSTRING(RadiationDurationDesc)],
    _category,
    [1, 300, 30, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(infectionCost),
    "SLIDER",
    [LSTRING(InfectionCost), LSTRING(InfectionCostDesc)],
    _category,
    [1, 1000000, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(infectionDuration),
    "SLIDER",
    [LSTRING(InfectionDuration), LSTRING(InfectionDurationDesc)],
    _category,
    [1, 300, 25, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(parasiteCost),
    "SLIDER",
    [LSTRING(ParasiteCost), LSTRING(ParasiteCostDesc)],
    _category,
    [1, 1000000, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(parasiteDuration),
    "SLIDER",
    [LSTRING(ParasiteDuration), LSTRING(ParasiteDurationDesc)],
    _category,
    [1, 300, 20, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(toxicCost),
    "SLIDER",
    [LSTRING(ToxicityCost), LSTRING(ToxicityCostDesc)],
    _category,
    [1, 1000000, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(toxicDuration),
    "SLIDER",
    [LSTRING(ToxicityDuration), LSTRING(ToxicityDurationDesc)],
    _category,
    [1, 300, 35, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(psychosisCost),
    "SLIDER",
    [LSTRING(PsychosisCost), LSTRING(PsychosisCostDesc)],
    _category,
    [1, 1000000, 500, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(psychosisDuration),
    "SLIDER",
    [LSTRING(PsychosisDuration), LSTRING(PsychosisDurationDesc)],
    _category,
    [1, 300, 40, 0],
    1
] call CBA_fnc_addSetting;
