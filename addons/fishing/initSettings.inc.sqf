private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    ["Fishing", "Enable Fishing near open water sources? (Requires fishing rod, bait, hook, and fishing spool...)"],
    _category,
    false,
    1
] call CBA_fnc_addSetting;

// Keybind is bound to "SPACE"
[_category, QGVAR(pullRod), "Pull fishing Rod", {
    call FUNC(pullRod);
}, {}, [57, [false, false, false]]] call CBA_fnc_addKeybind;

// Keybind is bound to "NUMPAD 2"
[_category, QGVAR(reelIn), "Reel In", {
    call FUNC(reelIn);
}, {}, [80, [false, false, false]]] call CBA_fnc_addKeybind;

// Keybind is bound to "NUMPAD 8"
[_category, QGVAR(reelOut), "Reel Out", {
    call FUNC(reelOut);
}, {}, [72, [false, false, false]]] call CBA_fnc_addKeybind;
