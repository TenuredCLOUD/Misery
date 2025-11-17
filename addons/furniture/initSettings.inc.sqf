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

[
    QGVAR(rotationIncrement),
    "SLIDER",
    ["Rotational increments", "How much will scrolling rotate furniture during placement (value represents degrees)"],
    _category,
    [1, 360, 15, 0],
    2
] call CBA_fnc_addSetting;

[
    QGVAR(snapToSurface),
    "CHECKBOX",
    ["Surface snapping", "Enable automatic surface snapping during furniture placement?"],
    _category,
    true,
    2
] call CBA_fnc_addSetting;
