#include "\a3\ui_f\hpp\defineDIKCodes.inc"

[
    "Misery",
    QGVAR(power),
    "Toggle Geiger",
    {
        call FUNC(keybind);
    },
    {},
    [DIK_K, [false, false, false]]
] call CBA_fnc_addKeybind;
