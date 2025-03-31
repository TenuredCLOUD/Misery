private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(fuelCosts),
    "EDITBOX",
    ["Fuel prices", "Fuel prices data when purchased at refueling area. Indexed as - [diesel, petrol, jetfuel]"],
    _category,
    "[150, 50, 500]",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(areas),
    "EDITBOX",
    ["Refueling Areas", "ELLIPSE or RECTANGLE marker names covering the refueling area as strings ['Refuel_1', 'Refuel_2']"],
    _category,
    "[]",
    1
] call CBA_fnc_addSetting;
