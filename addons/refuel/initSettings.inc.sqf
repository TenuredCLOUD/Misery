private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(fuelCosts),
    "EDITBOX",
    [LSTRING(FuelPrices), LSTRING(FuelPricesDesc)],
    _category,
    "[150, 50, 500]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(areas),
    "EDITBOX",
    [LSTRING(RefuelingAreas), LSTRING(RefuelingAreasDesc)],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
