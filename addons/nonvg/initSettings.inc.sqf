private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["No NVG in TPP", "Actively disables NVG's if the player is in third person (TPP) trying to use them. - can greatly increase difficulty, also levels the playing field..."],
    _category,
    false,
    1
] call CBA_fnc_addSetting;
