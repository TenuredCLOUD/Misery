#include "\a3\ui_f\hpp\defineDIKCodes.inc"

private _category = format ["Misery %1", localize LSTRING(Component)];

[_category, QGVAR(power), LSTRING(Toggle), {
    call FUNC(keybind);
}, {}, [DIK_TAB, [false, false, false]]] call CBA_fnc_addKeybind;
