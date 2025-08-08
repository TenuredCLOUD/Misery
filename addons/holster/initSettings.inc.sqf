private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

// Keybind is bound to "0"
[_category, QGVAR(holster), "Holster weapon", {
    call FUNC(action);
}, {}, [0x0B, [false, false, false]]] call CBA_fnc_addKeybind;
