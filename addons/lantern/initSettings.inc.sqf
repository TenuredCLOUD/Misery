#include "\a3\ui_f\hpp\defineDIKCodes.inc"

private _category = format ["Misery - %1", QUOTE(COMPONENT_BEAUTIFIED)];

[_category, QGVAR(power), "Toggle Lantern", {
    call FUNC(keybind);
}, {}, [DIK_TAB, [false, false, false]]] call CBA_fnc_addKeybind;
