private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(woodCollection),
    "CHECKBOX",
    [LSTRING(WoodCollection), LSTRING(WoodCollectionDesc)],
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
