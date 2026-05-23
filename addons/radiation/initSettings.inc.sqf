private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(areas),
    "EDITBOX",
    [LSTRING(RadioactiveAreas), LSTRING(RadioactiveAreasDesc)],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(radioactiveRain),
    "CHECKBOX",
    [LSTRING(RadioactiveRain), LSTRING(RadioactiveRainDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(radioactiveWater),
    "CHECKBOX",
    [LSTRING(RadioactiveWater), LSTRING(RadioactiveWaterDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
