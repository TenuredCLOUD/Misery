private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Name), LSTRING(Desc)],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

// Keybind is bound to "SPACE"
[_category, QGVAR(pullRod), LSTRING(PullRod), {
    call FUNC(pullRod);
}, {}, [57, [false, false, false]]] call CBA_fnc_addKeybind;

// Keybind is bound to "NUMPAD 2"
[_category, QGVAR(reelIn), LSTRING(ReelIn), {
    call FUNC(reelIn);
}, {}, [80, [false, false, false]]] call CBA_fnc_addKeybind;

// Keybind is bound to "NUMPAD 8"
[_category, QGVAR(reelOut), LSTRING(ReelOut), {
    call FUNC(reelOut);
}, {}, [72, [false, false, false]]] call CBA_fnc_addKeybind;
