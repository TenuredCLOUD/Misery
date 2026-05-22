#include "\a3\ui_f\hpp\defineDIKCodes.inc"

private _category = format ["Misery %1", localize LSTRING(Component)];

// Keybind is bound to "K"
[_category, QGVAR(power), LSTRING(Toggle), {
        call FUNC(keybind);
}, {}, [37, [false, false, false]]] call CBA_fnc_addKeybind;
