private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(enhanced),
    "CHECKBOX",
    [LSTRING(EnhancedGasmasks), LSTRING(EnhancedGasmasksDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(defaultMask),
    "EDITBOX",
    [LSTRING(DefaultSwappedMask), LSTRING(DefaultSwappedMaskDesc)],
    _category,
    "G_AirPurifyingRespirator_01_F",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(rebreatherHoses),
    "CHECKBOX",
    [LSTRING(RebreatherConnections), LSTRING(RebreatherConnectionsDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
