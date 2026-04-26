private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(woodCollection),
    "CHECKBOX",
    [LSTRING(CollectionName), LSTRING(CollectionDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(foraging),
    "CHECKBOX",
    [LSTRING(ForagingName), LSTRING(ForagingDesc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
