private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Furniture framework", "Enable furniture placement framework?"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxCarryMass),
    "SLIDER",
    ["Maximum weight allowed", "Maximum weight the player is allowed to carry in Kg"],
    _category,
    [-1, 50, 25, 0],
    1
] call CBA_fnc_addSetting;
