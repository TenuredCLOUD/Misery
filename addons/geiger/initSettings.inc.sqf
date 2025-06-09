#include "\a3\ui_f\hpp\defineDIKCodes.inc"

private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

// Keybind is bound to "K"
[_category, QGVAR(power), "Toggle Geiger", {
        call FUNC(keybind);
}, {}, [37, [false, false, false]]] call CBA_fnc_addKeybind;
