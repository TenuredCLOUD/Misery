private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Ravage Zombie infection", "Allow Zombies to inflict disease? (Requires Ravage Zombie Module)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(chance),
    "SLIDER",
    ["Ravage Zombie Infection chance", "% chance per zombie hit to become infected..."],
    _category,
    [0, 100, 0, 0],
    1
] call CBA_fnc_addSetting;
