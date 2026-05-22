private _category = format ["Misery %1", localize LSTRING(Component)];

[
    QGVAR(woodCollection),
    "CHECKBOX",
    [LSTRING(CollectionName), LSTRING(CollectionDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(sawingWood),
    "CHECKBOX",
    [LSTRING(SawingWood), LSTRING(SawingWoodDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(choppingWood),
    "CHECKBOX",
    [LSTRING(ChoppingWood), LSTRING(ChoppingWoodDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(foraging),
    "CHECKBOX",
    [LSTRING(Foraging), LSTRING(ForagingDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
