private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(turbidWaterChance),
    "SLIDER",
    [LSTRING(TurbidWaterChance), LSTRING(TurbidWaterChanceDesc)],
    _category,
    [0, 100, 0, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(meatDiseaseChance),
    "SLIDER",
    [LSTRING(RawMeatChance), LSTRING(RawMeatChanceDesc)],
    _category,
    [0, 100, 0, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(metabolicCoef),
    "SLIDER",
    [LSTRING(MetabolicCoefficient), LSTRING(MetabolicCoefficientDesc)],
    _category,
    [1, 5, 1, 2],
    1
] call CBA_fnc_addSetting;
