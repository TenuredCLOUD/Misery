[
    QGVAR(enabled),
    "CHECKBOX",
    ["Misery TPP No NVG's", "Actively disables NVG's if the player is in third person (TPP) trying to use them, can greatly increase difficulty, also levels the playing field..."],
    ["Misery","Server Difficulty"],
    false,
    1,
    {
        params ["_value"];
        if (_value) then {
            GVAR(enabled) = true;
            if (hasInterface) then {
                [] call FUNC(disableNightVision);
            };
        } else {
            GVAR(enabled) = false;
        };
    }
] call CBA_fnc_addSetting;
